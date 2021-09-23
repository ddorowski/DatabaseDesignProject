LOAD DATA 
INFILE 'C:\oracle\ora92\bin\zamowienie.csv'
INTO TABLE ZAMOWIENIE
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_zamowienie,
	id_produkt,
	id_pracownik,
	id_klient,
	data_zakupu date 'dd.mm.yyyy'
)