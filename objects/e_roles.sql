USE bari_clothes;

USE mysql;

-- Creacion de usuario administrado con todos sus privilegios
DROP USER IF EXISTS 'admin_user'@'%';
CREATE USER 'admin_user'@'%' IDENTIFIED BY 'hola123';
GRANT ALL PRIVILEGES ON bari_clothes.* TO 'admin_user'@'%' WITH GRANT OPTION;

USE bari_clothes;

-- Creacion de roles

DROP ROLE IF EXISTS dueño_tienda_ropa;
CREATE ROLE dueño_tienda_ropa;

DROP ROLE IF EXISTS encargado_sucursal;
CREATE ROLE encargado_sucursal;

DROP ROLE IF EXISTS empleado_sucursal;
CREATE ROLE empleado_sucursal;

-- Asignación de privilegios a dueño_tienda_ropa
GRANT INSERT, UPDATE, SELECT ON bari_clothes.* TO dueño_tienda_ropa;

-- SHOW GRANTS FOR dueño_tienda_ropa;
-- REVOKE ALL PRIVILEGES, GRANT FROM dueño_tienda_ropa;

-- Asigancion de privilegios a encargado_sucursal
GRANT SELECT ON bari_clothes.sucursal TO encargado_sucursal;
GRANT SELECT ON bari_clothes.metodo_pago TO encargado_sucursal;
GRANT SELECT ON bari_clothes.empresa_transporte TO encargado_sucursal;
GRANT SELECT ON bari_clothes.proveedor TO encargado_sucursal;
GRANT SELECT ON bari_clothes.tipo_inventario TO encargado_sucursal;
GRANT UPDATE, SELECT ON bari_clothes.compra TO encargado_sucursal;
GRANT UPDATE, SELECT ON bari_clothes.envio TO encargado_sucursal;
GRANT INSERT, UPDATE, SELECT ON bari_clothes.empleado TO encargado_sucursal;
GRANT INSERT, UPDATE, SELECT ON bari_clothes.producto TO encargado_sucursal;
GRANT INSERT, UPDATE, SELECT ON bari_clothes.cliente TO encargado_sucursal;
GRANT INSERT, UPDATE, SELECT ON bari_clothes.inventario TO encargado_sucursal;

-- SHOW GRANTS FOR encargado_sucursal;
-- REVOKE ALL PRIVILEGES, GRANT FROM encargado_sucursal;

-- Asignacion de privilegios a empleado_sucursal
GRANT SELECT ON bari_clothes.vw_cantidad_ventas TO empleado_sucursal;
GRANT SELECT ON bari_clothes.vw_ventas_2023 TO empleado_sucursal;
GRANT SELECT ON bari_clothes.vw_empleados_sucursal TO empleado_sucursal;
GRANT SELECT ON bari_clothes.vw_envio_no_entregado TO empleado_sucursal;
GRANT SELECT ON bari_clothes.vw_metodo_pago_mas_usado TO empleado_sucursal;

-- SHOW GRANTS FOR empleado_sucursal:
-- REVOKE ALL PRIVILEGES, GRANT FROM empleado_sucursal;

-- Creacion de los usuarios de la db y la asignacion de sus roles
DROP USER IF EXISTS 'german.dueño'@'%';
CREATE USER 'german.dueño'@'%' IDENTIFIED BY 'dueño123';
GRANT dueño_tienda_ropa TO 'german.dueño'@'%';
SET DEFAULT ROLE ALL TO 'german.dueño'@'%';

DROP USER IF EXISTS 'lucas.encargado'@'%';
CREATE USER 'lucas.dueño'@'%' IDENTIFIED BY 'encargado123';
GRANT encargado_sucursal TO 'lucas.encargado'@'%';
SET DEFAULT ROLE ALL TO 'lucas.encargado'@'%';

DROP USER IF EXISTS 'raul.encargado'@'%';
CREATE USER 'raul.dueño'@'%' IDENTIFIED BY 'encargado456';
GRANT encargado_sucursal TO 'raul.encargado'@'%';
SET DEFAULT ROLE ALL TO 'raul.encargado'@'%';

DROP USER IF EXISTS 'juan.empleado'@'%';
CREATE USER 'juan.dueño'@'%' IDENTIFIED BY 'empleado123';
GRANT empleado_sucursal TO 'juan.empeleado'@'%';
SET DEFAULT ROLE ALL TO 'juan.empleado'@'%';

DROP USER IF EXISTS 'pedro.empleado'@'%';
CREATE USER 'pedro.dueño'@'%' IDENTIFIED BY 'empleado456';
GRANT empleado_sucursal TO 'pedro.empleado'@'%';
SET DEFAULT ROLE ALL TO 'pedro.empleado'@'%';

DROP USER IF EXISTS 'juan.empleado'@'%';
CREATE USER 'juan.dueño'@'%' IDENTIFIED BY 'empleado789';
GRANT empleado_sucursal TO 'juan.empleado'@'%';
SET DEFAULT ROLE ALL TO 'juan.empleado'@'%';

DROP USER IF EXISTS 'tomas.empleado'@'%';
CREATE USER 'tomas.dueño'@'%' IDENTIFIED BY 'empleado147';
GRANT empleado_sucursal TO 'tomas.empleado'@'%';
SET DEFAULT ROLE ALL TO 'tomas.empleado'@'%';



