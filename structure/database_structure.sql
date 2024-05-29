DROP DATABASE IF EXISTS bari_clothes;

CREATE DATABASE bari_clothes;

USE bari_clothes;

-- CREACION DE TABLAS Y CLAVES PRIMARIAS

-- Tabla de empleados
CREATE TABLE empleado (
  empleado_id        INT NOT NULL AUTO_INCREMENT,
  sucursal_id        INT NOT NULL,
  empleado_nombre    VARCHAR(60) NOT NULL,
  empleado_apellido  VARCHAR(60) NOT NULL,
  documento          INT NOT NULL UNIQUE,
  empleado_telefono  INT NOT NULL,
  
  PRIMARY KEY (empleado_id)
);

-- Tabla de sucursales
CREATE TABLE sucursal (
  sucursal_id       INT NOT NULL AUTO_INCREMENT,
  sucursal_ciudad   VARCHAR(100) NOT NULL,
  sucursal_calle    VARCHAR(100) NOT NULL,
  codigo_postal     INT NOT NULL,
  
  PRIMARY KEY (sucursal_id)
);

-- Tabla de compras
CREATE TABLE compra (
  compra_id       INT NOT NULL AUTO_INCREMENT,
  sucursal_id     INT NOT NULL, 
  cliente_id      INT NOT NULL,  
  valor           INT NOT NULL,
  metodo_pago_id  INT NOT NULL,
  fecha_compra    DATE DEFAULT(CURDATE()),
  
  PRIMARY KEY (compra_id)
);

-- Tabla de metodos de pago
CREATE TABLE metodo_pago (
  metodo_pago_id      INT NOT NULL AUTO_INCREMENT,
  metodo_pago_nombre  VARCHAR(50) NOT NULL,
    
  PRIMARY KEY (metodo_pago_id)
);

-- Tabla de detalle de la compra
CREATE TABLE detalle (
  producto_id INT NOT NULL,
  compra_id   INT NOT NULL,
  
  PRIMARY KEY (producto_id, compra_id)
);

-- Tabla de productos
CREATE TABLE producto (
  producto_id      INT NOT NULL AUTO_INCREMENT,
  modelo           VARCHAR(70) NOT NULL,
  marca            VARCHAR(70) NOT NULL,
  precio_producto  INT NOT NULL,
  temporada        DATE,
  
  PRIMARY KEY (producto_id)
);

-- Tabla de proveedores
CREATE TABLE proveedor (
  proveedor_id         INT NOT NULL AUTO_INCREMENT,
  proveedor_nombre     VARCHAR(70) DEFAULT 'proveedor',
  proveedor_telefono   INT NOT NULL,
  proveedor_email      VARCHAR(100) UNIQUE,
  
  PRIMARY KEY (proveedor_id)
);

-- Tabla para saber a que productor le corresponde cada producto
CREATE TABLE producto_proveedor (
  producto_id   INT NOT NULL,   
  proveedor_id  INT NOT NULL,
    
  PRIMARY KEY (producto_id, proveedor_id)
);

-- Tabla de envio
CREATE TABLE envio (
  envio_id              INT NOT NULL AUTO_INCREMENT,
  compra_id             INT NOT NULL,
  empresa_transporte_id INT NOT NULL,
  ciudad_envio          VARCHAR(100) NOT NULL,
  calle_envio           VARCHAR(100) NOT NULL,
  entregado             BOOL NOT NULL,
  
  PRIMARY KEY (envio_id)
);

-- Tabla de empresa de transporte
CREATE TABLE empresa_transporte (
  empresa_transporte_id     INT NOT NULL AUTO_INCREMENT,
  empresa_transporte_nombre VARCHAR(100) NOT NULL,
  empresa_transporte_telefono VARCHAR(20) DEFAULT "00-000-000-00",
  empresa_transporte_mail   VARCHAR(100) UNIQUE,
    
  PRIMARY KEY (empresa_transporte_id)
);

-- Tabla de clientes
CREATE TABLE cliente (
  cliente_id          INT NOT NULL AUTO_INCREMENT,
  cliente_nombre      VARCHAR(50) DEFAULT 'cliente',
  cliente_apellido    VARCHAR(50) DEFAULT 'cliente', 
  cliente_documento   INT UNIQUE,
  cliente_mail        VARCHAR(100) UNIQUE,
  cliente_telefono    INT NOT NULL,
  
  PRIMARY KEY (cliente_id)
);

