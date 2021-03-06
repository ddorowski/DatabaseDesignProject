DROP TABLE Sprzedaz CASCADE CONSTRAINTS;
DROP TABLE Zamowienie CASCADE CONSTRAINTS;
DROP TABLE Klient CASCADE CONSTRAINTS;
DROP TABLE Kod_rabatowy CASCADE CONSTRAINTS;
DROP TABLE Czas CASCADE CONSTRAINTS;
DROP TABLE Pracownik CASCADE CONSTRAINTS;
DROP TABLE Umowa CASCADE CONSTRAINTS;
DROP TABLE Stanowisko CASCADE CONSTRAINTS;
DROP TABLE Produkt_w_sklepie CASCADE CONSTRAINTS;
DROP TABLE Produkt CASCADE CONSTRAINTS;
DROP TABLE Producent CASCADE CONSTRAINTS;
DROP TABLE Kategoria CASCADE CONSTRAINTS;
DROP TABLE Sklep CASCADE CONSTRAINTS;
DROP TABLE Ulica CASCADE CONSTRAINTS;
DROP TABLE Kod_pocztowy CASCADE CONSTRAINTS;
DROP TABLE Miasto CASCADE CONSTRAINTS;
DROP TABLE Wojewodztwo CASCADE CONSTRAINTS;
DROP TABLE Kraj CASCADE CONSTRAINTS;

CREATE TABLE Kraj
(
  id_kraj INT PRIMARY KEY,
  nazwa VARCHAR2(45)
);

CREATE TABLE Wojewodztwo
(
  id_wojewodztwo INT PRIMARY KEY,
  id_kraj INT,
  nazwa VARCHAR2(45),
  CONSTRAINT wojewodztwo_kraj_fk FOREIGN KEY (id_kraj) REFERENCES Kraj(id_kraj)
);

CREATE TABLE Miasto
(
  id_miasto INT PRIMARY KEY,
  id_wojewodztwo INT,
  nazwa VARCHAR2(45),
  CONSTRAINT miasto_wojewodztwo_fk FOREIGN KEY (id_wojewodztwo) REFERENCES Wojewodztwo(id_wojewodztwo)
);

CREATE TABLE Kod_pocztowy
(
  id_kod_pocztowy INT PRIMARY KEY,
  id_miasto INT,
  nazwa VARCHAR2(45),
  CONSTRAINT kodpocztowy_miasto_fk FOREIGN KEY (id_miasto) REFERENCES Miasto(id_miasto)
);

CREATE TABLE Ulica
(
  id_ulica INT PRIMARY KEY,
  id_kod_pocztowy INT,
  nazwa VARCHAR2(50),
  CONSTRAINT ulica_kodpocztowy_fk FOREIGN KEY (id_kod_pocztowy) REFERENCES Kod_pocztowy
);

CREATE TABLE Sklep
(
  id_sklep INT PRIMARY KEY,
  id_ulica INT,
  telefon VARCHAR2(20),
  CONSTRAINT sklep_ulica_fk FOREIGN KEY (id_ulica) REFERENCES Ulica(id_ulica)
);

CREATE TABLE Kategoria
(
	kategoria varchar2(40) PRIMARY KEY,
	nadkategoria varchar(40)
);

CREATE TABLE Producent
(
  id_producent INT PRIMARY KEY,
  nazwa VARCHAR2(45)
);

CREATE TABLE Produkt
(
  id_produkt INT PRIMARY KEY,
	id_producent INT,
  kategoria varchar2(40),
  nazwa varchar(100) NOT NULL,
  CONSTRAINT produkt_producent_fk FOREIGN KEY (id_producent) REFERENCES Producent(id_producent),
	CONSTRAINT produkt_kategoria_fk FOREIGN KEY (kategoria) REFERENCES Kategoria(kategoria)
);

CREATE TABLE Produkt_w_sklepie
(
  id_sklep INT,
  id_produkt INT,
  cena NUMBER NOT NULL,
  ilosc NUMBER NOT NULL,
  CONSTRAINT produkt_cena CHECK (cena > 0),
  CONSTRAINT produktsklep_sklep_fk FOREIGN KEY (id_sklep) REFERENCES Sklep(id_sklep),
  CONSTRAINT produktsklep_produkt FOREIGN KEY (id_produkt) REFERENCES Produkt(id_produkt)
);

