--Aggregate: sum, min, max, count, avg

select sum(freight) as SummeFracht, 
	   avg(freight) as Schnittfrachtkosten
from orders


select customerid, sum(freight) from orders
group by customerid

--Summe der Frachtkosten pro Stadt in einem Land
select * from orders


select shipcountry as Land, shipcity as Stadt, sum(freight)
from orders
group by shipcountry , shipcity 

´---Wieviele Kunden gibt es pro Land count() --21 Zeilen
select * from customers


select		country , count(*) as Anzahl
from		customers
group by	country

--nun Anzahl der Kunden pro Stadt pro Land
--69
select		country , city, count(*) as Anzahl
from		customers
group by	country, city
order by	1,2



select		country , city, count(region) as Anzahl
from		customers
group by	country, city
order by	1,2

select * from customers

select count(region) from customers

--Suche alle DS in Customers wo ein NULL in Region vorkommt
--jeder mathematisch Vergleich mit NULL führt zu einem NULL

select * from customers where region = NULL

select * from customers where region is NULL --60
--was ist der Unterscheid zwischen Rollup und Cube?

--90
select		country , city, count(*) as Anzahl
from		customers
group by	country, city with rollup
order by	1,2

--boah... 160?
select		country , city, count(*) as Anzahl
from		customers
group by	country, city with cube
order by	1,2










	

