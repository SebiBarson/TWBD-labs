USE FIRMA
GO

-- Angajatii a caror functii contin secventa de caractere ‘ngi’
SELECT A.Nume, A.Prenume, F.Denumire 
	FROM ANGAJATI AS A, FUNCTII AS F
	WHERE A.IdFunctie=F.IdFunctie AND F.Denumire LIKE '%ngi%'
GO

SELECT A.Nume, A.Prenume, F.Denumire FROM ANGAJATI AS A
	JOIN FUNCTII AS F ON A.IdFunctie=F.IdFunctie
	WHERE F.Denumire LIKE '%ngi%'
GO

-- Salariile din departamentul ‘PRODUCTIE’ si cati angajati au aceste salarii
SELECT F.Salariu, COUNT(A.Nume) AS NrSalariati FROM ANGAJATI AS A
	JOIN FUNCTII AS F ON A.IdFunctie=F.IdFunctie
	JOIN DEPARTAMENTE AS D ON A.IdDept=D.IdDept
	WHERE D.Denumire='PRODUCTIE'
	GROUP BY F.Salariu
GO

--Cele mai mici/mari salarii din departamente
SELECT D.Denumire, MIN(F.Salariu) AS SalariuMinim, MAX(F.Salariu) AS SalariuMaxim FROM ANGAJATI AS A
	JOIN FUNCTII AS F ON A.IdFunctie=F.IdFunctie
	JOIN DEPARTAMENTE AS D ON A.IdDept=D.IdDept
	GROUP BY D.Denumire
GO

--Produsele vandute intr-o anumita perioada de timp
SELECT P.IdProdus,P.Denumire, V.DataVanz FROM PRODUSE AS P
	JOIN VANZARI AS V ON P.IdProdus=V.IDProdus
	WHERE V.DataVanz>='2016-07-03' AND V.DataVanz<='2016-08-06'
GO

--Clientii ce au cumparat produse prin intermediul unui vanzator anume
SELECT C.Denumire FROM CLIENTI AS C
	JOIN VANZARI AS V ON V.IDClient=C.IdClient
	JOIN ANGAJATI AS A ON V.IDVanzator=A.IdAngajat
	WHERE A.Nume='N13' AND A.Prenume = 'P9'
	GROUP BY C.Denumire
GO

--Clientii ce au cumparat doua produse
SELECT C.Denumire FROM CLIENTI AS C
	JOIN VANZARI AS V ON V.IDClient=C.IdClient
	GROUP BY C.Denumire
	HAVING COUNT(V.IdVanzare)=2
GO

--Clientii ce au cumparat CEL PUTIN doua produse INTR-O VANZARE
SELECT C.Denumire FROM CLIENTI AS C
	JOIN VANZARI AS V ON V.IDClient=C.IdClient
	WHERE V.NrProduse>=2
	GROUP BY C.Denumire
GO

--Numarul de clienti au cumparat (la o singura cumparare) produse in valoare mai mare decat o suma data (28)
SELECT COUNT(C.IdClient) FROM CLIENTI C
	JOIN VANZARI AS V ON V.IDClient=C.IdClient
	WHERE V.PretVanz>28
GO

--Clientii din BIHOR care au cumparat produse in valoare mai mare de 28
SELECT C.Denumire FROM CLIENTI C
	JOIN VANZARI AS V ON V.IDClient=C.IdClient
	WHERE V.PretVanz>28 AND C.Adresa_jud='bihor'
	GROUP BY C.Denumire
GO

--Mediile vânzărilor pe o anumită perioadă de timp, grupate pe produse
SELECT P.Denumire, AVG(V.PretVanz) AS MediaVanzari FROM VANZARI AS V
	JOIN PRODUSE AS P ON V.IDProdus=P.IdProdus
	WHERE V.DataVanz>='2016-07-03' AND V.DataVanz<='2016-08-06'
	GROUP BY P.Denumire
GO

--Numarul total de produse vandute pe o anumita perioada de timp
SELECT SUM(V.NrProduse) AS NrProduse FROM VANZARI AS V
	JOIN PRODUSE AS P ON V.IDProdus=P.IdProdus
	WHERE V.DataVanz>='2016-07-03' AND V.DataVanz<='2016-08-06'
GO

--Numarul de total de produse vandute de un vanzator precizat prin nume
SELECT SUM(V.NrProduse) AS NrProduse FROM VANZARI AS V
	JOIN PRODUSE AS P ON V.IDProdus=P.IdProdus
	JOIN ANGAJATI AS A ON V.IDVanzator=A.IdAngajat
	WHERE A.Nume='N13' AND A.Prenume = 'P9'
GO

--Clientii ce au cumparat produse in valoare mai mare decat media vanzarilor din luna august 2016
SELECT C.Denumire FROM CLIENTI C
	JOIN VANZARI AS V ON V.IDClient=C.IdClient
	GROUP BY C.Denumire
	HAVING SUM(V.PretVanz)>(SELECT AVG(V.PretVanz) FROM VANZARI V WHERE MONTH(V.DataVanz)=8 AND YEAR(V.DataVanz)=2016)
GO

--Produsele care s-au vandut la mai mult de un client----------------------------------------------------------------
SELECT P.Denumire FROM PRODUSE AS P
	JOIN VANZARI AS V ON P.IdProdus=V.IDProdus
	GROUP BY P.Denumire
	HAVING COUNT(V.IdVanzare)>1
GO

--Vanzarile valorice realizate de fiecare vanzator, grupate pe produse si clienti, cu subtotaluri
SELECT A.Nume, P.Denumire, C.Denumire, SUM(V.PretVanz) FROM PRODUSE AS P
	JOIN VANZARI AS V ON P.IDProdus=V.IDProdus
	JOIN CLIENTI AS C ON C.IDClient=V.IDClient
	JOIN ANGAJATI AS A ON A.IDAngajat=V.IDVanzator
	GROUP BY A.Nume, P.Denumire, C.Denumire
GO