---------------------------------RUCHOME OKNO OBLICZENIOWE-----------------------------------------------
--sprzedaz w sklepie w poszczegolnych latach (wartosc krocz¹ca)
------------------------------1---------------------------------------------
SELECT Sklep.id_sklep, EXTRACT(YEAR FROM czas.data) AS YEARS, Sprzedaz.koszt_calkowity AS zakup,
    Sum(Sprzedaz.koszt_calkowity) OVER (PARTITION BY Sklep.id_sklep, EXTRACT(YEAR FROM czas.data) ORDER BY Sprzedaz.koszt_calkowity)
    FROM Sklep, Sprzedaz, Czas
    WHERE Sklep.id_sklep = Sprzedaz.id_sklep
    AND Czas.id_czas = Sprzedaz.id_czas
    ORDER BY Sklep.id_sklep, EXTRACT(YEAR FROM czas.data);

--jak duzo sprzeda³ dany pracownik w poszczególnych miesiacach w roku 2021 (wartoœæ krocz¹ca + wartoœæ koñcowa)
-----------------------------2------------------------------------------------

SELECT Pracownik.id_pracownik, EXTRACT(MONTH FROM czas.data) AS MONTHS, Sprzedaz.koszt_calkowity,
    Sum(Sprzedaz.koszt_calkowity) OVER (PARTITION BY Pracownik.id_pracownik, EXTRACT(MONTH FROM czas.data) ORDER BY Sprzedaz.koszt_calkowity) AS WARTOSC_KROCZACA,
    Sum(Sprzedaz.koszt_calkowity) OVER (PARTITION BY Pracownik.id_pracownik, EXTRACT(MONTH FROM czas.data) ORDER BY Sprzedaz.koszt_calkowity
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS WARTOSC_CALKOWITA
    FROM Pracownik, Zamowienie, Sprzedaz, Czas
    WHERE Pracownik.id_pracownik = Zamowienie.id_pracownik
    AND Zamowienie.id_zamowienie = Sprzedaz.id_zamowienie
    AND Czas.id_czas = Sprzedaz.id_czas
    AND Czas.data >= DATE '2021-01-01'
    ORDER BY Pracownik.id_pracownik, EXTRACT(MONTH FROM czas.data);

--Sprzedaz w kraju w poszczególnych latach (wartoœæ krocz¹ca + wartoœæ koñcowa)
-----------------------------3-------------------------------------------------

SELECT Kraj.nazwa, EXTRACT(YEAR FROM czas.data) AS YEARS, Sprzedaz.koszt_calkowity AS zakup,
    Sum(Sprzedaz.koszt_calkowity) OVER (PARTITION BY Kraj.nazwa, EXTRACT(YEAR FROM czas.data) ORDER BY Sprzedaz.koszt_calkowity),
    Sum(Sprzedaz.koszt_calkowity) OVER (PARTITION BY Kraj.nazwa, EXTRACT(YEAR FROM czas.data) ORDER BY Sprzedaz.koszt_calkowity
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS WARTOSC_CALKOWITA
    FROM Sklep, Sprzedaz, Czas, Kraj, Wojewodztwo, Miasto, Kod_pocztowy, Ulica
    WHERE Kraj.id_kraj = Wojewodztwo.id_kraj
      AND Wojewodztwo.id_wojewodztwo = Miasto.id_wojewodztwo
      AND Miasto.id_miasto = Kod_pocztowy.id_miasto
      AND Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
      AND Sklep.id_ulica = ulica.id_ulica
      AND Sklep.id_sklep = Sprzedaz.id_sklep
      AND Czas.id_czas = Sprzedaz.id_czas
    ORDER BY Kraj.nazwa, EXTRACT(YEAR FROM czas.data);
