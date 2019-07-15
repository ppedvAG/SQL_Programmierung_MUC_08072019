create table t200 (id int identity, sp1 char(4100))

insert into t200
select 'XY'
GO 20000 --17 Sekunden (HDD ca 1 Sek)


declare @i as int =1

while @i <=20000
	begin
		insert into t200 (sp1) values ('XY')
		set @i+=1  --set @i=@i+1
	end
	
select * into t300 from t200



--nur noch 1 TX
declare @i as int =1
begin tran
while @i <=20000
	begin		
		insert into t200 (sp1) values ('XY')
		set @i+=1  --set @i=@i+1
	end
commit


While (bedingung)
	begin
			continue --sprint zum Schleifenkopf ohne die Schleife zu unterbrechen
			break--wird die Schelife sofort abgebrochen
	end


declare @i as int =0

while @i < 10
	begin
		select @i
		continue
		set @i=@i+1
		--break
		continue
	end

If 1=1 select 'A'

if 1=0	
	begin
		select 'A'
		select 100
	end
else
	Begin
		select 'B'
		select 'C'
	end


select * from orders
--erhöhe die Frachtkosten um 10% Schritte so:
-- dass gilt... Summe der Frachtkosten darf nicht über 100000
-- der max Wert Freight irgendeiner Bestellung über 1500 geht

select sum(freight), max(freight) from orders

begin tran
while
 begin end

select sum(freight), max(freight) from orders
rollback



select sum(freight), max(freight) from orders

begin tran
while	(select sum(freight) from orders) < 100000/1.1
	AND
		( select max(freight) from orders) < 1500/1.1
Begin 
	update orders set freight = freight *1.1
end
select sum(freight), max(freight) from orders
rollback
--jetzt noch darüber.. und jetzt???