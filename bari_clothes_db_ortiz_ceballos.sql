DROP DATABASE IF EXISTS bari_clothes;

CREATE DATABASE bari_clothes;

USE bari_clothes;

-- Creacion de las tablas con su primary key correspondiente

CREATE TABLE EMPLEADO (
  empleado_id 		INT NOT NULL AUTO_INCREMENT,
  sucursal_id 		INT NOT NULL,
  empleado_nombre 	VARCHAR(60),
  mpleado_apellido 	VARCHAR(60),
  documento 		INT UNIQUE,
  empleado_teléfono 	INT,
    
  PRIMARY KEY (empleado_id)
);

CREATE TABLE SUCURSAL (
  sucursal_id 		INT NOT NULL AUTO_INCREMENT,
  sucursal_ciudad 	VARCHAR(100) NOT NULL,
  sucursal_calle 	VARCHAR(100) NOT NULL,
  codigo_postal 	INT NOT NULL,
    
  PRIMARY KEY (sucursal_id)
);

CREATE TABLE COMPRA (
	compra_id		INT NOT NULL AUTO_INCREMENT,
  sucursal_id			INT NOT NULL,	
  cliente_id			INT NOT NULL,	
	valor			INT NOT NULL,
	metodo_pago_id	INT NOT NULL,
	fecha_compra		DATE DEFAULT(CURDATE()),
	
  PRIMARY KEY (compra_id)
);

CREATE TABLE METODO_PAGO (
	metodo_pago_id			INT NOT NULL AUTO_INCREMENT,
	metodo_pago_nombre 	VARCHAR(50) NOT NULL,
    
  PRIMARY KEY (metodo_pago_id)
);

CREATE TABLE DETALLE (
  producto_id INT NOT NULL,
  compra_id 	INT NOT NULL
);

CREATE TABLE PRODUCTO (
  producto_id 		INT NOT NULL AUTO_INCREMENT,
  modelo 					VARCHAR(70) NOT NULL,
  marca 					VARCHAR(70) NOT NULL,
  precio_producto INT NOT NULL,
  temporada 			DATE,
    
  PRIMARY KEY (producto_id)
);

CREATE TABLE PROVEEDOR (
  proveedor_id 				INT NOT NULL AUTO_INCREMENT,
  proveedor_nombre 		VARCHAR(70) DEFAULT 'proveedor',
  proveedor_telefono 	INT NOT NULL,
  proveedor_email 		VARCHAR(100) UNIQUE,
    
  PRIMARY KEY (proveedor_id)
);

CREATE TABLE PRODUCTO_PROVEEDOR(
	producto_id 	INT NOT NULL, 	-- FK
    proveedor_id	INT NOT NULL	-- FK
);

CREATE TABLE ENVIO (
    envio_id 				INT NOT NULL AUTO_INCREMENT,
    compra_id 				INT NOT NULL,
    empresa_transporte_id 	INT NOT NULL,
    ciudad_envio 			VARCHAR(100) NOT NULL,
    calle_envio 			VARCHAR(100) NOT NULL,
    entregado 				BOOL,
    
    PRIMARY KEY (envio_id)
);

CREATE TABLE EMPRESA_TRANSPORTE (
	empresa_transporte_id 			INT NOT NULL AUTO_INCREMENT,
  empresa_transporte_nombre		VARCHAR(100),
  empresa_transporte_telefono	VARCHAR(20) DEFAULT "00-000-000-00",
	empresa_transporte_mail			VARCHAR(100) UNIQUE,
    
  PRIMARY KEY (empresa_transporte_id)
);

CREATE TABLE CLIENTE (
	cliente_id 					INT NOT NULL AUTO_INCREMENT,
  cliente_nombre 			VARCHAR(50) DEFAULT 'cliente',
  cliente_apellido 		VARCHAR(50) DEFAULT 'cliente', 
  cliente_documento 	INT UNIQUE,
  cliente_mail 				VARCHAR(100) UNIQUE,
  cliente_telefono 		INT NOT NULL,
    
  PRIMARY KEY (cliente_id)
);

-- Se crean las correspondientes foreign key de cada tabla

ALTER TABLE EMPLEADO
	ADD CONSTRAINT FK_EMP_SUCURSAL
  FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id);
    
ALTER TABLE ENVIO
	ADD CONSTRAINT FK_ENV_COMPRA
  FOREIGN KEY (compra_id) REFERENCES COMPRA(compra_id);

ALTER TABLE ENVIO
	ADD CONSTRAINT FK_ENV_EMPRESA
  FOREIGN KEY (empresa_transporte_id) REFERENCES EMPRESA_TRANSPORTE(empresa_transporte_id);

ALTER TABLE PRODUCTO_PROVEEDOR
	ADD CONSTRAINT FK_PROD_PROV_PRODUCTO
  FOREIGN KEY (producto_id) REFERENCES PRODUCTO(producto_id);
    
ALTER TABLE PRODUCTO_PROVEEDOR
	ADD CONSTRAINT FK_PROD_PROV_PROVEEDOR
  FOREIGN KEY (proveedor_id) REFERENCES PROVEEDOR(proveedor_id);
    
ALTER TABLE DETALLE
	ADD CONSTRAINT FK_DET_PRODUCTO
  FOREIGN KEY (producto_id) REFERENCES PRODUCTO(producto_id);

ALTER TABLE DETALLE
	ADD CONSTRAINT FK_DET_COMPRA
  FOREIGN KEY (compra_id) REFERENCES COMPRA(compra_id);    

ALTER TABLE COMPRA
	ADD CONSTRAINT FK_COMP_SUCURSAL
  FOREIGN KEY (sucursal_id) REFERENCES SUCURSAL(sucursal_id);

ALTER TABLE COMPRA
	ADD CONSTRAINT FK_COMP_CLIENTE
  FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id);
    

ALTER TABLE COMPRA
	ADD CONSTRAINT FK_COMP_METODO
  FOREIGN KEY (metodo_pago_id) REFERENCES METODO_PAGO(metodo_pago_id);
    
