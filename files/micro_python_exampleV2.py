# SPDX-FileCopyrightText: 2021 Kattni Rembor for Adafruit Industries
# SPDX-License-Identifier: MIT
"""CircuitPython blink example for built-in NeoPixel LED"""
import gc
import wifi  # should be first to reduce of memory issues
import time
import alarm
import time
import board
import neopixel
import ssl
import socketpool
import adafruit_requests
import adafruit_ahtx0
import supervisor
import microcontroller

#
# Globals
#
wifi_networks=["penelope":["wifinamename":"penelope2021","ssid":"penelope2004"],"network2":["wifinamename":"name","ssid":"ssid"]]

# JSON_POST_URL = https://hikomo1xnp7z6id-jsonws.adb.eu-frankfurt-1.oraclecloudapps.com/ords/user25/wsapi/temp
JSON_POST_URL = https://wmddqsjvrtzzsph-adw.adb.eu-frankfurt-1.oraclecloudapps.com/ords/admin/sensorapi/
# JSON_POST_URL = https://wmddqsjvrtzzsph-adw.adb.eu-frankfurt-1.oraclecloudapps.com/ords/adminx/sensorapi/

debug_level=0

def cleanup_memory(text=None):

    if debug_level>0:
        if not text is None:
            print("Memfree label: "+text,end=' ')
        pregc_freemem=gc.mem_free()
    gc.collect()
    postgc_freemem=gc.mem_free()
    if debug_level>0:
        print("Pre gc mem: "+str(pregc_freemem)+" post gc mem: "+str(postgc_freemem))
    return postgc_freemem



def my_function(microcelsius):
 
    myobj = {"objectname": "PYTHON", "sensorname": "TempMC", "sensorvalue": microcelsius}
    # myobj = {"temp": mc}
    print(myobj)
    print("Hello from a function")
    print("\nPost Autonomous...")
    cleanup_memory()
    try:
        pool = socketpool.SocketPool(wifi.radio)
        requests = adafruit_requests.Session(pool, ssl.create_default_context())
    except:
        print("\nrequests error - exception")
    try:
        # header={"Content-Type": "application/json"}
        print("-" * 40)
        # print(f"Test prediction: {response.json()}")
        # response = requests.post(JSON_POST_URL, header=header, json=myobj)
        response = requests.post(JSON_POST_URL, json=myobj)
        if response.status_code == 201:
            print("\nPost Autonomus - OK - Green 30 sec")
            return 201
        else:
            print("-" * 40)
            print(response.status_code)
            print("-" * 40)
            # print(f"Test prediction: {response.json()}")
            print("\nPost Autonomus - ERROR - Orange 30 sec")
            cleanup_memory()
            time.sleep(30)
            return response.status_code
    except Exception as e:
        print(e)
        print("\nPost Autonomous - Exception - Red")

        time.sleep(10)
        supervisor.reload()
    return -1

def connect_to_wifi():
    wifi_found=False
    for wifinet in wifi_networks:
        try:
            wifi.radio.connect(wifi_networks[wifinet]['wifinamename'], wifi_networks[wifinet]['ssid'])
            connectWiFi = True
            print(f"\nConnected to :"+wifinet)
            print(connectWiFi)
            print(f"My IP address: {wifi.radio.ipv4_address}")
            pixel.fill((255, 0, 255))
            time.sleep(2.0)
            wifi_found=True
        except:
            print("\nConnect to network - failed")
            print("Available WiFi networks:")
            cleanup_memory()
    if not wifi_found:
            printWifi()



def printWifi():
    for network in wifi.radio.start_scanning_networks():
        print(
            "\t%s\t\tRSSI: %d\tChannel: %d"
            % (str(network.ssid, "utf-8"), network.rssi, network.channel)
        )
    wifi.radio.stop_scanning_networks()


