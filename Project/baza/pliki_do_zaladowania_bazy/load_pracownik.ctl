LOAD DATA 
INFILE 'C:\oracle\ora92\bin\pracownik.csv'
INTO TABLE PRACOWNIK
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_pracownik,
	id_sklep,
	id_stanowisko,
	id_umowa,
	id_ulica,
	imie,
	drugie_imie,
	nazwisko,
	data_urodzenia date 'dd.mm.yyyy',
	pesel,
	nr_tel_1,
	email
)