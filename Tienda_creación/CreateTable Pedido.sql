USE [Facturas2.0]

CREATE TABLE Pedido
(
	PedID int identity (1,1) NOT NULL,
	Fecha smalldatetime, 
	dni varchar(10),

	CONSTRAINT PK_Pedido PRIMARY KEY
	(
		 PedID ASC
	),

	CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (dni)
		REFERENCES Cliente(dni)
	
)