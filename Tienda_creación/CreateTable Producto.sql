USE [Facturas2.0]

CREATE TABLE Producto(
	ProID int identity(1,1) NOT NULL,
	Nombre varchar(25),
	Precio numeric(18,2),
	Modelo varchar(25),
	Cantidad smallint NOT NULL,
	Marca varchar(15),
	Fabricación smalldatetime,
	Valoración numeric(2,1),

	CONSTRAINT PK_Producto PRIMARY KEY
	(
		ProID ASC 
	),

	CONSTRAINT UQ_PRoductoUniq UNIQUE
	(
		Nombre, Modelo, Marca
	),

	CONSTRAINT CK_Precio_no_negativo CHECK
	(
		Precio >=0
	),

	CONSTRAINT CK_Cantidad_mayor_cero CHECK
	(
		Cantidad>0
	),

	CONSTRAINT CK_valor_no_negativo CHECK
	(
		Valoración>0
	)
)