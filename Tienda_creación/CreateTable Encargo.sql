USE [Facturas2.0]

CREATE TABLE Encargo
(
	PedID int not null,
	ProID int not null,
	Cantidad smallint not null,
	Descuento numeric(3,1),

	constraint CK_Cantidad_encargo_mayor_cero check
	(
		Cantidad>0
	),

	constraint CK_Descuento_no_negativo check
	(
		Descuento >=0
	),

	constraint FK_Encargo_Pedido foreign key(PedID)
		references Pedido(PedID)
	,

	constraint FK_Encargo_Producto foreign key (ProID)
		references Producto(ProId)
	,

	constraint UQ_PedidoUnico unique
		(PedID,ProID)
)