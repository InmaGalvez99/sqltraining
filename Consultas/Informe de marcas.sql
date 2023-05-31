/* INFORME DE MARCAS DE LOS PRODUCTOS

1) Exponer un listado de las marcas, las fechas de fabricaci�n agrupadas por a�os y el total de ventas anual de los productos.

Evitar los datos de los televisores y los productos que han suspendido en valoraci�n.

Filtrar las m�s exitosas seg�n hayan tenido m�s de 7000� en ventas en productos de cada a�o. (Es un filtro de la agrupaci�n previa)

Info 1: Se realiza la suposici�n de que se han vendido 10 cajas de cada producto.

2) A continuaci�n, en otro listado, ordernar las marcas de mayor a menor n�mero de a�os con esas ventas

*/

USE [Facturas2.0]

SELECT Marca, YEAR(Fabricaci�n) AS A�o, SUM(Precio*Cantidad*10) AS "Total Marca A�o"
FROM Producto
WHERE Nombre NOT LIKE 'Televisi_n%'
	AND Valoraci�n >= 5
GROUP BY Marca, YEAR(Fabricaci�n)
HAVING SUM(Precio * Cantidad * 10) > 7000  
ORDER BY Marca, YEAR(Fabricaci�n)


SELECT Marca, COUNT(A�o) AS A�os, SUM("Total Marca A�o") AS "Total Marca"
FROM (
		SELECT Marca, YEAR(Fabricaci�n) AS A�o, SUM(Precio*Cantidad*10) AS "Total Marca A�o"
		FROM Producto
		WHERE Nombre NOT LIKE 'Televisi_n%'
			AND Valoraci�n >= 5
		GROUP BY Marca, YEAR(Fabricaci�n)
		HAVING SUM(Precio*Cantidad*10) > 7000  

) AS "Tabla 1"
GROUP BY Marca
ORDER BY A�os DESC