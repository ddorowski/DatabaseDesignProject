LOAD DATA 
INFILE 'C:\oracle\ora92\bin\klient.csv'
INTO TABLE KLIENT
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_klient,
	id_ulica,
	imie,
	nazwisko,
	nr_tel,
	email
)