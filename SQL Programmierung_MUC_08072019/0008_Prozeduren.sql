--Prozeduren
select newid()
create procedure gpname
as
--Code

exec gpname

--nicht mischbar mit JOINs

--funktioninert wie Batch
--und kann zahlreiche verschiedenste Anweisungen enthalten
--daher ist sehr häufig BI dort zu finden
--liegt auf dem Server in der DB
--und gilt als schnell

create proc gpname @par int, @par2 int
as
select * from tab where sp = @par1 or sp2 = @par2



exec gpname 2,5

exec gpname @par1=2 , @par2=5



create proc gp_KundeLandsuche @land varchar(50)
as
select * from customers where country = @land

exec gp_kundeLandSuche 'Germany'

alter proc gp_kundeLandsuche @land varchar(50)
as
select companyname from customers where country like @land

exec gp_kundeLandSuche 'Germany'

drop proc gp_kundeLandSuche

drop proc gpzeit

create proc gpZeit
as
select getdate();
GO


exec gpZeit

--flexible Suche
--customers customerid

exec gpKundenSuche 'ALFKI' --1 Wert

exec gpKundenSuche 'A' --4 Wert

exec gpKundenSuche '' --alle


--Parameter? Welcher Datentyp?
--gehts auch ohne Angabe des Parameters für die Suche nach allen?



create proc gpkdsearch @kdid nchar(5)
as
select * from customers where customerid like @kdid +'%'


exec gpkdsearch 'ALFKI'

exec gpkdsearch 'A'

exec gpkdsearch 



alter proc gpkdsearch @kdid varchar(10) = '%'
as
select * from customers where customerid like @kdid +'%'

--Prozedur schneller?

--weil der Plan fest hinterlegt wird..
--beim ersten aufruf mit dem ersten Parameter



create proc gpdemo2 @par1 int
as
if @par1 <100
select * from orders where orderid < @par1
else
select * from products where productid > par1






proc gpx 2
if 1
	exec gp1 
else 
	exec gp2 --vermutlich kein IX mehr




exec gpZeit

--kann ich Ergebnisse der Prozedur weiterverwenden?

--Variablen gelten nur während des Batches

declare @var1 as int = 0, @var2 int

set @var1 = 1
select @var1
select @var1=count(*) from orders
select @var1
--select @var1=count(*), count(*) from orders--error


alter proc gpZahl @par1 int = 1, @par2 int , @par3 int output
as
select @par3=@par1*@par2
select @par3
GO

exec gpzahl @par2=100
GO

declare @pgresult as int
exec gpzahl 2,4,@pgresult  output


exec gpzahl  @par2=2
select 100* @pgresult

























