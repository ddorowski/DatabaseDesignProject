--------------------------------PARTYCJE OBLICZENIOWE-----------------------------------------------
--jaki udzia³ procentowy w danym miesi¹cu mia³y poszczególne produkty w danym pañstwie
------------------1-------------------------------------------------------

SELECT p.nazwa, k.nazwa, m.miesiac, m.rok, sp.koszt_calkowity,
    Sum(sp.koszt_calkowity) OVER (PARTITION BY p.nazwa) sum_kwota,
    Round(100*sp.koszt_calkowity/(Sum(sp.koszt_calkowity) OVER (PARTITION BY p.nazwa)),2) Udzial_procentowy
    FROM h_produkt p, h_kraj k, h_miesiac_w_roku m, h_sprzedaz sp
    WHERE p.id_produkt = sp.id_produkt
    AND k.id_kraj = sp.id_kraj
    AND m.id_miesiac = sp.id_miesiac
      ORDER BY p.nazwa, k.nazwa, m.miesiac, m.rok;


--procentowo ilosc sprzedanych produktów w poszczególnych krajach
-------------------2---------------------------------------------------------

SELECT DISTINCT k.id_kraj,
    Count(sp.id_sprzedaz) OVER (PARTITION BY k.id_kraj) AS suma,
    Count(sp.id_sprzedaz) OVER () AS suma_calkowita,
    Round(100*Count(sp.id_sprzedaz) OVER (PARTITION BY k.id_kraj)
            / Count(sp.id_sprzedaz) OVER (),2)
    FROM h_kraj k, h_sprzedaz sp
    WHERE k.id_kraj = sp.id_kraj
      ORDER BY k.id_kraj;

--jaki procent klientów robi³ zakupy w danym miescie w roku 2020
--------------------3----------------------------------------------------------

SELECT DISTINCT mia.id_miasto,
    Count(sp.id_sprzedaz) OVER (PARTITION BY mia.id_miasto) AS suma,
    Count(sp.id_sprzedaz) OVER () AS suma_calkowita,
    Round(100*Count(sp.id_sprzedaz) OVER (PARTITION BY mia.id_miasto)
          / Count(sp.id_sprzedaz) OVER (),2) AS procentowo
    FROM h_miasto mia, h_klient kli, h_sprzedaz sp, h_Miesiac_w_roku mie
    WHERE mia.id_miasto = sp.id_miasto
    AND kli.id_klient = sp.id_klient
    AND mie.id_miesiac = sp.id_miesiac
    AND mie.rok = 2020
      ORDER BY mia.id_miasto;