LOAD DATA 
INFILE 'C:\oracle\ora92\bin\kraj.csv'
INTO TABLE KRAJ
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_kraj,
	nazwa 
)