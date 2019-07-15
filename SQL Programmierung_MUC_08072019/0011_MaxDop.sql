--Parallelismus
--Standard 5 und 0
--eine Abfrage muss nicht unebdingt alle CPUs verwenden
--repartition stream und gather stream im Plan sind ein guter Hinweis
--dass weniger CPUs besser gewesen wäre


select country, sum(freight) from tabx
group by country
option (maxdop 4)

--verwendet mehrere CPUs..
--Wieviele: 1 oder alle
--bringt das was?

--OLAP 50 / 8
--OLTP 25 /50% CPUs max 8

--


--Problem beheben: 



