---------------------------------------ROLLUP------------------------------------------------------
--Jak duze dochody ma sklep w danym miesiacu
-------------------1--------------------------------------------------

SELECT s.id_sklep, m.miesiac, m.rok, Sum(sp.koszt_calkowity) AS Dochody
    FROM h_Sklep s, h_Miesiac_w_roku m, h_Sprzedaz sp
    WHERE sp.id_miesiac = m.id_miesiac
    AND sp.id_sklep = s.id_sklep
        GROUP BY rollup(s.id_sklep, m.rok, m.miesiac) ORDER BY s.id_sklep, m.rok, m.miesiac;

--w którym kraju, w jakim sklepie by³o ile zysków ze sprzeda¿y
-------------------2--------------------------------------------------

SELECT k.nazwa, s.id_sklep, Sum(sp.koszt_calkowity)
    FROM h_Sklep s, h_kraj k, h_sprzedaz sp
    WHERE sp.id_sklep = s.id_sklep
    AND sp.id_kraj = k.id_kraj
      GROUP BY rollup(k.nazwa, s.id_sklep);

--jakie s¹ miesiêczne zyski ze sprzedazy w kraju i jego wojewodztwach
------------------3-----------------------------------------------------

SELECT k.nazwa, w.nazwa, m.miesiac, m.rok, Sum(sp.koszt_calkowity)
    FROM h_kraj k, h_wojewodztwo w, h_miesiac_w_roku m, h_sprzedaz sp
    WHERE k.id_kraj = sp.id_kraj
    AND w.id_wojewodztwo = sp.id_wojewodztwo
    AND m.id_miesiac = sp.id_miesiac
      GROUP BY rollup(k.nazwa, w.nazwa, m.rok, m.miesiac);
