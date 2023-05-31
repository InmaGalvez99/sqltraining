/* ESTUDIO DE CLIENTES

Conocer a los clientes:

1) Realiza un listado de clientes (sin el DNI) que tengan alguno de estos dominios en su email:
	"sumail", "masmail" o "mejormail". A continuación filtra por los que vivan en calle (no plazas, avenidas etc)

2) Muestra el dato de la edad media de todos los clientes de la tabla que tengan edad en su registro

*/

USE [Facturas2.0]


SELECT nombre, email, edad, dirección 
FROM Cliente
WHERE(email LIKE '%sumail%' OR email LIKE '%masmail%' OR email LIKE '%mejormail%')
	AND dirección LIKE 'Calle%'


SELECT AVG (CAST (edad AS numeric(3,1) ) ) AS Media
FROM Cliente
WHERE edad IS NOT NULL