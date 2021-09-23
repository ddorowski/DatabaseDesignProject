LOAD DATA 
INFILE 'C:\oracle\ora92\bin\produkt_w_sklepie.csv'
INTO TABLE Produkt_w_sklepie
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_sklep,
	id_produkt,
	cena,
	ilosc
)