---------------------------------FUNKCJE RANKINGOWE---------------------------------------------------------
--który pracownik obs³u¿y³ najwiêcej klientów w 2020 roku
-----------------------------1------------------------------------------------

SELECT m.rok, p.id_pracownik, Count(sp.id_sprzedaz),
    Dense_Rank() OVER (ORDER BY Count(sp.id_sprzedaz) DESC) AS ranking
    FROM h_pracownik p, h_miesiac_w_roku m, h_sprzedaz sp
    WHERE p.id_pracownik = sp.id_pracownik
    AND m.id_miesiac = sp.id_miesiac
    AND m.rok = 2020
    GROUP BY m.rok, p.id_pracownik
    ORDER BY m.rok, ranking;

--ranking sklepów z najwiêkszym dochodem ze sprzeda¿y w 2020 roku
---------------------------2---------------------------------------------------------

SELECT m.rok, s.id_sklep,
    Sum(sp.koszt_calkowity),
    Dense_Rank() OVER (ORDER BY Sum(sp.koszt_calkowity) DESC) AS ranking
    FROM h_sprzedaz sp, h_miesiac_w_roku m, h_sklep s
    WHERE m.id_miesiac = sp.id_miesiac
    AND s.id_sklep = sp.id_sklep
    GROUP BY m.rok, s.id_sklep
    ORDER BY m.rok, ranking;

--jakie kategorie produktow przyniosly najwiêksze zyski w 2020 roku
----------------------------3-------------------------------------------------------------

SELECT m.rok, kat.kategoria, Sum(sp.koszt_calkowity),
    Dense_Rank() OVER (ORDER BY Sum(sp.koszt_calkowity) DESC) AS ranking
    FROM h_kategoria kat, h_miesiac_w_roku m, h_sprzedaz sp
    WHERE m.id_miesiac = sp.id_miesiac
    AND kat.kategoria = sp.kategoria
    GROUP BY m.rok, kat.kategoria
    ORDER BY m.rok, ranking;