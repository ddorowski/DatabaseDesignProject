LOAD DATA 
INFILE 'C:\oracle\ora92\bin\produkt.csv'
INTO TABLE PRODUKT
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_produkt,
	id_producent,
	kategoria,
	nazwa
)