def main():
    print("\nstart:version 240218J")
    pixel = neopixel.NeoPixel(board.NEOPIXEL, 1)
    cleanup_memory()
    hostname = 'QTPY' + str(int.from_bytes(microcontroller.cpu.uid, 'little') >> 29)
    print (hostname)
    print("\nStart - white->green")
    for x in range(255):
        pixel.fill((255 - x, 255, 255 - x))
        time.sleep(0.025)
    restartCnt = 0
    time.sleep(10.0)
    while True:
        current_memory=cleanup_memory()

        if current_memory < 2006000:
            print(f"\nMemory restart -Green->Red")
            for x in range(255):
                pixel.fill((x, 255 - x, 0))
                time.sleep(0.025)
            supervisor.reload()

        restartCnt = restartCnt + 1
        print(f"restartCnt: {restartCnt} ")
        if restartCnt > 10:
            print("restart - restartCnt - white 20 sec")
            cleanup_memory()
            pixel.fill((255, 255, 255))
            time.sleep(20.0)
            supervisor.reload()
        print("\nLoop Start - white 2 sec")
        connectWiFi = False
        pixel.fill((255, 255, 255))
        time.sleep(2.0)
        print(f"My MAC address: {[hex(i) for i in wifi.radio.mac_address]}")

        pixel.fill((0, 255, 255))
        time.sleep(2.0)

        print(f"Connecting to penelope2021")

        pixel.fill((255, 255, 0))
        time.sleep(2.0)
        mc = 22
        try:
            i2c = board.STEMMA_I2C()
            aht20 = adafruit_ahtx0.AHTx0(i2c)
            data = [aht20.temperature, aht20.relative_humidity]
            print("\nTemperature: %0.1f C" % aht20.temperature)
            mc = int(aht20.temperature * 1000)
            # mc = aht20.temperature
            print("\nTemperature mc: %0.1f C" % mc)
            print("\nHumidity: %0.1f %%" % aht20.relative_humidity)
            print()
        except:
            print("\nNo sensor - default temperature:%0.1f C" % mc)
            print("Yellow/Red - Blink")
            pixel.fill((255, 255, 0))
            time.sleep(1.5)
            pixel.fill((255, 0, 0))
            time.sleep(1.5)
            pixel.fill((255, 255, 0))
            time.sleep(1.5)
            pixel.fill((255, 0, 0))
            time.sleep(1.5)
        pixel.fill((255, 255, 0))
        print("Yellow")
        time.sleep(1.5)

        if connectWiFi:
            print("\nPost Autonomous...")
            cleanup_memory("\nBefore func")
            funcStatus = my_function(mc)
            cleanup_memory("\nAfter func")
            if funcStatus == -1:
                print("\nPost Autonomous - Exception - Red")
                cleanup_memory()
                pixel.fill((255, 0, 0))
                time.sleep(30)
                print ("\nDeep Sleep");
                time_alarm = alarm.time.TimeAlarm(monotonic_time=time.monotonic() + 5)
                alarm.exit_and_deep_sleep_until_alarms(time_alarm)
                print ("\nDeep Sleep");
                time.sleep(5)
                supervisor.reload()
            if funcStatus == 201:
                print("\nPost Autonomus - OK - Green 30 sec")
                cleanup_memory()
                pixel.fill((0, 255, 0))
                time.sleep(30)
                print ("\nDeep Sleep");
                time_alarm = alarm.time.TimeAlarm(monotonic_time=time.monotonic() + 5)
                alarm.exit_and_deep_sleep_until_alarms(time_alarm)
                print ("\nDeep Sleep");
                time.sleep(5)
                supervisor.reload()
            else:
                print("-" * 40)
                # print(response.status_code)
                print("-" * 40)
                # print(f"Test prediction: {response.json()}")
                print("\nPost Autonomus - ERROR - Orange 30 sec")
                cleanup_memory()
                pixel.fill((255, 64, 0))
                time.sleep(30)
                print("\nPost Autonomous - OK - supervisor.reload : Green -> blue")

            for x in range(255):
                pixel.fill((0, 255 - x, x))
                time.sleep(0.025)
            cleanup_memory()
            time_alarm = alarm.time.TimeAlarm(monotonic_time=time.monotonic() + 5)
            alarm.exit_and_deep_sleep_until_alarms(time_alarm)
            supervisor.reload()
        else:
            print("\nPost Autonomous - canceled - no IP - blue")
            cleanup_memory()
            pixel.fill((0, 0, 255))
            time.sleep(10)
        for x in range(255):
            pixel.fill((x, x, x))
            time.sleep(0.01)
            time_alarm = alarm.time.TimeAlarm(monotonic_time=time.monotonic() + 5)
            alarm.exit_and_deep_sleep_until_alarms(time_alarm)

        for x in range(255):
            pixel.fill((x, 255 - x, 0))
            time.sleep(0.025)

if __name__ == "__main__":
        main()