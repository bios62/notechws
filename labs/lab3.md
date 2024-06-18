# Lab 3 instructions

## Purpose of lab

The purpose of this lab is to build and enable ORDS API.
The lab will create the following API:

`POST /wsapi/tempkmh`    insert into logdata, payload: `'{kmh:<current speed>,"temp":<current temp>}'`  
`POST /wsapi/temp`    insert into logdata, payload: `'{"temp":<current temp>}'`, the API adds latest value from current_speed as default value for kmh  
`POST /wsapi/kmh`  insert into current_speed, payload: `'{kmh:<current speed>}'` insert new defalt vale for speed, to be consumed by /wsapi/temp  
`GET /wsapi/tempkmh` fetches 25 latest records in the logdata table  

## Prerequsite

Complete lab 1

Ensure the predict_consumption PL/SQL procedure was successfully created in lab 2.

## Instructions

The lab gives step by step instruction on how to in build the REST APIs.

## Build ORDS REST API with script

Copy/paste the script [](../files/create_ords.sql) into dbactions, and run as script, or do the interactive lab

## Create the ORDS REST Envrionment interatively

Run the instructions from ![Instructions](ords.md)

## Verification of the ORDS REST API with curl

There is a prebuilt script [verify_ords.bash](../files/verify_ords.bash) that can be used for verification  
Edit the lines with correct values:  

```
URL=https://myautonomous.adb.us-phoenix-1.oraclecloudapps.com
USER=demouser03
```
Example run:  
```
curl -i -X POST -d '{"temp":18,"kmh":37}' -H 'Content-Type: application/json'
 https://myautonomous.adb.eu-frankfurt-1.oraclecloudapps.com/ords/user25/wsapi/tempkmh
HTTP/1.1 200 OK
Date: Mon, 17 Jun 2024 12:24:26 GMT
Transfer-Encoding: chunked
Connection: keep-alive
Strict-Transport-Security: max-age=31536000;includeSubDomains
X-Content-Type-Options: nosniff
X-Request-ID: d09f988970a658f49508dd94716eb496
```

## Test a prediction with python

Edit the script [getprediction.py](../files/getprediction.py) and add the correct values for.  

```
atp_url='https://<your ATP URL>'
atp_username='<your username>'
```
and execute:
```
python getprediction.py 86 2.2
{"result": "40"}
Estimated range: 40
```

