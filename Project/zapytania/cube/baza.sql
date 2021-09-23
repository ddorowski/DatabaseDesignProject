---------------------------------------CUBE------------------------------------------------------
--jaki dochód przynosz¹ produkty danych producentów i jaki dochód przynosi konretny produkt
-------------------1---------------------------------------------------

SELECT Producent.nazwa, Produkt.id_produkt, Sum(Sprzedaz.koszt_calkowity)
    FROM Producent, Produkt, Sprzedaz, Zamowienie
      WHERE Producent.id_producent = Produkt.id_producent
      AND Zamowienie.id_produkt = Produkt.id_produkt
      AND Sprzedaz.id_zamowienie = Zamowienie.id_zamowienie
        GROUP BY cube(Produkt.id_produkt, Producent.nazwa);


--która kategoria produktów w danych miastach w poszczególnych latach przynosi najwiêksze zyski
-------------------2---------------------------------------------------

SELECT Kategoria.kategoria, Miasto.nazwa, EXTRACT(YEAR FROM czas.data) AS YEARS ,Sum(Sprzedaz.koszt_calkowity)
    FROM Kategoria, Miasto, Czas, Produkt, Zamowienie, Kod_pocztowy, Ulica, Sklep, Sprzedaz
      WHERE Kategoria.kategoria = Produkt.kategoria
      AND Produkt.id_produkt = Zamowienie.id_produkt
      AND Zamowienie.id_zamowienie = Sprzedaz.id_zamowienie
      AND Miasto.id_miasto = Kod_pocztowy.id_miasto
      AND Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
      AND Ulica.id_ulica = Sklep.id_ulica
      AND Sklep.id_sklep = Sprzedaz.id_sklep
      AND Czas.id_czas = Sprzedaz.id_czas
        GROUP BY cube(Kategoria.kategoria, Miasto.nazwa, EXTRACT(YEAR FROM czas.data));

--w którym miesiacu i w jakim sklepie by³o ile klientów  (1 sprzedaz = 1 klient)
-------------------3-----------------------------------------------------

SELECT  Sklep.id_sklep, EXTRACT(MONTH FROM czas.data) AS MONTHS, EXTRACT(YEAR FROM czas.data) AS YEARS, count(Klient.id_klient) AS LICZBA_KLIENTOW
    FROM Sklep, Czas, Zamowienie, Sprzedaz, Klient
      WHERE Sklep.id_sklep = Sprzedaz.id_sklep
      AND Sprzedaz.id_czas = Czas.id_czas
      AND Zamowienie.id_zamowienie = Sprzedaz.id_zamowienie
      AND Klient.id_klient = Zamowienie.id_klient
        GROUP BY cube(Sklep.id_sklep, EXTRACT(YEAR FROM czas.data), EXTRACT(MONTH FROM czas.data));

