LOAD DATA 
INFILE 'C:\oracle\ora92\bin\wojewodztwo.csv'
INTO TABLE WOJEWODZTWO
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_wojewodztwo,
	id_kraj,
	nazwa
)