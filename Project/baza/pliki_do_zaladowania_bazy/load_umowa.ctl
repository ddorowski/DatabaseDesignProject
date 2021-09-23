LOAD DATA 
INFILE 'C:\oracle\ora92\bin\umowa.csv'
INTO TABLE UMOWA
REPLACE 
FIELDS TERMINATED BY ";"
(
	id_umowa,
	rodzaj_umowy,
	pensja,
	data_od date 'dd.mm.yyyy',
	data_do date 'dd.mm.yyyy'
)