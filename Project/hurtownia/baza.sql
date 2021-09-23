DROP TABLE h_Kraj CASCADE CONSTRAINTS;
DROP TABLE h_Wojewodztwo CASCADE CONSTRAINTS;
DROP TABLE h_Miasto CASCADE CONSTRAINTS;
DROP TABLE h_Sklep CASCADE CONSTRAINTS;
DROP TABLE h_Pracownik CASCADE CONSTRAINTS;
DROP TABLE h_Klient CASCADE CONSTRAINTS;
DROP TABLE h_Miesiac_w_roku CASCADE CONSTRAINTS;
DROP TABLE h_Producent CASCADE CONSTRAINTS;
DROP TABLE h_Produkt CASCADE CONSTRAINTS;
DROP TABLE h_Kategoria CASCADE CONSTRAINTS;
DROP TABLE h_Sprzedaz CASCADE CONSTRAINTS;

CREATE TABLE h_Kraj
(
  id_kraj INT PRIMARY KEY,
  nazwa VARCHAR2(45)
);

CREATE TABLE h_Wojewodztwo
(
  id_wojewodztwo INT PRIMARY KEY,
  nazwa VARCHAR2(45)
);

CREATE TABLE h_Miasto
(
  id_miasto INT PRIMARY KEY,
  nazwa VARCHAR2(45)
);

CREATE TABLE h_Sklep
(
  id_sklep INT PRIMARY KEY
);

CREATE TABLE h_Pracownik
(
  id_pracownik INT PRIMARY KEY,
  imie VARCHAR2(25),
  nazwisko VARCHAR2(30),
  pensja NUMBER NOT NULL
);

CREATE TABLE h_Klient
(
  id_klient INT PRIMARY KEY,
  imie VARCHAR2(25),
  nazwisko VARCHAR2(30)
);

CREATE TABLE h_Miesiac_w_roku
(
  id_miesiac INT PRIMARY KEY,
  miesiac VARCHAR2(20),
  rok VARCHAR2(5)
);

CREATE TABLE h_Producent
(
  id_producent INT PRIMARY KEY,
  nazwa VARCHAR2(45)
);

CREATE TABLE h_Produkt
(
  id_produkt INT PRIMARY KEY,
  nazwa VARCHAR2(100)
);

CREATE TABLE h_Kategoria
(
	kategoria varchar2(40) PRIMARY KEY,
	nadkategoria varchar(40)
);

CREATE TABLE h_Sprzedaz
(
  id_sprzedaz INT PRIMARY KEY,
  id_kraj INT,
  id_wojewodztwo INT,
  id_miasto INT,
  id_sklep INT,
  id_klient INT,
  id_pracownik INT,
  id_miesiac INT,
  id_producent INT,
  id_produkt INT,
  kategoria varchar2(40),
  koszt_calkowity NUMBER NOT NULL,
  CONSTRAINT h_sprzedaz_kraj_fk FOREIGN KEY (id_kraj) REFERENCES h_Kraj(id_kraj),
  CONSTRAINT h_sprzedaz_wojewodztwo_fk FOREIGN KEY (id_wojewodztwo) REFERENCES h_Wojewodztwo(id_wojewodztwo),
  CONSTRAINT h_sprzedaz_miasto_fk FOREIGN KEY (id_miasto) REFERENCES h_Miasto(id_miasto),
  CONSTRAINT h_sprzedaz_sklep_fk FOREIGN KEY (id_sklep) REFERENCES h_Sklep(id_sklep),
  CONSTRAINT h_sprzedaz_klient_fk FOREIGN KEY (id_klient) REFERENCES h_Klient(id_klient),
  CONSTRAINT h_sprzedaz_pracownik_fk FOREIGN KEY (id_pracownik) REFERENCES h_Pracownik(id_pracownik),
  CONSTRAINT h_sprzedaz_miesiac_fk FOREIGN KEY (id_miesiac) REFERENCES h_Miesiac_w_roku(id_miesiac),
  CONSTRAINT h_sprzedaz_producent_fk FOREIGN KEY (id_producent) REFERENCES h_Producent(id_producent),
  CONSTRAINT h_sprzedaz_produkt_fk FOREIGN KEY (id_produkt) REFERENCES h_Produkt(id_produkt),
  CONSTRAINT h_sprzedaz_kategoria_fk FOREIGN KEY (kategoria) REFERENCES h_Kategoria(kategoria)
);

/*
call load_h_Kraj();
call load_h_Wojewodztwo();
call load_h_Miasto();
call load_h_Sklep();
call load_h_Pracownik();
call load_h_Klient();
call load_h_Producent();
call load_h_Produkt();
call load_h_Kategoria();

DROP SEQUENCE seq1;
CREATE SEQUENCE seq1 START WITH 1;

INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'kwiecien', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'maj', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'czerwiec', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'lipiec', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'sierpien', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'wrzesien', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'pazdziernik', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'listopad', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'grudzien', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'styczen', 2021);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'luty', 2021);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'marzec', 2021);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, 'kwiecien', 2021);
*/