USE [Facturas2.0]

--- Inserción de ventas tras la creación de procedimientos almacenados--------

--- VENTA 1 ---

EXEC sp_insert_pedidos '12/02/2023' , 'B123'
EXEC sp_insert_encargos 30,1,5
EXEC sp_insert_encargos 38,1,0

---- VENTA 2 ----

EXEC sp_insert_pedidos '23/01/2023', '666667777J'
EXEC sp_insert_encargos 10,1,0

-----VENTA 3 ----

EXEC sp_insert_pedidos '05/03/2023', '888888888E'
EXEC sp_insert_encargos 10,1,0

--- VENTA 4 ---

EXEC sp_insert_pedidos '15/05/2023', '444444444C'
EXEC sp_insert_encargos 42,2,0
EXEC sp_insert_encargos 32,2,0
EXEC sp_insert_encargos 18,1,2


---VENTA 5 ---

EXEC sp_insert_pedidos '19/05/2023', '222223333H'
EXEC sp_insert_encargos 11,2,0
EXEC sp_insert_encargos 19,1,0
EXEC sp_insert_encargos 30,1,1