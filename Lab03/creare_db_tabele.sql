CREATE DATABASE Firma
GO

USE Firma
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DEPARTAMENTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[DEPARTAMENTE]
GO

CREATE TABLE DEPARTAMENTE (
	IdDept int PRIMARY KEY IDENTITY,
	Denumire varchar(20) NOT NULL
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNCTII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[FUNCTII]
GO

CREATE TABLE FUNCTII (
	IdFunctie int PRIMARY KEY IDENTITY,
	Denumire varchar(20) NOT NULL,
	Salariu decimal CHECK (Salariu>=900)
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ANGAJATI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[ANGAJATI]
GO

CREATE TABLE ANGAJATI (
	IdAngajat int PRIMARY KEY IDENTITY,
	Nume varchar(20) NOT NULL,
	Prenume varchar(20) NOT NULL,
	Marca int NOT NULL UNIQUE,
	DataNasterii date,
	DataAngajarii date DEFAULT GETDATE(),
	Adresa_jud varchar(20) DEFAULT ('<unspecified>'),
	IdFunctie int NOT NULL,
	IdDept int NOT NULL
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VANZARI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[VANZARI]
GO

CREATE TABLE VANZARI (
	IdVanzare int PRIMARY KEY IDENTITY,
	IdProdus int NOT NULL,
	IdClient int NOT NULL,
	IdVanzator int NOT NULL,
	DataVanz date NOT NULL DEFAULT GETDATE(),
	NrProduse decimal NOT NULL CHECK (NrProduse>0),
	PretVanz decimal NOT NULL CHECK (PretVanz>0)
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PRODUSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[PRODUSE]
GO

CREATE TABLE PRODUSE (
	IdProdus int PRIMARY KEY IDENTITY,
	Denumire varchar(20) NOT NULL,
	IdCateg int NOT NULL
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CATEGORII_PROD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[CATEGORII_PROD]
GO

CREATE TABLE CATEGORII_PROD (
	IdCateg int PRIMARY KEY IDENTITY,
	Denumire varchar(20) NOT NULL
)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CLIENTI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[CLIENTI]
GO

CREATE TABLE CLIENTI (
	IdClient int PRIMARY KEY IDENTITY,
	Denumire varchar(20) NOT NULL,
	Tip_cl varchar(20) DEFAULT ('New'),
	Adresa_jud varchar(50) DEFAULT ('<unspecified>')
)
GO