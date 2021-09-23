---------------------------------------KRAJ-------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Kraj
    AS
    zm_kraj Kraj%ROWTYPE;
    CURSOR c_kraj IS SELECT *FROM Kraj;
    BEGIN
      OPEN c_kraj;
      LOOP
        FETCH c_kraj INTO zm_kraj;
        EXIT WHEN c_kraj%NOTFOUND;
        INSERT INTO h_Kraj VALUES(zm_kraj.id_kraj,zm_kraj.nazwa);
      END LOOP;
      CLOSE c_kraj;
    END;

call load_h_Kraj();
SELECT *FROM h_Kraj;
SELECT *FROM Kraj;

----------------------------------------WOJEWODZTWO--------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Wojewodztwo
    AS
    zm_wojewodztwo Wojewodztwo%ROWTYPE;
    CURSOR c_wojewodztwo IS SELECT *FROM Wojewodztwo;
    BEGIN
      OPEN c_wojewodztwo;
      LOOP
        FETCH c_wojewodztwo INTO zm_wojewodztwo;
        EXIT WHEN c_wojewodztwo%NOTFOUND;
        INSERT INTO h_Wojewodztwo VALUES(zm_wojewodztwo.id_wojewodztwo,zm_wojewodztwo.nazwa);
      END LOOP;
      CLOSE c_wojewodztwo;
    END;

call load_h_Wojewodztwo();
SELECT *FROM h_Wojewodztwo;
SELECT *FROM Wojewodztwo;

---------------------------------------MIASTO---------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Miasto
    AS
    zm_miasto Miasto%ROWTYPE;
    CURSOR c_miasto IS SELECT *FROM Miasto;
    BEGIN
      OPEN c_miasto;
      LOOP
        FETCH c_miasto INTO zm_miasto;
        EXIT WHEN c_miasto%NOTFOUND;
        INSERT INTO h_Miasto VALUES(zm_miasto.id_miasto,zm_miasto.nazwa);
      END LOOP;
      CLOSE c_miasto;
    END;

call load_h_Miasto();
SELECT *FROM h_Miasto;
SELECT *FROM Miasto;

---------------------------------------SKLEP-------------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Sklep
    AS
    zm_sklep Sklep%ROWTYPE;
    CURSOR c_sklep IS SELECT *FROM Sklep;
    BEGIN
      OPEN c_sklep;
      LOOP
        FETCH c_sklep INTO zm_sklep;
        EXIT WHEN c_sklep%NOTFOUND;
        INSERT INTO h_Sklep VALUES(zm_sklep.id_sklep);
      END LOOP;
      CLOSE c_sklep;
    END;

call load_h_Sklep();
SELECT *FROM h_Sklep;
SELECT *FROM Sklep;

---------------------------------------PRACOWNIK----------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Pracownik
    AS
    zm_id_pracownik Pracownik.id_pracownik%TYPE;
    zm_imie Pracownik.imie%TYPE;
    zm_nazwisko Pracownik.nazwisko%TYPE;
    zm_pensja Umowa.pensja%TYPE;
    CURSOR c_pracownik IS SELECT p.id_pracownik, p.imie, p.nazwisko, u.pensja FROM Pracownik p,Umowa u WHERE
                                    p.id_umowa = u.id_umowa;
    BEGIN
      OPEN c_pracownik;
      LOOP
        FETCH c_pracownik INTO zm_id_pracownik, zm_imie, zm_nazwisko, zm_pensja;
        EXIT WHEN c_pracownik%NOTFOUND;
        INSERT INTO h_Pracownik VALUES(zm_id_pracownik, zm_imie, zm_nazwisko, zm_pensja);
      END LOOP;
      CLOSE c_pracownik;
    END;

call load_h_Pracownik();
SELECT *FROM h_Pracownik;
SELECT p.id_pracownik, p.imie, p.nazwisko, u.pensja FROM Pracownik p,Umowa u WHERE
                                    p.id_umowa = u.id_umowa;

--------------------------------------Klient----------------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Klient
    AS
    zm_klient Klient%ROWTYPE;
    CURSOR c_klient IS SELECT *FROM Klient;
    BEGIN
      OPEN c_klient;
      LOOP
        FETCH c_klient INTO zm_klient;
        EXIT WHEN c_klient%NOTFOUND;
        INSERT INTO h_Klient VALUES(zm_klient.id_klient, zm_klient.imie, zm_klient.nazwisko);
      END LOOP;
      CLOSE c_klient;
    END;

