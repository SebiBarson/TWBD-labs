USE Firma
GO

--Media Salariilor pe departamentul PRODUCTIE
SELECT AVG(F.Salariu) MedProductie FROM DEPARTAMENTE D, ANGAJATI A, FUNCTII F 
	WHERE A.IdDept=D.IdDept AND A.IdFunctie=F.IdFunctie AND D.Denumire='PRODUCTIE'
GO

--Mediile salariilor angajatilor grupate pe functii
SELECT F.Denumire, AVG(F.Salariu) AS MediaSalariilor FROM FUNCTII F, ANGAJATI A, DEPARTAMENTE D WHERE A.IdFunctie = F.IdFunctie AND A.IdDept=A.IdDept 
	GROUP BY F.Denumire
GO

--Cel mai mic/mare salariu din companie
SELECT MIN(Salariu) SalariuMinim, MAX(Salariu) SalariuMaxim FROM FUNCTII
GO

--Cel mai mic/mare salariu din departamentul VANZARI
SELECT MIN(Salariu) SalariuMinimVANZARI, MAX(Salariu) SalariuMaximVANZARI FROM FUNCTII F, ANGAJATI A, DEPARTAMENTE D 
	WHERE F.IdFunctie=A.IdFunctie AND D.IdDept=A.IdDept AND D.Denumire='VANZARI' 
GO

--Cele mai mici si cele mai mari salarii pe departamente
SELECT MIN(Salariu) SalariuMinimVANZARI, MAX(Salariu) SalariuMaximVANZARI, D.Denumire FROM FUNCTII F, ANGAJATI A, DEPARTAMENTE D 
	WHERE F.IdFunctie=A.IdFunctie AND D.IdDept=A.IdDept GROUP BY D.Denumire
GO

--Cati angajati are fiecare departament
SELECT D.Denumire, COUNT(A.IdAngajat) Nr_angajati FROM ANGAJATI A, DEPARTAMENTE D WHERE A.IdDept=D.IdDept GROUP BY D.Denumire
GO

--Angajatii, grupati pe departamente si vechimi (rotunjite la an)SELECT D.Denumire, A.Nume, A.Prenume, ABS(DATEDIFF(YEAR,GETDATE(),A.DataAngajarii)) AS Vechime 	FROM ANGAJATI A, DEPARTAMENTE D WHERE A.IdDept=D.IdDept	ORDER BY D.Denumire, ABS(DATEDIFF(YEAR,GETDATE(),A.DataAngajarii)) ,A.Nume,A.Prenume
GO

--Angajatii, grupati pe functii, ce au o vechime mai mare de 10 ani 
SELECT A.Nume, F.Denumire AS Functie,ABS(DATEDIFF(YEAR,GETDATE(),A.DataAngajarii)) AS Vechime FROM ANGAJATI A, FUNCTII F 
	WHERE A.IdFunctie=F.IdFunctie AND ABS(DATEDIFF(YEAR,GETDATE(),A.DataAngajarii))>10 ORDER BY F.Denumire
GO

--Angajatii, grupati pe departamente, ce au vârsta de minim 30 ani SELECT D.Denumire, A.Nume, A.Prenume, ABS(DATEDIFF(YEAR,GETDATE(),A.DataNasterii)) AS Varsta	FROM ANGAJATI A, DEPARTAMENTE D WHERE A.IdDept=D.IdDept AND ABS(DATEDIFF(YEAR,GETDATE(),A.DataNasterii))>30	ORDER BY D.Denumire, ABS(DATEDIFF(YEAR,GETDATE(),A.DataNasterii)) ,A.Nume,A.Prenume
GO

--Departamentele care au media salariilor mai mare decat 3000 
SELECT Departament, AVG(Salariu) AS Media_Salariu FROM vAngajati GROUP BY Departament
HAVING AVG(Salariu) > 3000

--Care este suma salariilor angajatilor din fiecare departamentSELECT D.Denumire, SUM(F.Salariu) AS SumaSalarii FROM FUNCTII F, ANGAJATI A, DEPARTAMENTE D		--PRIMESTE EROARE DACA ADAUG "GO" LA FINAL
	WHERE A.IdFunctie=F.IdFunctie AND A.IdDept=D.IdDept GROUP BY D.Denumire