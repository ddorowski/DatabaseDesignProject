---------------------------------FUNKCJE RANKINGOWE---------------------------------------------------------
--który pracownik obs³u¿y³ najwiêcej klientów w 2020 roku
-----------------------------1------------------------------------------------
SELECT EXTRACT(YEAR FROM czas.data) AS YEARS, Pracownik.id_pracownik, Count(Zamowienie.id_zamowienie),
    dense_Rank() OVER (ORDER BY Count(Zamowienie.id_zamowienie) DESC) AS ranking
    FROM Pracownik, Czas, Zamowienie, Sprzedaz
      WHERE Pracownik.id_pracownik = Zamowienie.id_pracownik
      AND Zamowienie.id_zamowienie = Sprzedaz.id_zamowienie
      AND Sprzedaz.id_czas = Czas.id_czas
      AND Czas.data >= DATE '2020-01-01' AND Czas.data <= DATE '2020-12-31'
      GROUP BY EXTRACT(YEAR FROM czas.data), Pracownik.id_pracownik
      ORDER BY EXTRACT(YEAR FROM czas.data), ranking;

--ranking sklepów z najwiêkszym dochodem ze sprzeda¿y w 2020 roku
---------------------------2---------------------------------------------------------

SELECT EXTRACT(YEAR FROM czas.data) AS YEARS, Sklep.id_sklep,
    Sum(Sprzedaz.koszt_calkowity),
    Dense_Rank() OVER (ORDER BY Sum(Sprzedaz.koszt_calkowity) DESC) AS ranking
    FROM Sprzedaz, Czas, Sklep
    WHERE Sprzedaz.id_sklep = Sklep.id_sklep
    AND Sprzedaz.id_czas = Czas.id_czas
    AND Czas.data >= DATE '2020-01-01' AND Czas.data <= DATE '2020-12-31'
    GROUP BY EXTRACT(YEAR FROM czas.data), Sklep.id_sklep
    ORDER BY EXTRACT(YEAR FROM czas.data), ranking;

--jakie kategorie produktow przyniosly najwiêksze zyski w 2020 roku
----------------------------3-------------------------------------------------------------
SELECT EXTRACT(YEAR FROM czas.data) AS YEARS, Kategoria.kategoria, Sum(Sprzedaz.koszt_calkowity),
    dense_Rank() OVER (ORDER BY Sum(Sprzedaz.koszt_calkowity) DESC) AS ranking
    FROM Kategoria, Sprzedaz, Produkt, Zamowienie, Czas
      WHERE Kategoria.kategoria = Produkt.kategoria
      AND Produkt.id_produkt = Zamowienie.id_produkt
      AND Zamowienie.id_zamowienie = Sprzedaz.id_zamowienie
      AND Czas.id_czas = Sprzedaz.id_czas
      AND Czas.data >= DATE '2020-01-01' AND Czas.data <= DATE '2020-12-31'
      GROUP BY EXTRACT(YEAR FROM czas.data), Kategoria.kategoria
      ORDER BY EXTRACT(YEAR FROM czas.data), ranking;
