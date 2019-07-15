--Funktionen

create function fdemo(@par1 int,@par2 int) returns int
as
	begin
		return (select @par1 * @par2)
	end

--F() ist extrem praktisch, Sie kann überall im SQL Statments eingesetzt werden
--select sp, f(sp) from f(wert) where f(sp) > f(wert)

select fdemo(2,4) --exakter Aufruf notwendig

select * from datenbank.schema.objekt

use master

select * from northwind.dbo.orders

use northwind


select * from dbo.orders


select * from orders

select dbo.fdemo(100,40)-- jetzt gehts..


--fbrutto(nettowert)

create function fbrutto(@netto money) returns money
as
	begin
		return (select @netto * 1.19)
	end


select dbo.fbrutto(freight) from orders

select * from orders where dbo.fbrutto(freight) < 10



--fRsumme(orderid) --> Rsumme


create function fRngsumme(@oid int) returns money
as
	Begin
		return (select sum(unitprice*quantity) from [Order Details]
				where orderid = @oid)
	end




select dbo.frngsumme(10248)

select * from tabx where freight *1.19 < 0.2

select * from tabx where freight  < 0.2/1.19

select * from tabx where dbo.fbrutto(freight) < 0.2




create function ftab (@land varchar(50)) returns table
as
	return (select * from customers where country = @Land)

select * from dbo.ftab('Italy')






--Alle bestellungen deren Frachtkosten in Brutto unter 2 liegen


set statistics io , time on
select * from tabx where dbo.fbrutto(freight)  < 0.2 --scan

select * from tabx where freight *1.19 < 0.2

select * from tabx where freight  < 0.2/1.19

select * from mitarbeiter
	where datediff(yy, getdate(), birthdate) >= 18
		birthdate < dateadd(yy, getdate(), -18)



alter table orders add RngSumme as dbo.frngsumme(orderid)  

select orderid from orders where rngsumme < 500

select f() from orders

--








