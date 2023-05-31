/* INFORME DE MARCAS DE LOS PRODUCTOS

1) Exponer un listado de las marcas, las fechas de fabricación agrupadas por años y el total de ventas anual de los productos.

Evitar los datos de los televisores y los productos que han suspendido en valoración.

Filtrar las más exitosas según hayan tenido más de 7000€ en ventas en productos de cada año. (Es un filtro de la agrupación previa)

Info 1: Se realiza la suposición de que se han vendido 10 cajas de cada producto.

2) A continuación, en otro listado, ordernar las marcas de mayor a menor número de años con esas ventas

*/

USE [Facturas2.0]

SELECT Marca, YEAR(Fabricación) AS Año, SUM(Precio*Cantidad*10) AS "Total Marca AÑo"
FROM Producto
WHERE Nombre NOT LIKE 'Televisi_n%'
	AND Valoración >= 5
GROUP BY Marca, YEAR(Fabricación)
HAVING SUM(Precio * Cantidad * 10) > 7000  
ORDER BY Marca, YEAR(Fabricación)


SELECT Marca, COUNT(Año) AS Años, SUM("Total Marca AÑo") AS "Total Marca"
FROM (
		SELECT Marca, YEAR(Fabricación) AS Año, SUM(Precio*Cantidad*10) AS "Total Marca AÑo"
		FROM Producto
		WHERE Nombre NOT LIKE 'Televisi_n%'
			AND Valoración >= 5
		GROUP BY Marca, YEAR(Fabricación)
		HAVING SUM(Precio*Cantidad*10) > 7000  

) AS "Tabla 1"
GROUP BY Marca
ORDER BY Años DESC