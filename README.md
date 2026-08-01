**¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Qué se perdería si usaras INNER JOIN?**
Usé LEFT JOIN para obtener todos los productos de la tabla izquierda (Productos) agregando los datos
de la tabla derecha (ventas) en el caso de haber coincidencia.  Adenás obtuve los valores nulos para los
productos que no tuvieron ninguna venta.
Si usara INNER JOIN obtendría solo los registros que tiene coincidencia en ambas tablas.  Si un producto
no tuve ventas, no aparecería como parte del resultado.  Si hay una venta sin producto válido tampoco aparece.

**¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?**
Usé RIGHT JOIN para saber qué registros de ventas quedaron "huérfanos" porque su producto_id no existe en la 
tabla de productos.
A la izquierda mi consulta se encuentra la tabla productos y a la derecha la tabla ventas.

**¿Qué representan los valores NULL en cada resultado? Explicá con un ejemplo concreto de los datos qué significa que venta_id sea NULL 
en la Consulta 1 y que producto_id de productos sea NULL en la Consulta 2.**
Imaginemos que tenemos 2 tablas con estos datos reales


Consulta 1: El LEFT JOIN original
SELECT * FROM productos P 
LEFT JOIN ventas V ON P.producto_id = V.producto_id

Qué significa si venta_id es NULL: Significa que el producto existe en tu inventario, pero nunca se ha vendido.

El resultado mostrará que los productos (108) Hub USB-C 7p y (109) Parlante Bluetooth existen pero nunca se han vendido.  Como nadie ha comprado un Hub USB-C 7p ni un Parlante Bluetooth, la base de datos no encuentra ninguna fila en la tabla 
ventas para esos producto_ids. Para poder mostrar los productos de todos modos, rellena los campos de la venta con NULL.

Fila del resultado:
108	Hub USB-C 7p	Accesorios	45.00	NULL	NULL	NULL	NULL	NULL
109	Parlante Bluetooth	Audio	60.00	NULL	NULL	NULL	NULL	NULL

Consulta 2: consulta con RIGHT JOIN y el filtro IS NULL

SELECT * FROM productos P 
RIGHT JOIN ventas V ON P.producto_id = V.producto_id 
WHERE P.producto_id IS NULL

Si el producto_id de la tabla productos es NULL: Significa que existe una venta registrada de un producto que no existe en tu catálogo.
El resultado mostrará la venta 10. Esa venta apunta al producto_id 999, pero en la tabla de productos no hay ningún ID 999. 
El RIGHT JOIN trae la venta de igual forma, y al no encontrar el producto, llena los datos de la tabla productos con NULL. 
El filtro WHERE hace que veas solo estos errores. 

Fila del resultado: NULL	NULL	NULL	NULL	10	999	205	1	2024-03-25


**¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio?**
Cuando se necesita auditar o reconciliar dos fuentes de datos independientes para encontrar diferencias, ya que te permite ver tanto 
los registros que coinciden como los que están huérfanos en cualquiera de las dos tablas.

