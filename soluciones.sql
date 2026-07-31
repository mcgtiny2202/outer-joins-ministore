-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Maria Cristina Gaupmann
-- Fecha: 31/7/2026
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.
-- Los productos que no fueron vendidos son: (108) Hub USB-C 7p y (109) Parlante Bluetooth

SELECT *
FROM productos P
LEFT JOIN ventas V
ON P.producto_id = V.producto_id
WHERE V.venta_id is NULL;

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.
-- El producto 999 no figura en el catálogo

SELECT *
FROM productos P
RIGHT JOIN ventas V
ON P.producto_id = V.producto_id
WHERE P.productO_id is NULL;

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

SELECT *
FROM productos P
FULL OUTER JOIN ventas V
ON P.producto_id = V.producto_id;

