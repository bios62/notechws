# cegal-ws1502
Material for Cegal workshop 15.02.2024
<br />
The aim for the workshop is to build a Mobile APEX application that consumes sensor data,
and based on the sensor data applies Machine Learning to create a prediction
<br />
The prediction will be visualized in APEX
<br />
As Sensor we use an Arduino device with micro python hat posts sensordata via REST to an autonomous database.
<br />
The sensor collects data and ingest into a logtable, vs. the APEX application extract the latest log data
and display the predictions.
<br />
As sampledata we will use a set of data collected from a BMW EV from a trip from Oslo to Spain,
that is uploaded into the Autonomous DB, and the appl Oracle DB built in machine learning, ML.
<br />
For the lab you may either use a python script where the sensordata is manually entered,or use the micropython code from the device.
<br />
### Workshop flow

![Workflow diagram](images/lab_flow.jpg?raw=true "Title")

## Workshop part 1

Create tables and upload trial data
![Instructions](labs/lab1.md)

## Workshop part 2

Apply and test machine learning

##  Workshop part 3

Add REST services to machine learning function and sensordata upload
![Instructions](labs/lab1.md)

## Workshop part 4

Python Lab, 

Add sensordata with interactive python script
Add sensordata with Arduino device

## Workshop part 5

Install APEX app

# Workshop part 

Simulate or add real sensordata
Run APEX app and visualize prediction

##Links and supporting documentation

[Arduino developer environment](https://link-url-here.org)https://codewith.mu/)

<br />

##Pictures
<br />
Picture of the device
<br />
![Arduino](images/arduino.jpg?raw=true "Title")
<br />
Picture of the car
<br />
![BMW](images/bmw.jpg?raw=true "Title")