CREATE TABLE Stanowisko
(
  id_stanowisko INT PRIMARY KEY,
  nazwa VARCHAR2(45) NOT NULL,
  opis VARCHAR2(50)
);

CREATE TABLE Umowa
(
  id_umowa INT PRIMARY KEY,
  rodzaj_umowy VARCHAR2(30) NOT NULL,
  pensja NUMBER NOT NULL,
  data_od DATE NOT NULL,
  data_do DATE
);

CREATE TABLE Pracownik
(
  id_pracownik INT PRIMARY KEY,
  id_sklep INT,
  id_stanowisko INT,
  id_umowa INT,
  id_ulica INT,
  imie VARCHAR2(25) NOT NULL,
  drugie_imie VARCHAR2(25),
  nazwisko VARCHAR2(30) NOT NULL,
  data_urodzenia DATE NOT NULL,
  pesel VARCHAR2(12) NOT NULL,
  nr_tel_1 VARCHAR2(25),
  email VARCHAR2(40),
  CONSTRAINT pracownik_sklep_fk FOREIGN KEY (id_sklep) REFERENCES Sklep(id_sklep),
  CONSTRAINT pracownik_stanowisko_fk FOREIGN KEY (id_stanowisko) REFERENCES Stanowisko(id_stanowisko),
  CONSTRAINT praconwnik_umowa_fk FOREIGN KEY (id_umowa) REFERENCES Umowa(id_umowa),
  CONSTRAINT pracownik_ulica_fk FOREIGN KEY (id_ulica) REFERENCES Ulica(id_ulica)
);

CREATE TABLE Czas
(
  id_czas INT PRIMARY KEY,
  data DATE NOT NULL
);

CREATE TABLE Kod_rabatowy
(
  kod VARCHAR2(12) PRIMARY KEY,
  data_waznosci_od DATE NOT NULL,
  data_waznosci_do DATE NOT NULL,
  ilosc NUMBER,
  rabat NUMBER
);

CREATE TABLE Klient
(
  id_klient INT PRIMARY KEY,
  id_ulica INT,
  imie VARCHAR2(25) NOT NULL,
  nazwisko VARCHAR2(30) NOT NULL,
  nr_tel VARCHAR2(25) NOT NULL,
  email VARCHAR2(40)
);

CREATE TABLE Zamowienie
(
  id_zamowienie INT PRIMARY KEY,
  id_produkt INT,
  id_pracownik INT,
  id_klient INT,
  data_zakupu DATE NOT NULL,
  uwagi VARCHAR2(100),
  CONSTRAINT zamowienie_pracownik_fk FOREIGN KEY (id_pracownik) REFERENCES Pracownik(id_pracownik),
  CONSTRAINT zamowienie_produkt_fk FOREIGN KEY (id_produkt) REFERENCES Produkt(id_produkt),
  CONSTRAINT zamowienie_klient_fk FOREIGN KEY (id_klient) REFERENCES Klient(id_klient)
);

CREATE TABLE Sprzedaz
(
  id_sprzedaz INT PRIMARY KEY,
  id_sklep INT,
  id_czas INT,
  id_zamowienie INT,
  koszt_calkowity NUMBER NOT NULL,
  data_dostarczenia DATE,
  kod VARCHAR2(10),
  CONSTRAINT sprzedaze_sklep_fk FOREIGN KEY (id_sklep) REFERENCES Sklep(id_sklep),
  CONSTRAINT sprzedaze_czas_fk FOREIGN KEY (id_czas) REFERENCES Czas(id_czas),
  CONSTRAINT sprzedaze_zamowienie_fk FOREIGN KEY (id_zamowienie) REFERENCES Zamowienie(id_zamowienie),
  CONSTRAINT sprzedaze_kod_fk FOREIGN KEY (kod) REFERENCES Kod_rabatowy(kod)
);