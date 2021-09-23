---------------------------------------CUBE------------------------------------------------------
--jaki doch�d przynosz� produkty danych producent�w i jaki doch�d przynosi konretny produkt
-------------------1---------------------------------------------------

SELECT producent.nazwa, produkt.id_produkt, Sum(sp.koszt_calkowity)
    FROM h_producent producent, h_produkt produkt, h_sprzedaz sp
      WHERE producent.id_producent = sp.id_producent
      AND produkt.id_produkt = sp.id_produkt
        GROUP BY cube(produkt.id_produkt, producent.nazwa);

--kt�ra kategoria produkt�w w danych miastach w poszczeg�lnych latach przynosi najwi�ksze zyski
-------------------2---------------------------------------------------

SELECT kat.kategoria, mia.nazwa, mie.rok, Sum(sp.koszt_calkowity)
    FROM h_kategoria kat, h_miasto mia, h_miesiac_w_roku mie, h_sprzedaz sp
    WHERE kat.kategoria = sp.kategoria
    AND mia.id_miasto = sp.id_miasto
    AND mie.id_miesiac = sp.id_miesiac
      GROUP BY cube(kat.kategoria, mia.nazwa, mie.rok);

--w kt�rym miesiacu i w jakim sklepie by�o ile klient�w (1 sprzedaz = 1 klient)
-------------------3-----------------------------------------------------

SELECT s.id_sklep, m.miesiac, m.rok, Count(k.id_klient) AS LICZBA_KLIENTOW
    FROM h_sklep s, h_miesiac_w_roku m, h_klient k, h_sprzedaz sp
    WHERE s.id_sklep = sp.id_sklep
    AND m.id_miesiac = sp.id_miesiac
    AND k.id_klient = sp.id_klient
      GROUP BY cube(s.id_sklep, m.rok, m.miesiac);

