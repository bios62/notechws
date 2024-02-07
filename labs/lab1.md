# Lab 1 instructions

You will get username, password and URL to the autonomous database from the instructor  

Assume your userid is user25 and your password is password25.  
With the URL to Autnomous like : https://hiokitiiixxxx-jsonws.adb.eu-frankfurt-1.oraclecloudapps.com 
The formal structure of the URL to database actions is:  

`https://<URL to autnomous>/ords/<dbusername>/_sdw/?nav=worksheet

The URL to database actions, with SQL, ML and ORDS in this example will be:
`jsonws.adb.eu-frankfurt-1.oraclecloudapps.com/ords/user25/_sdw/?nav=worksheet  

3 tables are needed for the labs:  
.collected_data  the data collection used for Machine Learning
.logdata         dataletion from "car" aka device
.current_speed   Teh device used in the lab only collects temp. When inserting into logd data if kmh is missing, the insert will fetch from current_speed

Logon and navigate to SQL:

![DB Actions](images/dbactions.JPG)


Download the script create_tables.sql and run it from dbactions, eitehr by copy/paste into 
sql area and run script, or run from the file  
  
![DB Actions](images/dbactions2.JPG)

