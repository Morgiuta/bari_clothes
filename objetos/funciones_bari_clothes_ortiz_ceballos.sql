-- El dueño quiere saber las compras por cliente
DROP FUNCTION IF EXISTS fn_total_compras_por_cliente;

DELIMITER //
CREATE FUNCTION total_compras_por_cliente (
    p_cliente_id INT
) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM compra
    WHERE cliente_id = p_cliente_id;
    RETURN total;
END//
DELIMITER ;

SELECT total_compras_por_cliente(5);

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
-- Se quiere saber el promedio de precios por cada marca
DROP FUNCTION IF EXISTS fn_promedio_precios_productos_por_marca;

DELIMITER //
CREATE FUNCTION fn_promedio_precios_productos_por_marca (
    p_marca VARCHAR(70)
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(precio_producto) INTO promedio
    FROM producto
    WHERE marca = p_marca;
    RETURN promedio;
END//

DELIMITER ;

SELECT fn_promedio_precios_productos_por_marca ('Puma');

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
-- Se quiere saber la cantidad de ventas por mes en total de la empresa
DROP FUNCTION IF EXISTS fn_total_ventas_por_mes;

DELIMITER //

CREATE FUNCTION fn_total_ventas_por_mes (
    p_mes INT,
    p_anno INT
) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT SUM(valor) INTO total
    FROM compra
    WHERE MONTH(fecha_compra) = p_mes AND YEAR(fecha_compra) = p_anno;
    RETURN total;
END//

DELIMITER ;

SELECT total_ventas_por_mes(04, 2020);

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
--Se quiere saber a que proveedor le corresponde cada producto
DROP FUNCTION IF EXISTS obtener_nombre_proveedor_por_producto;

DELIMITER //

CREATE FUNCTION obtener_nombre_proveedor_por_producto (
    p_producto_id INT
) RETURNS VARCHAR(70)
DETERMINISTIC
BEGIN
    DECLARE nombre_proveedor VARCHAR(70);
    SELECT proveedor_nombre INTO nombre_proveedor
    FROM proveedor
    WHERE proveedor_id = (
        SELECT proveedor_id
        FROM producto_proveedor
        WHERE producto_id = p_producto_id
        LIMIT 1
    );
    RETURN nombre_proveedor;
END//

DELIMITER ;

SELECT obtener_nombre_proveedor_por_producto(5);

