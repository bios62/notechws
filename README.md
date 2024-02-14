# NO  TECH Workshop 28.02.2024

Material for Oracle Norway Tech Community Iot/ORDS/REST/ML workshop 28.02.2024
  
Brought to you by:  
Frode Pedersen, frode.pedersen@oracle.com  
Inge Os, inge.os@oracle.com   
  
# Summary

The target of the workshop is to learn how you may integrate autonomous database with machine learning and edge devices in a secure way.

The workshop bases the AI Predictions on data collected with a BMW i5 EV from Oslo to Spain, collecting speed, temperature, power consumption in KWH, altitude and location.
The collected data is the use to generate a ML based regression, for predicting power consumption based on speed and temperature.
The real-time temperature and speed is collected via a microcontroller programmed with micro Python, feeding real-time data into Autonomous Database 
via REST, the prediction is then visualized and presented to the user on a mobile device with APEX.
As the IoT world might be dangerous, it is important to protect the database, so only the required REST AP is exposed to the IoT device.  
  

![Workflow diagram](images/lab_flow3.jpg?raw=true "Lab Flow")
  
Below is some screenshots from the APEX app we will install:  

![Apex app](images/apex_app.jpg)

# Secure communication with Oracle Database over REST

Oracle Data Rest Services, ORDS, is the technology for exposing and updating data in an Oracle Autonomous Database via REST Services.  
ORDS is a major security feature, and the most important properties of ORDS from a security point of view are:  
-	No SQL connection is exposed, only REST. Developer can select and manipulate data with REST, and the SQL connection is not exposed.  
-	All Communication is over HTTPS; a protocol that is easy to route and can be routed through Next Generation Firewalls like the Palo Alto powered OCI Firewall.  
-	Most important, it is the developer of the RST API that defines the SQL statement or PL/SQL statement behind the REST API. No other SQL will be permitted, and the SQL behind the REST service is not exposed.  
-	Authentication and authorization are under control of either the ORDS server, with OAUTH or under the control of the Autonomous database authentication and authorization.  
Where do ORDS differ from building yours own API written in a language like node.js or Python? The main difference is a) the security and b) the simplicity. You write no other code than PL/SQL or SQL that is behind the REST API, ORDS via metadata handles the rest.  
In this lab we will demonstrate how you easily can add database updates from a tiny IoT edge to Autonomous via ORDS REST API, apply Machine Learning on the data, protected by the authorization of the Autonomous Database, and visualize the data in a simple secure APEX application.  

![Autonomous ORDS security Architecture](images/ords-architecture.jpg)  
  
  # Oracle OCI Next Generation Firewall

In interest of time, configuration of the Firewall, and building a complete OCI network with the NGFW is not a part of the lab.
The architecture can easily be extended run Oracle ATP on a private IP only and filter all ORDS REST API through the NGFW.
For details please refer to: [OCI Network Firewall](https://docs.oracle.com/en/solutions/oci-network-firewall/index.html#GUID-875E911C-8D7D-4205-952B-5E8FAAD6C6D3)  

![OCI NGFW](images/oci-network-firewall-arch.png)  


# Using Machine Learning and predictions in Autonomous Database

# Workshop goal

The aim for the workshop is to build a Mobile APEX application that consumes sensor data,
and based on the sensor data applies Machine Learning to create a prediction.
  
The prediction will be visualized in APEX
  
As Sensor we use an Arduino device with micro python that posts sensordata via REST to an autonomous database.
  
The sensor collects data and ingest into a logtable, vs. the APEX application extract the latest log data
and display the predictions.
  
As sample data we will use a set of data collected from a BMW EV from a trip from Oslo to Spain,
that is uploaded into the Autonomous DB, and the appl Oracle DB built in machine learning, ML.
  
For the lab you may either use a python script where the sensordata is manually entered or use the micro python code from the device.
  


## Workshop part 1

In this lab we will create tables and upload training data  
[Instructions Lab 1](labs/lab1.md)

## Workshop part 2

In this lab you will create the different AI ML models, and test/verify your models  
[Instructions Lab 2](labs/lab2.md)

##  Workshop part 3

Add REST services, for adding current speed and current temp, as basis for predictions    

The following API will be added:  

```
POST /wsapi/tempkmh  
POST /wsapi/temp  
POST /wsapi/kmh  
GET /wsapi/tempkmh
GET /wsapi/predict?kmh=xxx&temp=xxx
```

[Instructions Lab3](labs/lab3.md)

## Workshop part 4

Python Lab  
In this lab the Arduino temp sensor will be used to report current temp to the logdata table  
The Arduino does not have a speed sensor, and the REST API used is /wsapi/temp that supplements the logdata record with the most recent value from the current_speed table.  
During the lab, current_speed may be changed to generate different values in the logdata table  
  
As an alternative to usage of an Arduino, a python script is supplied to interactively update the logtable with the /wsapi/tempkmh API  
  
[Instructions Lab 4](labs/lab4.md)

## Workshop part 5

In this lab you will logon to your apex envrionment and upload an APEX application that displays the predicted power consumption at the current temp/speed.
  
You have a predefined APEX workspace, with the same username/password as your database actions username/password

[Instructions Lab 5](labs/lab5.md)  

## Workshop part 6

Simulate or add real sensordata
Run APEX app and visualize prediction  

## Links and supporting documentation

[Arduino developer environment] (https://link-url-here.org)https://codewith.mu/)

  
## Pictures

  

  
![Arduino](images/arduino.jpg?raw=true "Title")
  
  The device
  
  
![BMW](images/bmw.jpg?raw=true "Title")
  
  Der Wagen