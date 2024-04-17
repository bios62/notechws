-- Step 1

create or replace view mlinput (ID,KMH,KWP100)as (
SELECT KMH,KMH,KWP100 FROM trip
where km>35 -- ignore short drives where initial car heating can disturb.
and mm is null -- ignore drives with rain/snow 
and hoh is null -- ignore the steepest driving up and down mountains
);

-- Do a select to confirm that it returns data:

select * from mlinput;

-- Step 2

-- drop if exists
drop table mlsettingsSVM;   
create table mlsettingsSVM (setting_name varchar2(30), setting_value varchar2(30));

-- Step 3

begin
dbms_data_mining.drop_model(model_name => 'SVM1');
end;
/

--The new Model:

begin
dbms_data_mining.create_model(
model_name => 'SVM1',
MINING_FUNCTION => dbms_data_mining.regression,
data_table_name => 'MLINPUT',
CASE_ID_COLUMN_NAME => 'ID',
TARGET_COLUMN_NAME => 'KWP100',
SETTINGS_TABLE_NAME => 'MLSETTINGSSVM');
end;
/

-- Step 4

SELECT prediction (SVM1 using 100 AS kmh,20 AS CELSIUS) FROM DUAL;

SELECT prediction (SVM1 using 130 AS kmh,20 AS CELSIUS) FROM DUAL;

SELECT prediction (SVM1 using 100 AS kmh,10 AS CELSIUS) FROM DUAL;

-- Step 5

SELECT prediction (SVM1 using 100 AS kmh,20 AS CELSIUS) FROM DUAL;
SELECT prediction (SVM1 using 100 AS kmh,10 AS CELSIUS) FROM DUAL;
create or replace view mlinput (ID,KMH,KWP100)
as (SELECT KMH,KMH,KWP100 FROM trip
where km>35
and mm is null
and hoh is null
);
create or replace view mlinput (ID,KMH,KWP100,CELSIUS)
as (SELECT KMH,KMH,KWP100,CELSIUS FROM trip
where km>35
and mm is null
and hoh is null
);

SELECT prediction (SVM1 using 100 AS kmh,20 AS CELSIUS) FROM DUAL;
SELECT prediction (SVM1 using 100 AS kmh,10 AS CELSIUS) FROM DUAL;

-- Step 6

SELECT prediction (SVM1 using 100 AS kmh,20 AS CELSIUS) FROM DUAL;
SELECT prediction (SVM1 using 100 AS kmh,10 AS CELSIUS) FROM DUAL;

-- Step 7

create or replace FUNCTION predict_consumption (kmh number,celsius number) 
    RETURN NUMBER IS
    query_str VARCHAR2(1000);
    consumption NUMBER;
BEGIN
query_str :='SELECT 
prediction (SVM1 using
:kmh AS kmh,:celsius AS CELSIUS
)FROM DUAL';

    EXECUTE IMMEDIATE query_str
     INTO consumption
     using kmh,celsius;
    RETURN consumption;
END;
/

--And test it:

select predict_consumption(100,20) from dual;

-- Step 8

create or replace view consumption (celsius,kmh30,kmh50,kmh80,kmh120,kmh150,kmh200) as
select '-10' Celsius, 
predict_consumption(30,-10) "30 KMH",
predict_consumption(50,-10) "50 KMH",
predict_consumption(80,-10) "80 KMH",
predict_consumption(120,-10) "120 KMH",
predict_consumption(150,-10) "150 KMH",
predict_consumption(200,-10) "200 KMH"
from dual
union
select '0', predict_consumption(30,0),
predict_consumption(50,0) ,
predict_consumption(80,0) ,
predict_consumption(120,0),
predict_consumption(150,0) ,
predict_consumption(200,0) 
from dual
union
select '10', predict_consumption(30,10),
predict_consumption(50,10),
predict_consumption(80,10),
predict_consumption(120,10),
predict_consumption(150,10),
predict_consumption(200,10)
from dual
union
select '20',predict_consumption(30,20),
predict_consumption(50,20),
predict_consumption(80,20),
predict_consumption(120,20),
predict_consumption(150,20),
predict_consumption(200,20)
from dual;
select * from consumption order by celsius;
drop table consumptionSVM; 
  
