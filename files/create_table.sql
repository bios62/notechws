drop table collected_data;
CREATE TABLE collected_data 
   (          "DATO" DATE, 
              "KL" NUMBER(38,0), 
              "KM" NUMBER(38,1), 
              "KMH" NUMBER(38,1), 
              "KWP100" NUMBER(38,1), 
              "KW" NUMBER(38,1), 
              "ECO" NUMBER(38,1), 
              "DC" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
              "TARGET" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
              "CC" VARCHAR2(2 BYTE) COLLATE "USING_NLS_COMP", 
              "GEO" VARCHAR2(2 BYTE) COLLATE "USING_NLS_COMP", 
              "CELSIUS" NUMBER, 
              "MM" NUMBER, 
              "HOH" NUMBER(*,0), 
              "HDIF" NUMBER
   )
/

drop table logdata 
  id number,
  tid timestamp,
  kw number,
  kmh number
)
/

