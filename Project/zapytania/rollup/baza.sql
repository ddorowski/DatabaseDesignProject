---------------------------------------ROLLUP------------------------------------------------------
--Jak duze dochody ma sklep w danym miesiacu
-------------------1--------------------------------------------------

SELECT Sklep.id_sklep, EXTRACT(MONTH FROM czas.data) AS MONTHS, EXTRACT(YEAR FROM czas.data) AS YEARS ,Sum(Sprzedaz.koszt_calkowity) AS Dochody
    FROM Sklep, Czas, Sprzedaz
      WHERE Sklep.id_sklep = Sprzedaz.id_sklep
      AND Czas.id_czas = Sprzedaz.id_czas
        GROUP BY rollup(Sklep.id_sklep, EXTRACT(YEAR FROM czas.data), EXTRACT(MONTH FROM czas.data));

--w którym kraju, w jakim sklepie by³o ile zysków ze sprzeda¿y
-------------------2--------------------------------------------------

SELECT Kraj.nazwa, Sklep.id_sklep, Sum(Sprzedaz.koszt_calkowity)
    FROM Sklep, Kraj, Wojewodztwo, Miasto, Kod_pocztowy, Ulica, Sprzedaz
      WHERE Kraj.id_kraj = Wojewodztwo.id_kraj
      AND Wojewodztwo.id_wojewodztwo = Miasto.id_wojewodztwo
      AND Miasto.id_miasto = Kod_pocztowy.id_miasto
      AND Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
      AND Ulica.id_ulica = Sklep.id_ulica
      AND Sklep.id_sklep = Sprzedaz.id_sklep
        GROUP BY rollup(Kraj.nazwa, Sklep.id_sklep);

--jakie s¹ miesiêczne zyski ze sprzedazy w kraju i jego wojewodztwach
------------------3-----------------------------------------------------

SELECT Kraj.nazwa, Wojewodztwo.nazwa, EXTRACT(MONTH FROM czas.data) AS MONTHS, EXTRACT(YEAR FROM czas.data) AS YEARS, Sum(Sprzedaz.koszt_calkowity)
    FROM Kraj, Wojewodztwo, Czas, Sprzedaz, Miasto, Kod_pocztowy, Ulica, Sklep
      WHERE Kraj.id_kraj = Wojewodztwo.id_kraj
      AND Wojewodztwo.id_wojewodztwo = Miasto.id_wojewodztwo
      AND Miasto.id_miasto = Kod_pocztowy.id_miasto
      AND Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
      AND Ulica.id_ulica = Sklep.id_ulica
      AND Sklep.id_sklep = Sprzedaz.id_sklep
      AND Czas.id_czas = Sprzedaz.id_czas
        GROUP BY rollup(Kraj.nazwa, Wojewodztwo.nazwa, EXTRACT(YEAR FROM Czas.data), EXTRACT(MONTH FROM Czas.data));
