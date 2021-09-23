LOAD DATA 
INFILE 'C:\oracle\ora92\bin\stanowisko.csv'
INTO TABLE STANOWISKO
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_stanowisko,
	nazwa,
	opis
)