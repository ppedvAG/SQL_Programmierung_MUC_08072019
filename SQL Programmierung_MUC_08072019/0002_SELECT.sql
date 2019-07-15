use northwind;
GO --Batchdelimiter

select 1
go 5

--BATCH vs Transaction


select * from orders

--TOP ..

select top 10 orderid, freight from orders  order by 

select top 20 percent orderid, customerid,freight from orders 
	order by freight

--Wilde 13.. 13 besten Kunden nach Frachtjkosten (weniger ist besser)

select top 13 with ties orderid, customerid, freight from orders
 order by freight asc



select orderid, customerid as KdnR 
	from orders
	where
		kdnr = 'ALFKI'


select orderid, customerid as KdnR 
	from orders
	where
		customerid = 'ALFKI'
	order by kdnr

--Logischen Fluss

select customerid as Kdnr, sum(freight) as Frachtsumme
from orders 
where shipcountry = 'Germany'
group by customerid
order by customerid


Select customerid as Kdnr,Shipcountry, sum(freight) as Frachtsumme
from orders 
--where shipcountry = 'Germany'
group by customerid, Shipcountry having Shipcountry = 'Germany'
order by kdnr


--Tu nie im having etwas filtern, was ein where lösen kann
--Im Having dürfte nie etwas anderes als ein Aggregat stehen
--Logischer Fluss:
/*
FROM -- JOINS -- WHERE -- GROUP BY -- HAVING 
--SELECT -- ORDER BY -- TOP  DISTINCT --AUSGABE


*/


select * from customers

--Alle Kunden, die mit A beginnen (Companyname)

select * from customers where companyname like 'A%'

--Wildcards: * alle Spalten bei Ausgabe im SELECT
--           % beliebig viele Zeichen (0 bis irgendwo)
--			_ steht für ein Zeichen genau

select * from customers
where
	--es muss ein g vorkommen und der vorletzte muss ein e sein
	companyname like '%g%e_' 

--alle Kunden, die mit A bis E beginnen
--ein y im Namen haben und mit s enden

select * from customers
where
	companyname between 'A' AND 'EZZZZZZZ'--wat ist mit eZel
	AND
	COMPANYNAME like '%y%'
	AND
	COMPANYNAME like '%s'
	--companyname 
	--companyname

	substring (companyname, 1,1) between 'A' and 'E'
	Left (compananyname, 1)


	companyname like '[A-E]%y%s'
	--[] steht für genau ein Zeichen
	--[A-E] erster Buchstabe alle von a bis e
	--[1-5] 
	--[A-E]%' mit a bis e beginnend

	--suche nach allen Kunden, die ein % Zeichen im Namen haben
select * from customers
	where companyname like '%[%]%'

--PIN Prüfung jede Stelle muss eine Zahl sein

where PIN like '%[a-z]%'
where PIN like '[0-9][0-9|a-z][0-9][0-9]'

--Suche nach '

--Sucht mal nach den Kunden, die im Namen ein ' haben


select * from customers
	where companyname like '%''%'



select * from customers where companyname like '%!'



















