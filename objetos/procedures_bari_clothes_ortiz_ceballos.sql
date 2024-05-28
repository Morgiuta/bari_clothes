DROP PROCEDURE IF EXISTS agregar_producto_inventario;

DELIMITER //

CREATE PROCEDURE agregar_producto_inventario (
    IN p_producto_id INT,
    IN p_sucursal_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE cantidad_actual INT;
    
    -- Obtener la cantidad actual de productos en el inventario
    SELECT cantidad_disponible INTO cantidad_actual
    FROM inventario
    WHERE producto_id = p_producto_id AND sucursal_id = p_sucursal_id;
    
    -- Actualizar la cantidad disponible en el inventario
    IF cantidad_actual IS NOT NULL THEN
        UPDATE inventario
        SET cantidad_disponible = cantidad_disponible + p_cantidad
        WHERE producto_id = p_producto_id AND sucursal_id = p_sucursal_id;
    ELSE
        INSERT INTO inventario (producto_id, sucursal_id, cantidad_disponible)
        VALUES (p_producto_id, p_sucursal_id, p_cantidad);
    END IF;
END//

DELIMITER ;

CALL agregar_producto_inventario(28, 5, 56);

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
DROP PROCEDURE IF EXISTS sp_elmiminar_producto_inventario

DELIMITER //

CREATE PROCEDURE sp_eliminar_producto_inventario (
    IN p_producto_id INT,
    IN p_sucursal_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE cantidad_actual INT;
    
    -- Obtener la cantidad actual de productos en el inventario
    SELECT cantidad_disponible INTO cantidad_actual
    FROM inventario
    WHERE producto_id = p_producto_id AND sucursal_id = p_sucursal_id;
    
    -- Verificar si hay suficiente cantidad disponible en el inventario
    IF cantidad_actual IS NOT NULL AND cantidad_actual >= p_cantidad THEN
        UPDATE inventario
        SET cantidad_disponible = cantidad_disponible - p_cantidad
        WHERE producto_id = p_producto_id AND sucursal_id = p_sucursal_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cantidad insuficiente en el inventario';
    END IF;
END//

DELIMITER ;

CALL sp_eliminar_producto_inventario(29, 5, 18);

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
DROP TABLE IF EXISTS sp_registrar_entrada_inventario;

DELIMITER //

CREATE PROCEDURE sp_registrar_entrada_inventario (
    IN p_producto_id INT,
    IN p_sucursal_id INT,
    IN p_cantidad INT
)
BEGIN
    INSERT INTO movimiento_inventario (inventario_id, tipo_movimiento_id, cantidad_afectada, fecha_movimiento)
    VALUES ((SELECT inventario_id FROM inventario WHERE producto_id = p_producto_id AND sucursal_id = p_sucursal_id), 1, p_cantidad, CURDATE());
    
    -- Actualizar la cantidad disponible en el inventario
    CALL agregar_producto_inventario(p_producto_id, p_sucursal_id, p_cantidad);
END//

DELIMITER ;

CALL sp_registrar_entrada_inventario(29, 5, 20);

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
DROP PROCEDURE IF EXISTS sp_agregar_empleado;
DELIMITER //

CREATE PROCEDURE sp_agregar_empleado (
    IN p_sucursal_id INT,
    IN p_nombre VARCHAR(60),
    IN p_apellido VARCHAR(60),
    IN p_documento INT,
    IN p_telefono INT
)
BEGIN
    INSERT INTO empleado (sucursal_id, empleado_nombre, empleado_apellido, documento, empleado_teléfono)
    VALUES (p_sucursal_id, p_nombre, p_apellido, p_documento, p_télefono);
END//

DELIMITER ;

CALL sp_agregar_empleado(1, 'Juan', 'Perez', 123456789, 5555555);

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
DROP TABLE IF EXISTS sp_eliminar_empleado

DELIMITER //

CREATE PROCEDURE sp_eliminar_empleado (
    IN p_empleado_id INT
)
BEGIN
    DELETE FROM empleado WHERE empleado_id = p_empleado_id;
END//

DELIMITER ;

CALL sp_eliminar_empleado(1);
