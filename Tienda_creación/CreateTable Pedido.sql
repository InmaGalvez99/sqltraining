USE [Facturas2.0]

CREATE TABLE Pedido
(
	PedID int identity (1,1) not null,
	Fecha smalldatetime, 
	dni varchar(10),

	constraint PK_Pedido primary key
	(
		 PedID ASC
	),

	constraint FK_Pedido_Cliente foreign key (dni)
		references Cliente(dni)
	
)