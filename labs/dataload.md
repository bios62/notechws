# Dataload, load trainingdata from Excel with Database actions  

There are two wasys of loading data into the trip table:  
- WIth the dataloader from excel
- By SQL from preseeded table. Use this option in case you won't spend to much time of the excel part of the lab

Navigate to Database Actions and click on data load

![DataLoad d11](../images/dl1.jpg)

Drag and drop kjoredataV2.xlsx into the file area, and click on upload

![DataLoad d12](../images/dl2.jpg)

Select settings

![DataLoad d13](../images/dl3.jpg)

Accept defaults an click next

![DataLoad d14](../images/dl4.jpg)

Change to load into existing table trip, correct date format, save settings

![DataLoad d15](../images/dl5.jpg)

Run the upload

![DataLoad d16](../images/dl6.jpg)

Upload completed without errors, verify number of rows, 82 rows should be loaded into trip

![DataLoad d17](../images/dl7.jpg)

### Load from preseeded table

Execute the following commands from SQL Developer if the trip table exists:   
```
truncate table trip;
insert into trip (select * from workshop_trip);
commit;
```
  
If the trip table do not exists, just use CTAS:  

```
create table trip as select * from workshop_trip;
```







