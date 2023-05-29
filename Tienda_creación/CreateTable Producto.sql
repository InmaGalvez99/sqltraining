USE [Facturas2.0]

CREATE TABLE Producto(
	ProID int identity(1,1) not null,
	Nombre varchar(25),
	Precio numeric(18,2),
	Modelo varchar(25),
	Cantidad smallint not null,
	Marca varchar(15),
	Fabricación smalldatetime,
	Valoración numeric(2,1),

	constraint PK_Producto primary key
	(
		ProID ASC 
	),

	constraint UQ_PRoductoUniq unique 
	(
		Nombre, Modelo, Marca
	),

	constraint CK_Precio_no_negativo check
	(
		Precio >=0
	),

	constraint CK_Cantidad_mayor_cero check
	(
		Cantidad>0
	),

	constraint CK_valor_no_negativo check
	(
		Valoración>0
	)
)