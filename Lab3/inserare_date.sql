USE Firma
GO

INSERT INTO DEPARTAMENTE (Denumire) VALUES('Commercial')
INSERT INTO DEPARTAMENTE (Denumire) VALUES('Human Resources')
INSERT INTO DEPARTAMENTE (Denumire) VALUES('Administrative')
GO

INSERT INTO FUNCTII (Denumire, Salariu) VALUES('Sales agent', 2500)
INSERT INTO FUNCTII (Denumire, Salariu) VALUES('HR manager', 2600)
INSERT INTO FUNCTII (Denumire, Salariu) VALUES('Program manager', 2600)
INSERT INTO FUNCTII (Denumire, Salariu) VALUES('Executive head', 3000)
INSERT INTO FUNCTII (Denumire, Salariu) VALUES('Recruiter', 2600)
INSERT INTO FUNCTII (Denumire, Salariu) VALUES('Advertisment manager', 2600)
GO

INSERT INTO CATEGORII_PROD (Denumire) VALUES('Laptop/Netbook')
INSERT INTO CATEGORII_PROD (Denumire) VALUES('Desktop')
GO

INSERT INTO PRODUSE (Denumire, IdCateg) VALUES('AREA-51 M',1)
INSERT INTO PRODUSE (Denumire, IdCateg) VALUES('M15',1)
INSERT INTO PRODUSE (Denumire, IdCateg) VALUES('M17',1)
INSERT INTO PRODUSE (Denumire, IdCateg) VALUES('AURORA RYZEN™ R10',2)
INSERT INTO PRODUSE (Denumire, IdCateg) VALUES('AURORA R11',2)
INSERT INTO PRODUSE (Denumire, IdCateg) VALUES('AURORA R9',2)
GO

INSERT INTO CLIENTI(Denumire, Tip_cl, Adresa_jud) VALUES('Pixelated','Regular','Alba')
INSERT INTO CLIENTI(Denumire, Tip_cl, Adresa_jud) VALUES('Casper','Fresh','Bihor')
INSERT INTO CLIENTI(Denumire, Tip_cl, Adresa_jud) VALUES('Coff','Veteran','Cluj')
GO

INSERT INTO ANGAJATI(Nume,Prenume,Marca,DataNasterii,DataAngajarii,Adresa_jud,IdFunctie,IdDept) VALUES('Tormund','Giantsbane',100,'1989-06-19','2011-03-12','Cluj',2,2)
INSERT INTO ANGAJATI(Nume,Prenume,Marca,DataNasterii,DataAngajarii,Adresa_jud,IdFunctie,IdDept) VALUES('Sandor','Clegane',101,'1988-04-16','2012-06-13','Cluj',1,1)
INSERT INTO ANGAJATI(Nume,Prenume,Marca,DataNasterii,DataAngajarii,Adresa_jud,IdFunctie,IdDept) VALUES('Arya','Stark',102,'1991-05-11','2011-01-15','Cluj',3,3)
INSERT INTO ANGAJATI(Nume,Prenume,Marca,DataNasterii,DataAngajarii,Adresa_jud,IdFunctie,IdDept) VALUES('Arthur','Dayne',103,'1978-01-25','2013-05-14','Cluj',4,3)
INSERT INTO ANGAJATI(Nume,Prenume,Marca,DataNasterii,DataAngajarii,Adresa_jud,IdFunctie,IdDept) VALUES('Rickard','Karstark',104,'1993-02-28','2011-05-19','Cluj',6,2)
INSERT INTO ANGAJATI(Nume,Prenume,Marca,DataNasterii,DataAngajarii,Adresa_jud,IdFunctie,IdDept) VALUES('Tyrion','Lannister',105,'1990-07-15','2010-05-10','Cluj',5,1)
GO

INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(3,2,2,'2020-09-15',2,6000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(1,3,2,'2020-09-15',3,8000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(2,1,2,'2020-09-16',1,3000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(2,3,2,'2020-09-17',2,6000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(4,3,2,'2020-09-17',3,7500)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(5,1,2,'2020-09-17',4,10000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(5,2,2,'2020-09-17',1,2000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(6,3,2,'2020-09-18',2,4000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(3,2,2,'2020-09-18',3,7000)
INSERT INTO VANZARI(IdProdus,IdClient,IdVanzator,DataVanz,NrProduse,PretVanz) VALUES(6,1,2,'2020-09-19',2,4000)
GO