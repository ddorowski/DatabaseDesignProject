---------------------------------RUCHOME OKNO OBLICZENIOWE-----------------------------------------------
--sprzedaz w sklepie w poszczegolnych latach (wartosc krocz¹ca)
------------------------------1---------------------------------------------

SELECT s.id_sklep, m.rok, sp.koszt_calkowity AS zakup,
    Sum(sp.koszt_calkowity) OVER (PARTITION BY s.id_sklep, m.rok ORDER BY sp.koszt_calkowity)
    FROM h_sklep s, h_sprzedaz sp, h_miesiac_w_roku m
    WHERE s.id_sklep = sp.id_sklep
    AND m.id_miesiac = sp.id_miesiac
      ORDER BY s.id_sklep, m.rok;

--jak duzo sprzeda³ dany pracownik w poszczególnych miesiacach w roku 2021 (wartoœæ krocz¹ca + wartoœæ koñcowa)
-----------------------------2------------------------------------------------

SELECT p.id_pracownik, m.miesiac, sp.koszt_calkowity,
    Sum(sp.koszt_calkowity) OVER (PARTITION BY p.id_pracownik, m.miesiac ORDER BY sp.koszt_calkowity) AS WARTOSC_KROCZACA,
    Sum(sp.koszt_calkowity) OVER (PARTITION BY p.id_pracownik, m.miesiac ORDER BY sp.koszt_calkowity ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS WARTOSC_CALKOWITA
    FROM h_pracownik p, h_miesiac_w_roku m, h_sprzedaz sp
    WHERE p.id_pracownik = sp.id_pracownik
    AND m.id_miesiac = sp.id_miesiac
    AND m.rok = 2021;
    ORDER BY p.id_pracownik, m.miesiac;

--Sprzedaz w kraju w poszczególnych latach (wartoœæ krocz¹ca + wartoœæ koñcowa)
-----------------------------3-------------------------------------------------

SELECT k.nazwa, m.rok, sp.koszt_calkowity AS zakup,
    Sum(sp.koszt_calkowity) OVER (PARTITION BY k.nazwa, m.rok ORDER BY sp.koszt_calkowity),
    Sum(sp.koszt_calkowity) OVER (PARTITION BY k.nazwa, m.rok ORDER BY sp.koszt_calkowity ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS WARTOSC_CALKOWITA
    FROM h_kraj k, h_miesiac_w_roku m, h_sprzedaz sp
    WHERE k.id_kraj = sp.id_kraj
    AND m.id_miesiac = sp.id_miesiac
    ORDER BY k.nazwa, m.rok;
