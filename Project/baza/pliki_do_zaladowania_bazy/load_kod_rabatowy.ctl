LOAD DATA 
INFILE 'C:\oracle\ora92\bin\kod_rabatowy.csv'
INTO TABLE KOD_RABATOWY
REPLACE 
FIELDS TERMINATED BY ";"
(
	kod,
	data_waznosci_od date 'dd.mm.yyyy',
	data_waznosci_do date 'dd.mm.yyyy',
	ilosc,
	rabat
)