LOAD DATA 
INFILE 'C:\oracle\ora92\bin\sprzedaz.csv'
INTO TABLE SPRZEDAZ
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_sprzedaz,
	id_sklep,
	id_czas,
	id_zamowienie,
	koszt_calkowity,
	data_dostarczenia date 'dd.mm.yyyy'
)