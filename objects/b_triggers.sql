USE bari_clothes;

DROP TRIGGER IF EXISTS tr_actualizar_inventario_despues_insertar_compra;
DELIMITER //

CREATE TRIGGER tr_actualizar_inventario_despues_insertar_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    -- Declarar variables para el producto_id y la cantidad
    DECLARE producto_id_temp INT;
    DECLARE cantidad_temp INT;
    
    -- Obtener el producto_id y la cantidad de la compra
    SELECT producto_id, COUNT(*)
    INTO producto_id_temp, cantidad_temp
    FROM detalle
    WHERE compra_id = NEW.compra_id
    GROUP BY producto_id;

    -- Actualizar el inventario
    IF producto_id_temp IS NOT NULL THEN
        UPDATE inventario
        SET cantidad_disponible = cantidad_disponible + cantidad_temp
        WHERE producto_id = producto_id_temp AND sucursal_id = NEW.sucursal_id;
    END IF;
END //

DELIMITER ;

INSERT INTO compra (compra_id,sucursal_id, cliente_id, valor, metodo_pago_id, fecha_compra)
VALUES (1, 1, 100, 2);

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
DROP TRIGGER IF EXISTS tr_actualizar_inventario_despues_eliminar_compra;
DELIMITER //

CREATE TRIGGER tr_actualizar_inventario_despues_eliminar_compra
AFTER DELETE ON compra
FOR EACH ROW
BEGIN
    DECLARE producto_id_temp INT;

    -- Obtener el producto_id de la compra eliminada a través de la tabla detalle
    SELECT producto_id INTO producto_id_temp
    FROM detalle
    WHERE compra_id = OLD.compra_id;

    -- Actualizar el inventario después de eliminar una compra
    IF producto_id_temp IS NOT NULL THEN
        CALL sp_eliminar_producto_inventario(producto_id_temp, OLD.sucursal_id, 1);
    END IF;
END //

DELIMITER ;
DELETE FROM detalle WHERE compra_id = 1;
DELETE FROM compra WHERE compra_id = 1;

-- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --
DROP TRIGGER IF EXISTS registrar_movimiento_inventario_despues_insertar_compra;

DELIMITER //

CREATE TRIGGER registrar_movimiento_inventario_despues_insertar_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    -- Registrar un movimiento de inventario después de insertar una nueva compra
    CALL registrar_entrada_inventario(NEW.producto_id, NEW.sucursal_id, 1);
END;

DELIMITER ;
INSERT INTO compra (sucursal_id, cliente_id, valor, metodo_pago_id) 
VALUES (2, 22, 500, 1);
