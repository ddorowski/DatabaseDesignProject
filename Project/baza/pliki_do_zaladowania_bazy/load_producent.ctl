LOAD DATA 
INFILE 'C:\oracle\ora92\bin\producent.csv'
INTO TABLE PRODUCENT
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_producent,
	nazwa 
)