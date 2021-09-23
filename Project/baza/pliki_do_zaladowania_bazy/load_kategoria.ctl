LOAD DATA 
INFILE 'C:\oracle\ora92\bin\kategoria.csv'
INTO TABLE KATEGORIA
REPLACE 
FIELDS TERMINATED BY ";"
(
	kategoria,
	nadkategoria
)