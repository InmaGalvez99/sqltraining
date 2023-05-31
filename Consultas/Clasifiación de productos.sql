USE [Facturas2.0]

/* CLASIFICACIÓN DE PRODUCTOS
	
	Clasificar los productos en 3 gamas (económico, medio y gama alta) según el precio/unidad.
	Una vez estén clasificadas, contabilizar cuantos productos tiene cada marca según la clasificación por gamas
*/

SELECT Marca, 'tiene ' + CAST(COUNT(Nombre) AS VARCHAR) +  ' productos ' + Tipo AS Resumen 
FROM
(
		SELECT Nombre, Marca, Precio,
			CASE 
				WHEN Precio <30 THEN 'economicos'
				WHEN Precio BETWEEN 30 AND 100 THEN 'medios'
				WHEN Precio > 100 THEN 'de gama alta'
				ELSE 'no deberia salir, error'
			END Tipo
		FROM Producto
		WHERE Marca IS NOT NULL 
) AS T
GROUP BY Tipo, Marca
ORDER BY Marca