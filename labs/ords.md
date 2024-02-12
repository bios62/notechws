# Lab 3 instructions, Build ORDS REST API


## Build ORDS REST API with script

Copy/paste the script create_ords[create ords script](../files/create_ords.sql) into dbactions, and run as script, or do the interactive lab

## Interactive instructions, ORDS creation

Create ORDS module
Navigate to the ORDS screen in dbactions  

![ORDS Screen](../images/ords1.JPG)

Select modules from top menu  

![ORDS Screen](../images/ords2.JPG)

![ORDS Screen](../images/ords3.JPG)
  
Clik create module, enter name "workshop", leave the rest, click create  

![ORDS Screen](../images/ords4.JPG)
  
Module created, In the workshop title, select create template

![ORDS Screen](../images/ords5.JPG)

You will now create the tempkmh REST API with POST  
Click on "create template"  

![ORDS Screen](../images/ords6.JPG)
  
Enter Template name "tempkmh", click create  

![ORDS Screen](../images/ords7.JPG)
  
Click create handler, select POST and add PL/SQL statement:  

`begin insert into logdata (temp,kmh) values(:temp,:kmh); commit; end;`  

![ORDS Screen](../images/ords8.JPG)
 
![ORDS Screen](../images/ords9.JPG)

Navigate to MIMEs allowed and select application/json and click add  
  
![ORDS Screen](../images/ords10.JPG)

![ORDS Screen](../images/ords11.JPG)

![ORDS Screen](../images/ords12.JPG)

The first REST API handlers is complete

![ORDS Screen](../images/ords13.JPG)

Well done, first API created, navigate back to "workshop"    
  
![ORDS Screen 14](../images/ords14.JPG)
  
Repeat the steps for creating the temp REST API with POST  

![ORDS Screen](../images/ords15.JPG)

![ORDS Screen](../images/ords16.JPG)

Enter the PL/SQL below in the handler:  

`begin insert into logdata (temp) values(:temp); commit; end;` 

![ORDS Screen](../images/ords16.JPG)

![ORDS Screen](../images/ords17.JPG)

![ORDS Screen](../images/ords18.JPG)

![ORDS Screen](../images/ords19.JPG)

The REST API temp is added.  

![ORDS Screen](../images/ords20.JPG)  

Repeat the steps and add REST API kmh, POST. 
Add the following PL/SQL in the POST handler:  
`begin insert into current_speed (kmh) values(:kmh); commit; end;` 

![ORDS Screen](../images/ords21.JPG)

![ORDS Screen](../images/ords22.JPG)

![ORDS Screen](../images/ords23.JPG)

![ORDS Screen](../images/ords24.JPG)

![ORDS Screen](../images/ords25.JPG)

The last REST API, preditct GET deviates a bit.  
This REST API select ad value with a PL/SQL having two input query parameters

Repeat the steps and add REST API predict, GET. 
Add the following PL/SQL in the POST handler:  
`begin :p_result:=predict_consumption(:p_kmh,:p_temp); end;` 

![ORDS Screen](../images/ords30.JPG)

![ORDS Screen](../images/ords31.JPG)

![ORDS Screen](../images/ords32.JPG)

![ORDS Screen](../images/ords33.JPG)

![ORDS Screen](../images/ords34.JPG)

The GET REST API needs to define the return value from the PL/SQL function as a parameter  
Create the parameter:  

![ORDS Screen](../images/ords34.JPG)

![ORDS Screen](../images/ords35.JPG)



