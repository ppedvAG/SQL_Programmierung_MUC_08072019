--temporäre Tabellen

/*
#tab: lokale temp. Tabelle
 irgendwann weg: Lebensdauer!
 Sie ist weg, wenn
	der Ersteller die Verbindung beendet
	der Ersteller sie löscht 

Zugriff
	nur der Ersteller hat Zugriff in seiner Verbindung 
	in der er sie erstellt hat



##tab: globale temp. Tabelle
	bis die Verbindung weg ist
	der Ersteller sie löscht
	kann im Prinzip jeder zugreifen


Unterschied zu Sicht
 Sicht hat keine Daten (live)
 Temp hat Kopien (also keine aktuellen Daten evtl)



*/

select  100  as SP1 into #t1

select * from #t1

select  100  as SP1 into ##t1

select * from ##t1




select		country , city, count(*) as Anzahl
into #tAnzKunden
from		customers

group by	country, city with cube
order by	1,2

select * from #tAnzKunden




