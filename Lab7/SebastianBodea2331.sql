USE Firma 
GO

--1. Scrieti si testati o functie care returneaza angajatii a caror functii contine o secventa de caractere primita
--	  ca parametru 

CREATE FUNCTION DBO.angajati_cu_functia (@secventa varchar(10))
RETURNS TABLE
AS
RETURN
	SELECT A.NUME, A.Prenume, F.Denumire FROM ANGAJATI A
		JOIN FUNCTII F ON A.IdFunctie=F.IdFunctie
		WHERE F.Denumire LIKE '%'+@secventa+'%'
GO

SELECT * FROM DBO.angajati_cu_functia('ngi')
GO

--2. Scrieti si testati o functie care returneaza salariile dintr-un departament primit ca parametru

CREATE FUNCTION DBO.salarii_pe_dept (@departament varchar(10))
RETURNS TABLE
AS
RETURN
	SELECT F.Salariu, COUNT(IdAngajat) AS NrAngajati FROM ANGAJATI A
		JOIN FUNCTII F ON A.IdFunctie=F.IdFunctie
		JOIN DEPARTAMENTE D ON A.IdDept=D.IdDept
		WHERE D.Denumire = @departament
		GROUP BY F.Salariu
GO

SELECT * FROM DBO.salarii_pe_dept('PRODUCTIE')
GO

--3. Scrieti si testati o functie care returneaza salariul minim si maxim dintr-un departament primit ca parametru

CREATE FUNCTION DBO.max_min_salarii_pe_dept (@departament varchar(10))
RETURNS TABLE
AS
RETURN
	SELECT MIN(F.Salariu) AS SalariuMin, MAX(F.Salariu) AS SalariuMax FROM FUNCTII F
		JOIN ANGAJATI A ON A.IdFunctie=F.IdFunctie
		JOIN DEPARTAMENTE D ON A.IdDept=D.IdDept
		WHERE D.Denumire = @departament
GO

SELECT * FROM DBO.max_min_salarii_pe_dept('PRODUCTIE')
GO

--4. Scrieti si testati o functie care returneaza produsele vandute intr-o anumita perioada de timp

CREATE FUNCTION DBO.produseVanduteIntre (@data_min date, @data_max date)
RETURNS TABLE
AS
RETURN
	SELECT P.Denumire FROM VANZARI V
		JOIN PRODUSE P ON V.IDProdus=P.IdProdus
		WHERE V.DataVanz>= @data_min AND V.DataVanz<= @data_max
		GROUP BY P.Denumire
GO

SELECT * FROM DBO.produseVanduteIntre('2016-07-03','2016-08-05')
GO

--5.A. Scrieti si testati o functie care returneaza suma totala incasata de un vanzator al carui nume este trimis ca 
--      parametru

CREATE FUNCTION DBO.incasari_pe_vanzator(@nume varchar(20), @prenume varchar(20))
RETURNS	decimal
AS
BEGIN
	DECLARE @suma decimal;
	SELECT @suma = SUM(V.PretVanz) FROM VANZARI V
		JOIN ANGAJATI A ON A.IdAngajat=V.IDVanzator
		WHERE A.Nume=@nume AND @prenume=A.Prenume
	RETURN @suma
END

SELECT DBO.incasari_pe_vanzator('N13','P9') AS IncasariPeVanzator

--5.B. Scrieti si testati o functie care se bazeaza pe prima si care verifica daca suma depaseste un anumit prag 
--		minim trimis ca parametru

CREATE FUNCTION vanzatori_activi(@prag decimal)
RETURNS	TABLE
AS
RETURN
	SELECT A.Nume, A.Prenume, DBO.incasari_pe_vanzator(A.Nume,A.Prenume) AS SumaVanzari FROM ANGAJATI A
		WHERE DBO.incasari_pe_vanzator(A.Nume,A.Prenume)>@prag
GO

SELECT * FROM DBO.vanzatori_activi(100)
GO

--6. Scrieti si testati o functie care returneaza cele mai vandute N produse, intr-o anumita perioada de timp

CREATE FUNCTION DBO.produse_populare(@nr_produse bigint, @dataMin date, @dataMax date)
RETURNS	TABLE
AS
RETURN 
	SELECT TOP (@nr_produse) P.Denumire, SUM(V.NrProduse) AS CANTITATE FROM VANZARI V
		JOIN PRODUSE P ON V.IDProdus=P.IdProdus
		WHERE V.DataVanz>=@dataMin AND V.DataVanz<=@dataMax
		GROUP BY P.Denumire
		ORDER BY SUM(V.NrProduse) DESC
GO

SELECT * FROM DBO.produse_populare(2, '2016-06-02','2016-08-05')

--7. Scrieti si testati o functie care returneaza clientii ordonati descrescator dupa sumele cheltuite, intr-o anumita 
--	  perioada de timp ale carei limite sunt trimise ca parametri

CREATE FUNCTION DBO.clientii_cei_mai_fideli(@dataMin date, @dataMax date)  
RETURNS	TABLE
AS
RETURN 
	SELECT TOP 9223372036854775807	--Dintr-un oarecare motiv nu ma lasa sa folosesc order by fara top sau offset
									--Numarul specificat dupa TOP e un BIGINT iar aceea e valoarea maxima a acestui tip de date
		C.Denumire, SUM(V.PretVanz) AS Bani_Cheltuiti FROM VANZARI V
		JOIN CLIENTI C ON V.IDClient=C.IdClient
		WHERE V.DataVanz>=@dataMin AND V.DataVanz<=@dataMax
		GROUP BY C.Denumire
		ORDER BY SUM(V.PretVanz) DESC
GO

SELECT * FROM DBO.clientii_cei_mai_fideli('2016-06-02','2016-07-05')