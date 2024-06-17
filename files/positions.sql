--------------------------------------------------------
--  File created - Monday-June-17-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table POSITIONS
--------------------------------------------------------

  CREATE TABLE POSITIONS
   (	"DATO" TIMESTAMP (6), 
	"KL" NUMBER, 
	"TARGET" VARCHAR2(4000 BYTE) COLLATE "USING_NLS_COMP", 
	"LAT" NUMBER, 
	"LON" NUMBER
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
REM INSERTING into POSITIONS
SET DEFINE OFF;
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),619,'Ringdalskogen-Ionity',59.1591952448499,10.113318781474186);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),733,'Color Line Larvik',59.12696972706097,10.226807979538783);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1320,'Nørager',56.85837054047134,9.725290938602994);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1418,'randers',56.45053685532228,9.998722715990032);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1536,'fredericia',55.66381156863515,9.551000025867651);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1623,'rødekro-Ionity',55.067104753936455,9.36558501464603);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1932,'hamburg',53.554706036654835,10.009181114039613);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('24-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2149,'egestorf',53.16219212058309,10.061798088649445);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('25-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),801,'braunautal',53.10970225312625,9.982204356139615);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('25-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1043,'oelde',51.81245221959253,8.13158541922025);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('25-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1413,'nurburgring',50.3338359294378,6.947225396920934);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('25-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1607,'eifeldorf',50.331084346902756,6.94573256073072);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('25-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1746,'salmtal',49.920985456455554,6.856371719902039);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('25-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1935,'hauconcourt',49.21486242768719,6.172185413011539);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('25-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2236,'fontaines',47.816564195624956,5.22288320608326);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),58,'saint-albain',46.42036039813599,4.863539714308925);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),419,'allan',45.2755651147692,4.825561932562215);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),739,'salles d aude',43.21614703092631,3.0897246651840615);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),951,'vilobi',41.89997925555633,2.76982102519338);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1245,'les borges',41.17242206797308,1.0201992219383431);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1358,'montsant',41.17242206797308,1.0201992219383431);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1437,'cornudella de montsant',41.26160524171253,0.9420653642019584);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1547,'vimbodi',41.4053695843782,1.0388465388809933);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1644,'vila-sana',41.647332170677004,0.9306685342444865);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('26-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1754,'lleida',41.61321206763038,0.6254040930391863);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('27-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1359,'fraga',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('27-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1549,'l aldea',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('27-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1745,'burriana',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('27-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1920,'ondara',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('27-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2146,'villajoyosa',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),34,'puerto lumbreras',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),244,'cullar',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),443,'zafayona',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),745,'casabermeja',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),924,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1037,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1045,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1110,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1237,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1610,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('28-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2031,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('29-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),957,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('29-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1456,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('29-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1659,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('29-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1952,'torremolinos',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('30-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1256,'el ejido',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('30-NOV-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1617,'cartagena',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('01-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1307,'orihuela',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('01-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1537,'villajoyosa',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('01-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1824,'castellan',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('01-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2010,'l''ldea',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('01-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2142,'vila-secs',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('01-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2204,'vila-seca',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('01-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2213,'vila-seca',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1145,'reus',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1315,'cornudella de montsant',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1522,'lo cami ral',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1743,'llobregat',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1809,'palloja',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2003,'aiguaviva',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2208,'agde',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('02-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2216,'agde',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),102,'allan',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),354,'dagneux',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),553,'arlay',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),837,'ecot',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1110,'mahlberg',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1354,'stuttgart',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1719,'ilsfeld',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('03-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1820,'heilbronn',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('04-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1328,'eichenzell',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('04-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1558,'sessen',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('04-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1910,'todendorf',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('04-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2039,'lubeck',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('05-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1057,'fehmarn',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('05-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1244,'vordingborg',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('05-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1353,'mosede',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('05-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1713,'varberg',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('05-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),1843,'lindome',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('05-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2139,'strømstad',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('05-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),2253,'rygge',null,null);
Insert into POSITIONS (DATO,KL,TARGET,LAT,LON) values (to_timestamp('06-DEC-23 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),50,'hjemme',null,null);
commit;