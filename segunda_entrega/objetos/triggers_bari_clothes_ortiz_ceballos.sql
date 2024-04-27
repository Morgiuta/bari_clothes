CREATE TRIGGER actualizar_inventario_despues_insertar_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    -- Actualizar el inventario después de insertar una nueva compra
    CALL sp_agregar_producto_inventario(NEW.producto_id, NEW.sucursal_id, 1);
END;

CREATE TRIGGER actualizar_inventario_despues_eliminar_compra
AFTER DELETE ON compra
FOR EACH ROW
BEGIN
    -- Actualizar el inventario después de eliminar una compra
    CALL sp_eliminar_producto_inventario(OLD.producto_id, OLD.sucursal_id, 1);
END;

CREATE TRIGGER registrar_movimiento_inventario_despues_insertar_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    -- Registrar un movimiento de inventario después de insertar una nueva compra
    CALL registrar_entrada_inventario(NEW.producto_id, NEW.sucursal_id, 1);
END;

CREATE TRIGGER trigger_despues_agregar_empleado
AFTER INSERT ON empleado
FOR EACH ROW
BEGIN
    -- Código a ejecutar después de agregar un empleado
    INSERT INTO registro_empleados (accion, empleado_id, fecha)
    VALUES ('INSERT', NEW.empleado_id, NOW());
END;

CREATE TRIGGER trigger_despues_eliminar_empleado
AFTER DELETE ON empleado
FOR EACH ROW
BEGIN
    -- Código a ejecutar después de eliminar un empleado
    INSERT INTO registro_empleados (accion, empleado_id, fecha)
    VALUES ('DELETE', OLD.empleado_id, NOW());
END;