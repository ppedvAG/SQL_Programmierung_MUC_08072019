--

select DISTINCT TOP percent with ties
	 Sp 
	 * Wildcard
	 AGG () as Alias
	 Unterabfragen
	 Case when ..else end
	 Text, zahl
	 Mathe
	 f()	 	
from TAB, VIEW, (SELECT..)t1, F()
	inner|left|right|cross join TAB
	APPLY
where
		SP = like is null  >= <= != <> not 
		in
		between
		exists
		SP = (select avg(freight) from orders)
		SP in (select freight from orders)



--Welche Kunden haben nichts bestellt?


set statistics io, time on

select * from customers
where not exists 
		(select * from orders 
					where 
					orders.customerid=customers.customerid);

select * from customers 
		where customerid not in 
						(Select customerid from orders)

						
select * from customers c inner join orders o
					ON c.customerid = o.customerid and o.orderid is null
		--where o.orderid is null


select * from (
select * from (select top 1 orderid from orders where ..)) t where 


select * from customers c inner join orders o
					ON c.customerid = o.customerid




select * from customers c right join orders o
					ON c.customerid = o.customerid





select * from customers c left join orders o
					ON c.customerid = o.customerid
		where o.orderid is null




select * from orders o right join customers c
					ON c.customerid = o.customerid
		where o.orderid is null









select * from (
select * from orders) t inner join 
--Unterabfragen
select *, (select avg(freight) from orders) from customers

----in einem Ergebnis.. den besten Kunden nach Umsatz
--und den schlechtesten Kunde nnach Umsatz gemessen













