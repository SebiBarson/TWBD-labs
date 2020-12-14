USE Firma
GO

ALTER TABLE Vanzari ALTER COLUMN DataVanz date CHECK (DataVanz > GETDATE())
GO

ALTER TABLE Clienti ALTER COLUMN Tip_cl CHAR(20) CHECK (Tip_cl = 'PFA' OR Tip_cl = 'PF' OR Tip_cl = 'SRL' OR Tip_cl = 'SA' OR Tip_cl = 'RA')
GO