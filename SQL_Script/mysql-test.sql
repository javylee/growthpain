use UOCTEST;
CREATE TABLE SITEMON_DATA( 
    SITE_LOC VARCHAR(9), 
    NAME VARCHAR(15), 
    UNAVAILABILITY VARCHAR(15), 
    THRESHOLD VARCHAR(15), 
    TIMESTAMP TIMESTAMP 
);

alter table SITEMON_DATA add primary key(name);

select * from SITEMON_DATA;
describe SITEMON_DATA;

load data infile '/tmp/MyCSV.txt'   
into table SITEMON_DATA    
fields terminated by ','  optionally enclosed by '"' escaped by '"'   
lines terminated by '\r\n';  