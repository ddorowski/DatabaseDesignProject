LOAD DATA 
INFILE 'C:\oracle\ora92\bin\czas.csv'
INTO TABLE CZAS
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_czas,
	data date 'dd.mm.yyyy'
)