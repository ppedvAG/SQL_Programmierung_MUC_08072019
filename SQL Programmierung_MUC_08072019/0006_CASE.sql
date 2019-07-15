--

use northwind


select customerid , companyname, country, city
into KUEU
from customers
where
	country in ('UK','Germany', 'Italy', 'France')


select customerid , companyname, country, city
inTO KUALLE
from customers


select * from kueu


update kueu set city = 'München' where customerid = 'ALFKI'


update kueu set city = 'Oxford' where customerid = 'AROUT'


--Aufgabe: Wiedergabe aller Kunden:

select * from kueu --33
UNION ---aber: der filtert doppelte Zeilen (Ergenniszeilen)
select * from kualle --92

select customerid, country, companyname from kueu
union
select customerid, country, companyname from kualle

--union all: sucht nicht nach doppelten
select customerid, country, companyname from kueu
union all
select customerid, country, companyname from kualle

--bei UNION: Reihenfolge zählt, Datentyp!
+--erste Zeiel legt fest: Spaltennamen
select customerid, country as Land, companyname from kueu
union all
select customerid, companyname, country from kualle

--ABC Analyse:
select * from orders
--orderid, freight, customerid, Klasse (A B oder C)
-- Freight > 500 --> C
-- Freight < 10  --> A
-- dazwischen --> B
select *, 'A' from orders where freight < 10

--Werkzeuge: 3 Select und UNION
--CASE
--#tab

select orderid, customerid, freight, 'A' as Klasse
from   orders
	where freight < 10
UNION ALL
select orderid, customerid, freight, 'B'
from orders
	where freight between 10 and 500
UNION ALL
select orderid, customerid, freight, 'C'
from orders
	where freight > 500

create table #t2(orderid int, customerid nchar(5), 
					freight money, klasse char(1))

insert into #t2
select orderid, customerid, freight, 'B' as klasse
from orders
	where freight between 10 and 500


	select * from #t2



select orderid, customerid, freight,
		case
			when freight < 10 then 'A'
			when freight < 500 then 'C'
			else 'B'
		end as Klasse
from orders

NTILE(4)

--







