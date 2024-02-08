# Lab 3 instructions

## Purpose of lab

The prprose of this lab is to enable ORDS API.
The lab will create the follwoing API

`POST /wsapi/tempkmh`    insert into logdata, payload: `'{kmh:<current speed>,"temp":<current temp>}'`
`POST /wsapi/temp`    insert into logdata, payload: `'{"temp":<current temp>}'`, the API adds latest value from current_speed as defautl value for kmh
`POST /wsapi/kmh`  insert into current_speed, payload: `'{kmh:<current speed>}'` insert new defalt vale for speed, to be consumed by /wsapi/temp
`GET /wsapi/tempkm` fetches 25 latest records in the logdata table

## Prerequsite

Complete lab 1

## Instructions

The lab consist of two elements:
- load the training data
- build the ORDS environment


## Upload training data for machinelearning

Locate the file kjoredataV2.xlsx on your cloned git repo

Run the instructions from ![Instructions](labs/dataload.md)

## Create the ORDS REST Envrionment

Run the instructions from ![Instructions](labs/ords.md)

## Verification of the ORDS REST API with curl

```
curl -i -X POST -d '{"kmh":33}' -H 'Content-Type: application/json' https://<my adb url>.adb.eu-frankfurt-1.oraclecloudapps.com/ords/user25/wsapi/kmh
curl -i -X POST -d '{"kmh":34,"temp":17}' -H 'Content-Type: application/json' https://<my adb url>.adb.eu-frankfurt-1.oraclecloudapps.com/ords/user25/wsapi/tempkmh
curl -i -X POST -d '{"temp":18}' -H 'Content-Type: application/json' https://<my adb url>.adb.eu-frankfurt-1.oraclecloudapps.com/ords/user25/wsapi/temp
curl  -X GET -H 'Content-Type: application/json' https://<my adb url>.adb.eu-frankfurt-1.oraclecloudapps.com/ords/user25/wsapi/tempkmh | jq '.'
```

