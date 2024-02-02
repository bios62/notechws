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


##Links and supporting documentation

[Arduino developer environment](https://link-url-here.org)https://codewith.mu/)


Picture of the device
![Alt text](images/arduino.jpg?raw=true "Title")
Picture of the car
![Alt text](images/bmw.jpg?raw=true "Title")