create table consumptionSVM as select * from consumption;

select * from consumptionSVM order by celsius;

-- Step 9
 -- ignore if table not exists
drop table mlsettingsGLM;

create table mlsettingsGLM (setting_name varchar2(30), setting_value varchar2(30));

--We will NOT be using Support Vector Machine (SVM) which is the default, but GLM.
--so now, we have to configure the settings:

begin
insert into MLSETTINGSGLM (setting_name, setting_value)  
    values (dbms_data_mining.algo_name, dbms_data_mining.algo_generalized_linear_model);  
end;
/

commit;

--make sure that you have not entered multiple rows with the same parameters:

select * from mlsettingsglm order by setting_name;

--Drop the model if this is not your first attempt:

begin
dbms_data_mining.drop_model(
model_name => 'GLM1');
end;
/

--create the GLM model:

begin
dbms_data_mining.create_model(
model_name => 'GLM1',
MINING_FUNCTION => dbms_data_mining.regression,
data_table_name => 'MLINPUT',
CASE_ID_COLUMN_NAME => 'ID',
TARGET_COLUMN_NAME => 'KWP100',
SETTINGS_TABLE_NAME => 'MLSETTINGSGLM');
end;
/
SELECT prediction (GLM1 using 100 AS kmh,20 AS CELSIUS) FROM DUAL;
SELECT prediction (GLM1 using 100 AS kmh,10 AS CELSIUS) FROM DUAL;

--And compare it to SVM1

SELECT prediction (SVM1 using 100 AS kmh,20 AS CELSIUS) FROM DUAL;
SELECT prediction (SVM1 using 100 AS kmh,10 AS CELSIUS) FROM DUAL;

-- Step 10

create or replace FUNCTION predict_consumption_flex (kmh number,celsius number,modelName varchar2) 
    RETURN NUMBER IS
    query_str VARCHAR2(1000);
    consumption NUMBER;
BEGIN
query_str :='SELECT 
prediction ('||modelName||' using
:kmh AS kmh,:celsius AS CELSIUS
)FROM DUAL';

    EXECUTE IMMEDIATE query_str
     INTO consumption
     using kmh,celsius;
    RETURN consumption;
END;
/

select predict_consumption_flex(100,20,'SVM1') from dual;
select predict_consumption_flex(100,20,'GLM1') from dual;

create or replace FUNCTION predict_consumption (kmh number,celsius number) 
    RETURN NUMBER IS
    query_str VARCHAR2(1000);
    consumption NUMBER;
BEGIN
-- select model by commenting out the not used one:
--RETURN predict_consumption_flex (kmh ,celsius ,'SVM1'); 
RETURN predict_consumption_flex (kmh ,celsius ,'GLM1'); 

END;
/

select * from consumption order by celsius;

--and compare it to the old SVM:

select * from consumptionSVM order by celsius;

drop table consumptionGLM -- if already existing;

create table consumptionGLM as select * from consumption;

-- Step 11

select trip.*,predict_consumption(kmh,celsius),
abs(predict_consumption(kmh,celsius)-kwp100) 
from trip
order by dato,kl;

select trip.*,predict_consumption(kmh,celsius),
abs(predict_consumption(kmh,celsius)-kwp100) 
from trip
order by abs(predict_consumption(kmh,celsius)-kwp100) desc;

select 'SVM',sum(abs(predict_consumption_flex(kmh,celsius,'SVM1')-kwp100)) 
from trip
union all
select 'GLM',sum(abs(predict_consumption_flex(kmh,celsius,'GLM1')-kwp100)) 
from trip;

select 'SVM',sum(abs(predict_consumption_flex(kmh,celsius,'SVM1')-kwp100)) 
from trip
where km>35 and mm is null and hoh is null
union all
select 'GLM',sum(abs(predict_consumption_flex(kmh,celsius,'GLM1')-kwp100)) 
from trip
where km>35 and mm is null and hoh is null;

