

select * into taby from ku1
select * into tabx from ku1


select * from tabx where city = 'Berlin'

select * from tabx where ID =100



drop proc procdemo
create proc procdemo @id int
as
select * from tabx where id < @id;
GO

select * from tabx where id < 1000000

set statistics io, time on

exec procdemo 2 --57 ms --4 Seiten
dbcc showcontig ('tabx') --46853

exec procdemo 1000000 ---1002239

select * from tabx


