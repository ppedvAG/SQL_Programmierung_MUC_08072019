--Fehlerbahndlung

--Fehler k�nnen passieren, aber was! soll passieren..
--rote Meldung oder TSQL Code

--begin try
--Code ausf�hren
--catch


use Northwind;
GO

Begin try
	Begin Tran
	insert into customers (customerid, companyname)
		values	('ppedv', 'ppedv ag');

IF @@ERROR <> 0
	BEGIN 
		ROLLBACK TRAN	
		RAISERROR ('Fehler beim Einf�gen!', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               );  
	END

Update customers set companyname = companyname +'XY'
	where customerid = 'ALFKI'

IF @@ERROR <> 0
	BEGIN
		Rollback tran
		RAISERROR ('Fehler beim Aktualisieren', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               );  
	END
End try
Begin Catch
	select Error_line(), Error_Message(), Error_Severity()	
end catch
