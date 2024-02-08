# Lab 3 instructions, Build ORDS REST API


## Build ORDS REST API with script

Copy/paste the script create_ords[create ords script](../files/create_ords.sql) into dbactions, and run as script, or do the interactive lab

## Interactive instructions, ORDS creation

Create ORDS module
Navigate to the ORDS screen in dbactions  

![ORDS Screen](../images/ords1.JPG)

![ORDS Screen](../images/ords2.JPG)

Slect modules from top menu  

![ORDS Screen](../images/ords3.JPG)
  
Clik crate module, enter name "workshop", leave the rest, click create  

![ORDS Screen](../images/ords4.JPG)
  
Module created  

![ORDS Screen](../images/ords5.JPG)
  
Click on "create teplate"  

![ORDS Screen](../images/ords6.JPG)
  
Enter Template name "tempkmh", click create  

![ORDS Screen](../images/ords7.JPG)
  
Select create handler, select POST and add PL/SQL statement  

'begin insert into logdata (temp,kmh) values(:temp,:kmh); commit; end;
  ![ORDS Screen](../images/ords12.JPG)
  
Select on MIMEs Allowed  

![ORDS Screen](../images/ords14.JPG)
  
Well done, first API created  
![ORDS Screen](../images/ords15.JPG)

![ORDS Screen](../images/ords16.JPG)
