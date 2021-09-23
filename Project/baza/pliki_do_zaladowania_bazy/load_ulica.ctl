LOAD DATA 
INFILE 'C:\oracle\ora92\bin\ulica.csv'
INTO TABLE ULICA
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_ulica,
	id_kod_pocztowy,
	nazwa
)