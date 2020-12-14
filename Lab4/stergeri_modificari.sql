USE Firma
GO

DELETE FROM Clienti WHERE Adresa_jud='Alba'
GO

DELETE FROM VANZARI WHERE YEAR(GETDATE())>YEAR(DataVanz)+2
GO

DELETE FROM ANGAJATI WHERE IdDept=2 AND DataAngajarii > '01-01-2018'
GO

UPDATE PRODUSE SET Denumire=Denumire+'-V2' WHERE IdProdus%2=1
GO

UPDATE VANZARI SET PretVanz = PretVanz+ PretVanz/10 WHERE IdProdus in (select * from PRODUSE where IdCateg=2) AND DataVanz > '01.01.2020'
GO