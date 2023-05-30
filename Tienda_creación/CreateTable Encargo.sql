USE [Facturas2.0]

CREATE TABLE Encargo
(
	PedID int NOT NULL,
	ProID int NOT NULL,
	Cantidad smallint NOT NULL,
	Descuento numeric(3,1),

	CONSTRAINT CK_Cantidad_encargo_mayor_cero CHECK
	(
		Cantidad>0
	),

	CONSTRAINT CK_Descuento_no_negativo CHECK
	(
		Descuento >=0
	),

	CONSTRAINT FK_Encargo_Pedido FOREIGN KEY (PedID)
		REFERENCES Pedido(PedID)
	,

	CONSTRAINT FK_Encargo_Producto FOREIGN KEY (ProID)
		REFERENCES Producto(ProId)
	,

	CONSTRAINT UQ_PedidoUnico UNIQUE
		(PedID,ProID)
)