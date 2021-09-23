LOAD DATA 
INFILE 'C:\oracle\ora92\bin\kod_pocztowy.csv'
INTO TABLE KOD_POCZTOWY
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_kod_pocztowy,
	id_miasto,
	nazwa
)