-- Tabla de inventario
DROP TABLE IF EXISTS inventario;
CREATE TABLE inventario (
  inventario_id       INT NOT NULL AUTO_INCREMENT,
  sucursal_id         INT NOT NULL,
  producto_id         INT NOT NULL,
  cantidad_disponible INT NOT NULL,

  PRIMARY KEY(inventario_id)
);

-- Tabla de tipo de movimiento de los productos
DROP TABLE IF EXISTS tipo_movimiento;
CREATE TABLE tipo_movimiento(
  tipo_movimiento_id       INT NOT NULL,
  tipo_movimiento_nombre   VARCHAR(7) NOT NULL,
  
  PRIMARY KEY (tipo_movimiento_id)
);

-- Tabla de movimiento en el inventario
DROP TABLE IF EXISTS movimiento_inventario;
CREATE TABLE movimiento_inventario (
  movimiento_id       INT NOT NULL AUTO_INCREMENT,
  inventario_id       INT NOT NULL,
  tipo_movimiento_id  INT NOT NULL,
  cantidad_afectada   INT NOT NULL,
  fecha_movimiento    DATE NOT NULL,
  
  PRIMARY KEY (movimiento_id)
);


-- CREACION DE CLAVES FORANEAS

-- Clave foranea de sucursal en la tabla empleado
ALTER TABLE empleado
  ADD CONSTRAINT fk_emp_sucursal
  FOREIGN KEY (sucursal_id) REFERENCES sucursal(sucursal_id);

-- Claves foraneas de compra y de empresa de transporte en tabla de envio    
ALTER TABLE envio
  ADD CONSTRAINT fk_env_compra
  FOREIGN KEY (compra_id) REFERENCES compra(compra_id);

ALTER TABLE envio
  ADD CONSTRAINT fk_env_empresa
  FOREIGN KEY (empresa_transporte_id) REFERENCES empresa_transporte(empresa_transporte_id);

-- Claves foraneas de producto y de proveedor en la tabla producto_proveedor
ALTER TABLE producto_proveedor
  ADD CONSTRAINT fk_prod_prov_producto
  FOREIGN KEY (producto_id) REFERENCES producto(producto_id);
    
ALTER TABLE producto_proveedor
  ADD CONSTRAINT fk_prod_prov_proveedor
  FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id);

-- Claves foraneas de producto compra en la tabla de detalle    
ALTER TABLE detalle
  ADD CONSTRAINT fk_det_producto
  FOREIGN KEY (producto_id) REFERENCES producto(producto_id);

ALTER TABLE detalle
  ADD CONSTRAINT fk_det_compra
  FOREIGN KEY (compra_id) REFERENCES compra(compra_id);    

-- Claves foraneas de sucursal, cliente y metodo de pago en la tabla de compra
ALTER TABLE compra
  ADD CONSTRAINT fk_comp_sucursal
  FOREIGN KEY (sucursal_id) REFERENCES sucursal(sucursal_id);

ALTER TABLE compra
  ADD CONSTRAINT fk_comp_cliente
  FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id);
    
ALTER TABLE compra
  ADD CONSTRAINT fk_comp_metodo
  FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(metodo_pago_id);
    
-- Claves foraneas de producto y sucursal en la tabla de inventario
ALTER TABLE inventario
  ADD CONSTRAINT fk_inv_producto
  FOREIGN KEY (producto_id) REFERENCES producto(producto_id);

ALTER TABLE inventario
  ADD CONSTRAINT fk_inv_sucursal
  FOREIGN KEY (sucursal_id) REFERENCES sucursal(sucursal_id);

-- Clave foraneas de movimiento_inventario 
ALTER TABLE movimiento_inventario
  ADD CONSTRAINT fk_mov_inv_inventario
  FOREIGN KEY (inventario_id) REFERENCES inventario(inventario_id);

ALTER TABLE movimiento_inventario
  ADD CONSTRAINT fk_mov_inv_tipo_movimiento
  FOREIGN KEY (tipo_movimiento_id) REFERENCES tipo_movimiento(tipo_movimiento_id);