LOAD DATA 
INFILE 'C:\oracle\ora92\bin\sklep.csv'
INTO TABLE SKLEP
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_sklep,
	id_ulica,
	telefon
)