LOAD DATA 
INFILE 'C:\oracle\ora92\bin\miasto.csv'
INTO TABLE MIASTO
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_miasto,
	id_wojewodztwo,
	nazwa
)