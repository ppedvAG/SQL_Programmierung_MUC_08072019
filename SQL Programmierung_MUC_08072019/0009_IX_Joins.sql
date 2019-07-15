/*
  --Indizes


------------------------------------------------
/*
gruppierter  x   = pyhsikal. sortierte Tabelle
nicht gruppierter ..x
---------------------------------
eindeutigen, Unique ..x  IX Schlüsselspaltenwert nur einmal
zusammengesetzter ...x mehrere Schlüsselspalten
IX mit eingeschlossenen Spalten ...x  Statt alle Werte in den IX Baum zu bringen
				kann man auch Werte  (die aus dem SELECT) ans Ende des Baumes kopiere ohne den Baum slebst zu belasten
partitionierter IX ..x  physikalisch gesplitteter IX
abdeckenden ....x  --der perfekt IX (reine Seek, kein Scan, kein Lookup)
Indizierte Sicht ...x
gefilterter ...x nicht alle Datensätze einer Tabelle in IX bringen
hypothetischen  wird nur von DB Optimierungsratgeber erzeugt
		existieren real, aber DB Engine verwendet sie nicht
		sind im SSMS nicht zu sehen
--------------------------------
Columnstore  -- SOnderfall

select * from sys.dm_db_index_usage_Stats

sp_blitzindex

N GR IX nur gut bei rel wenigen Ergebniszeilen

GR IX gut bei eindeutigen , aber auch umgfangreicheren Eregbnissen
--> perfekt für Bereichsabfragen

Gr IX kann es nur einmal geben!!
N GR IX bis ca 1000 mal pro Tabelle

GR IX = Tabelle in physikalisch sortierter Form

NGR Telefonbuch mit Zeiger zum Org Datensatz (im Heap)-- Kopie bestimmter Daten



select * from tabelle where !!!


=
<
>
!=
IN
Between
like 'A%'
like '%A'
<>







*/

SELECT        Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, 
                         Orders.ShipName, Orders.ShipCity, Orders.ShipCountry, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock, Employees.LastName, 
                         Employees.FirstName, Employees.BirthDate

INTO KU1
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
                         Employees ON Orders.EmployeeID = Employees.EmployeeID




insert into ku1
select * from ku1


--ku1: HEAP
select * from ku1 where customerid = 'ALFKI'


--bisher noch keine eindeutige Zahl

alter table ku1 add id int identity
--immer noch HEAP

select * from ku1 where id = 100--Table Scan

set statistics io, time on

select * from ku1 where id = 100--ca 60000
--Orderdate als CL IX 

select id from ku1 where id = 100
--NIX_ID


select id from ku1 where id = 100 --IX Seek 3 Seiten


select id, city from ku1 where id = 100 --4 Seiten mit Lookup

--besser mit: NIX_ID_CITY
select id, city from ku1 where id = 100 --3 Seiten

select id, city, country from ku1 where id = 100 --3 Seiten



select customerid, sum(unitprice*quantity)
from ku1
where freight < 0.5 
group by customerid

--NIX_Fr_inkl_cidupqu

---Kopie der ku1 in ku2 = Heap

select * into ku2 from ku1

select top 3 * from ku1
--where , agg , 

--companyname,

select country, productname, sum(unitsinstock) from ku1
where freight < 2
group by country, productname
--idealer IX: GIX_FR   NIX_FR_inkl_cy_pr_us


select country, productname, sum(unitsinstock) from ku2
where freight < 2
group by country, productname






--companyname,

select country, lastname, sum(unitsinstock) from ku1
where id < 100
group by country, lastname
--idealer IX: GIX_FR   NIX_FR_inkl_cy_pr_us
select country, lastname, sum(unitsinstock) from ku2
where id < 100
group by country, lastname


select * from sys.dm_db_column_store_row_group_physical_stats

update ku2 set freight = freight *1.1 where id < 100


--DMV
select * from sys.dm_db_index_usage_stats

select *from customers c
	inner loop join orders o on c.customerid=o.customerid


select * from customers c
	inner  join orders o on c.customerid=o.customerid where freight < 1






select *from customers c
	inner hash join orders o on c.customerid=o.customerid


























