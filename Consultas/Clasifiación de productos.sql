USE [Facturas2.0]

/* CLASIFICACI�N DE PRODUCTOS
	
	Clasificar los productos en 3 gamas (econ�mico, medio y gama alta) seg�n el precio/unidad.
	Una vez est�n clasificadas, contabilizar cuantos productos tiene cada marca seg�n la clasificaci�n por gamas
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