call load_h_Klient();
SELECT *FROM h_Klient;
SELECT *FROM Klient;

-------------------------------------PRODUCENT----------------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Producent
    AS
    zm_producent Producent%ROWTYPE;
    CURSOR c_producent IS SELECT *FROM Producent;
    BEGIN
      OPEN c_producent;
      LOOP
        FETCH c_producent INTO zm_producent;
        EXIT WHEN c_producent%NOTFOUND;
        INSERT INTO h_Producent VALUES(zm_producent.id_producent, zm_producent.nazwa);
      END LOOP;
      CLOSE c_producent;
    END;

call load_h_Producent();
SELECT *FROM h_producent;
SELECT *FROM Producent;

------------------------------------PRODUKT--------------------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Produkt
    AS
    zm_produkt Produkt%ROWTYPE;
    CURSOR c_produkt IS SELECT *FROM Produkt;
    BEGIN
      OPEN c_produkt;
      LOOP
        FETCH c_produkt INTO zm_produkt;
        EXIT WHEN c_produkt%NOTFOUND;
        INSERT INTO h_Produkt VALUES(zm_produkt.id_produkt, zm_produkt.nazwa);
      END LOOP;
      CLOSE c_produkt;
    END;

call load_h_Produkt();
SELECT *FROM h_produkt;
SELECT *FROM Produkt;

------------------------------------KATEGORIA---------------------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Kategoria
    AS
    zm_kategoria Kategoria%ROWTYPE;
    CURSOR c_kategoria IS SELECT *FROM Kategoria;
    BEGIN
      OPEN c_kategoria;
      LOOP
        FETCH c_kategoria INTO zm_kategoria;
        EXIT WHEN c_kategoria%NOTFOUND;
        INSERT INTO h_Kategoria VALUES(zm_kategoria.kategoria, zm_kategoria.nadkategoria);
      END LOOP;
      CLOSE c_kategoria;
    END;

call load_h_Kategoria();
SELECT *FROM h_kategoria;
SELECT *FROM Kategoria;

-----------------------------------MIESIAC_W_ROKU------------------------------------------------------------

DELETE FROM h_Miesiac_w_roku;
DROP SEQUENCE seq1;
CREATE SEQUENCE seq1 START WITH 1;

INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '04', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '05', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '06', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '07', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '08', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '09', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '10', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '11', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '12', 2020);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '01', 2021);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '02', 2021);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '03', 2021);
INSERT INTO h_Miesiac_w_roku VALUES(seq1.NEXTVAL, '04', 2021);

SELECT *FROM h_Miesiac_w_roku;

