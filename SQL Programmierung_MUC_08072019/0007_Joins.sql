select top 1 c.companyname,sum(od.unitprice*quantity) as Zaster
from 
	customers c 
		inner join orders o           on c.customerid = o.customerid
		inner join [Order Details] od on od.orderid = o.orderid
group by c.companyname
order by Zaster asc

UNION ALL

select top 1 c.companyname,sum(od.unitprice*quantity) as Zaster
from 
	customers c 
		inner join orders o           on c.customerid = o.customerid
		inner join [Order Details] od on od.orderid = o.orderid
group by c.companyname 
order by Zaster desc






select top 1 c.companyname,sum(od.unitprice*quantity) as Zaster
into #tKundebestmies
from 
	customers c 
		inner join orders o           on c.customerid = o.customerid
		inner join [Order Details] od on od.orderid = o.orderid
group by c.companyname
order by Zaster asc


insert into #tKundebestmies
select top 1 c.companyname,sum(od.unitprice*quantity) as Zaster
from 
	customers c 
		inner join orders o           on c.customerid = o.customerid
		inner join [Order Details] od on od.orderid = o.orderid
group by c.companyname 
order by Zaster desc

select * from #tKundebestmies


select * from (
select top 1 c.companyname,sum(od.unitprice*quantity) as Zaster
from 
	customers c 
		inner join orders o           on c.customerid = o.customerid
		inner join [Order Details] od on od.orderid = o.orderid
group by c.companyname
order by Zaster asc) t1
UNION ALL
select * from (
select top 1 c.companyname,sum(od.unitprice*quantity) as Zaster
from 
	customers c 
		inner join orders o           on c.customerid = o.customerid
		inner join [Order Details] od on od.orderid = o.orderid
group by c.companyname 
order by Zaster desc) t2




select * from employees

--eine Liste aller MItarbeiter und deren Stellvertreter

select e.employeeid, e.lastname, e.city, e2.lastname, e2.city from employees e
left join employees e2  on e.city=e2.city
  and e.employeeid != e2.employeeid














