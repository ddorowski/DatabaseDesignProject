--------------------------------PARTYCJE OBLICZENIOWE-----------------------------------------------
--jaki udzia³ procentowy w danym miesi¹cu mia³y poszczególne produkty w danym pañstwie
------------------1-------------------------------------------------------

SELECT Produkt.nazwa, Kraj.nazwa, EXTRACT(MONTH FROM czas.data) AS MONTHS, EXTRACT(YEAR FROM czas.data) AS YEARS,
    Sprzedaz.koszt_calkowity,
    Sum(Sprzedaz.koszt_calkowity) OVER (PARTITION BY Produkt.nazwa) sum_kwota,
    Round(100*Sprzedaz.koszt_calkowity/(Sum(Sprzedaz.koszt_calkowity) OVER (PARTITION BY Produkt.nazwa)),2) Udzial_procentowy
    FROM Produkt, Kraj, Czas, Sprzedaz, Zamowienie, Miasto, Wojewodztwo, Kod_pocztowy, Ulica, Sklep
      WHERE Produkt.id_produkt = Zamowienie.id_produkt
      AND Zamowienie.id_zamowienie = Sprzedaz.id_zamowienie
      AND Sprzedaz.id_czas = Czas.id_czas
      AND Kraj.id_kraj = Wojewodztwo.id_kraj
      AND Wojewodztwo.id_wojewodztwo = Miasto.id_wojewodztwo
      AND Miasto.id_miasto = Kod_pocztowy.id_miasto
      AND Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
      AND Sklep.id_ulica = ulica.id_ulica
      AND Sklep.id_sklep = Sprzedaz.id_sklep
        ORDER BY Produkt.nazwa, Kraj.nazwa, EXTRACT(MONTH FROM czas.data), EXTRACT(YEAR FROM czas.data);


--procentowo ilosc sprzedanych produktów w poszczególnych krajach
-------------------2---------------------------------------------------------

SELECT DISTINCT Kraj.id_kraj,
    Count(Sprzedaz.id_sprzedaz) OVER (PARTITION BY Kraj.id_kraj) AS suma,
    Count(Sprzedaz.id_sprzedaz) OVER () AS suma_calkowita,
    Round(100* Count(Sprzedaz.id_sprzedaz) OVER (PARTITION BY Kraj.id_kraj)
          / Count(Sprzedaz.id_sprzedaz) OVER (),2) AS Procentowo
    FROM Kraj, Sprzedaz, Produkt, Zamowienie, Wojewodztwo, Miasto, Kod_pocztowy, Ulica, Sklep
    WHERE Kraj.id_kraj = Wojewodztwo.id_kraj
      AND Wojewodztwo.id_wojewodztwo = Miasto.id_wojewodztwo
      AND Miasto.id_miasto = Kod_pocztowy.id_miasto
      AND Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
      AND Sklep.id_ulica = ulica.id_ulica
      AND Sklep.id_sklep = Sprzedaz.id_sklep
      AND Produkt.id_produkt = Zamowienie.id_produkt
      AND Sprzedaz.id_zamowienie = Zamowienie.id_zamowienie
      ORDER BY Kraj.id_kraj;

--jaki procent klientów robi³ zakupy w danym miescie w roku 2020
--------------------3----------------------------------------------------------

SELECT DISTINCT Miasto.id_miasto,
    Count(Sprzedaz.id_sprzedaz) OVER (PARTITION BY Miasto.id_miasto) AS suma,
    Count(Sprzedaz.id_sprzedaz) OVER () AS suma_calkowita,
    Round(100* Count(Sprzedaz.id_sprzedaz) OVER (PARTITION BY Miasto.id_miasto)
          / Count(Sprzedaz.id_sprzedaz) OVER (),2) AS Procentowo
    FROM Sprzedaz, Produkt, Zamowienie, Miasto, Kod_pocztowy, Ulica, Sklep, Czas
      WHERE Miasto.id_miasto = Kod_pocztowy.id_miasto
      AND Kod_pocztowy.id_kod_pocztowy = Ulica.id_kod_pocztowy
      AND Sklep.id_ulica = ulica.id_ulica
      AND Sklep.id_sklep = Sprzedaz.id_sklep
      AND Produkt.id_produkt = Zamowienie.id_produkt
      AND Sprzedaz.id_zamowienie = Zamowienie.id_zamowienie
      AND sprzedaz.id_czas = Czas.id_czas
      AND Czas.data >= DATE '2020-01-01' AND Czas.data <= DATE '2020-12-31'
      ORDER BY Miasto.id_miasto;