-----------------------------------SPRZEDAZ------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE load_h_Sprzedaz
    AS
    zm_id_sprzedaz Sprzedaz.id_sprzedaz%TYPE;
    zm_id_kraj Kraj.id_kraj%TYPE;
    zm_id_wojewodztwo Wojewodztwo.id_wojewodztwo%TYPE;
    zm_id_miasto Miasto.id_miasto%TYPE;
    zm_id_sklep Sklep.id_sklep%TYPE;
    zm_id_klient Klient.id_klient%TYPE;
    zm_id_pracownik Pracownik.id_pracownik%TYPE;
    zm_id_czas Czas.id_czas%TYPE;                 --pole id_czas w tabeli Czas (baza)
    zm_miesiac h_Miesiac_w_roku.miesiac%TYPE;     --pole miesiac w tabeli Czas (baza)
    zm_rok h_Miesiac_w_roku.rok%TYPE;             --pole rok w tabeli Czas   (baza)
    zm_id_producent Producent.id_producent%TYPE;
    zm_id_produkt Produkt.id_produkt%TYPE;
    zm_kategoria Kategoria.kategoria%TYPE;
    zm_koszt_calkowity Sprzedaz.koszt_calkowity%TYPE;
    zm_miesiac_w_roku h_Miesiac_w_roku%ROWTYPE;   --tabela Miesiac_w_roku (hurtownia)
    CURSOR c_miesiac_w_roku IS
       SELECT *FROM h_Miesiac_w_roku;
    CURSOR c_sprzedaz IS
       SELECT Sprzedaz.id_sprzedaz, Kraj.id_kraj, Wojewodztwo.id_wojewodztwo, Miasto.id_miasto, Sklep.id_sklep,
          Zamowienie.id_klient, Pracownik.id_pracownik, Czas.id_czas, EXTRACT(MONTH FROM czas.data), EXTRACT(YEAR FROM czas.data),
          Producent.id_producent, Produkt.id_produkt, Kategoria.kategoria, Sprzedaz.koszt_calkowity
          FROM Sprzedaz
          JOIN Czas          ON Czas.id_czas = Sprzedaz.id_czas
          JOIN Zamowienie    ON Zamowienie.id_zamowienie = Sprzedaz.id_zamowienie
          JOIN Produkt       ON Produkt.id_produkt = Zamowienie.id_produkt
          JOIN Kategoria     ON Kategoria.kategoria = Produkt.kategoria
          JOIN Producent     ON Producent.id_producent = Produkt.id_producent
          JOIN Pracownik     ON Pracownik.id_pracownik = Zamowienie.id_pracownik
          JOIN Umowa         ON Umowa.id_umowa = Pracownik.id_umowa
          JOIN Sklep         ON Sklep.id_sklep = Sprzedaz.id_sklep
          JOIN Ulica         ON Ulica.id_ulica = Sklep.id_ulica
          JOIN Kod_pocztowy  ON Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
          JOIN Miasto        ON Miasto.id_miasto = Kod_pocztowy.id_miasto
          JOIN Wojewodztwo   ON Wojewodztwo.id_wojewodztwo = Miasto.id_wojewodztwo
          JOIN Kraj          ON Kraj.id_kraj = Wojewodztwo.id_kraj ORDER BY Sprzedaz.id_sprzedaz ASC;

    BEGIN
      OPEN c_sprzedaz;
      LOOP
        FETCH c_sprzedaz INTO zm_id_sprzedaz, zm_id_kraj, zm_id_wojewodztwo, zm_id_miasto, zm_id_sklep, zm_id_klient,
                              zm_id_pracownik, zm_id_czas, zm_miesiac, zm_rok, zm_id_producent, zm_id_produkt, zm_kategoria, zm_koszt_calkowity;
        EXIT WHEN c_sprzedaz%NOTFOUND;

          IF zm_miesiac = 1 THEN zm_miesiac := '01';
          ELSIF zm_miesiac = 2 THEN zm_miesiac := '02';
          ELSIF zm_miesiac = 3 THEN zm_miesiac := '03';
          ELSIF zm_miesiac = 4 THEN zm_miesiac := '04';
          ELSIF zm_miesiac = 5 THEN zm_miesiac := '05';
          ELSIF zm_miesiac = 6 THEN zm_miesiac := '06';
          ELSIF zm_miesiac = 7 THEN zm_miesiac := '07';
          ELSIF zm_miesiac = 8 THEN zm_miesiac := '08';
          ELSIF zm_miesiac = 9 THEN zm_miesiac := '09';
          ELSIF zm_miesiac = 10 THEN zm_miesiac := '10';
          ELSIF zm_miesiac = 11 THEN zm_miesiac := '11';
          ELSIF zm_miesiac = 12 THEN zm_miesiac := '12';
          ELSE zm_miesiac := 'blad';
        END IF;

        OPEN c_miesiac_w_roku;
        LOOP
          FETCH c_miesiac_w_roku INTO zm_miesiac_w_roku;
          EXIT WHEN c_miesiac_w_roku%NOTFOUND;
          IF (zm_miesiac = zm_miesiac_w_roku.miesiac AND zm_rok = zm_miesiac_w_roku.rok) THEN
              zm_id_czas := zm_miesiac_w_roku.id_miesiac;
          END IF;
        END LOOP;
        CLOSE c_miesiac_w_roku;

        INSERT INTO h_Sprzedaz VALUES(zm_id_sprzedaz, zm_id_kraj, zm_id_wojewodztwo, zm_id_miasto, zm_id_sklep,
                                      zm_id_klient, zm_id_pracownik, zm_id_czas, zm_id_producent, zm_id_produkt, zm_kategoria, zm_koszt_calkowity);
      END LOOP;
      CLOSE c_sprzedaz;
END;

call load_h_Sprzedaz();
SELECT *FROM h_Sprzedaz ORDER BY id_sprzedaz ASC;


