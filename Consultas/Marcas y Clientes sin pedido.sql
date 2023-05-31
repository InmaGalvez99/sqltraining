USE [Facturas2.0]

/* 
El objetivo es ver que marcas y clientes a�n no tienen pedidos.

1) Seleccionar los distintos clientes (dni) que no tienen pedidos.

2) Seleccionar las distintas marcas que si tienen pedidos, por tanto tienen encargo.

3)Seleccionar las distintas marcas que no est�n en el listado anterior (por tanto no tienene encargo). 
	Evitar las marcas sin nombre.

4) A�adir a esa selecci�n el mayor identificador de producto por marca.
	Contar las filas de modo que nos resuma 'X productos sin Encargo'.
*/



------ Clientes sin pedido --------------

SELECT DISTINCT dni FROM Cliente
WHERE dni NOT IN 
				(SELECT DISTINCT dni FROM Pedido)



---------- Marcas con pedido y encargo --------------------------

SELECT DISTINCT Marca FROM Producto
	WHERE proID IN
		(SELECT DISTINCT proId FROM Encargo)
		AND Marca IS NOT NULL




-------------------- Marcas que no est�n en el listado anterior -----------------------

SELECT DISTINCT Marca FROM Producto
WHERE Marca NOT IN (
					SELECT DISTINCT Marca FROM Producto
						WHERE proID IN
							(SELECT DISTINCT proId FROM Encargo)
							AND Marca IS NOT NULL
					)



------------- Mayor identificador de producto por marca de la anterior selecci�n ----------------------�

SELECT DISTINCT Marca, MAX(proID) AS MaximoID
FROM Producto
	WHERE Marca NOT IN (
					SELECT DISTINCT Marca FROM Producto
						WHERE proID IN
							(SELECT DISTINCT proId FROM Encargo)
							AND Marca IS NOT NULL
					)
GROUP BY Marca
SELECT CONCAT_ws(' ',@@ROWCOUNT, 'Marcas sin encargo')