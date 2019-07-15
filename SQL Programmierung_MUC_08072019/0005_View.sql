--Sicht

/*
Sicht hat keine Daten (--> ind. Sicht)

gemerkte Abfrage mit Namen
auch nach Neustart verwendbar
wird wie eine Tabellen verwendet

SELECT 
INS
UP
DEL
RECHTE


Wann Sicht: komplexe Abfragen wiederverwendbar

eine Sicht kann nur ein SELECT Statement enthalten


*/

create view vKundenGer
as
select customerid, companyname, city, country
from customers
where country = 'Germany';
GO

select * from vKundenGer

--Was ist schneller? Sicht oder adhoc Abfrage



select customerid, companyname, city, country
from customers
where country = 'Germany';


select * from vKundenGer

insert into vkundenger (customerid, companyname, city, country)
values
						('ppedv', 'ppedv AG', 'MUC', 'Germany')


select * from customers

--der insert funktioniert nur wenn alle Pflichtfelder gefüllt sind

insert into vkundenger (customerid, companyname, city, country)
values
						('pped2', 'ppedv AG', 'MUC', 'Austria')

select * from vkundenGer

delete from vKundenger

---aus Rechtegründe


create table demo1 (id int, land int, stadt int)


insert into demo1
select 1,10,100


insert into demo1
select 2,20,200


insert into demo1
select 3,30,300

select * from demo1

create view vdemo1
as
select * from demo1

select * from vdemo1


alter table demo1 add Fluss int

update demo1 set fluss = id *1000

select * from vdemo1-- Sicht bringt nicht wie erwartet alle * Spalten

alter table demo1 drop column Land

select * from demo1

select * from vdemo1

--komplett falsches Ergebnis

-- kann man vermeiden, wenn man schemabindung verwendet



create table demo2 (id int, land int, stadt int)


insert into demo2
select 1,10,100


insert into demo2
select 2,20,200


insert into demo2
select 3,30,300

select * from demo2

--schemabindiung fürht zu einem exakten Arbeiten!!

create view vdemo2  with schemabinding
as
select id, stadt, land from dbo.demo2




select * from vdemo2


alter table demo2 add fluss int

alter table demo2 drop column land




					


