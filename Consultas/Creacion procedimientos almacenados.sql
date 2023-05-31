
/*
Crear dos procedimientos almacenados que permitan dos inserciones:

1) inserci�n en pedido
2) Inserci�n en encargo (dando el id del pedido del insert anterior, ser� el mayor)

*/

CREATE PROCEDURE sp_insert_pedidos(
	@fecha SMALLDATETIME,
	@dni VARCHAR(10)
)
AS
BEGIN
	INSERT INTO Pedido
	VALUES
	(@fecha, @dni)
END 

GO


CREATE PROCEDURE sp_insert_encargos(
	@producto INT,
	@cantidad SMALLINT,
	@descuento NUMERIC(3,1)
)
AS
BEGIN
	INSERT INTO Encargo
	VALUES
	(
	(SELECT MAX(pedID) FROM Pedido), @producto, @cantidad, @descuento
	)
END