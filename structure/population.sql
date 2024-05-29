USE bari_clothes;

SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_cliente.csv'
INTO TABLE cliente
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_metodo_pago.csv'
INTO TABLE metodo_pago
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_empresa_transporte.csv'
INTO TABLE empresa_transporte
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_sucursal.csv'
INTO TABLE sucursal
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_tipo_movimiento.csv'
INTO TABLE tipo_movimiento
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_productos.csv'
INTO TABLE producto
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_proveedor.csv'
INTO TABLE proveedor
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_empleado.csv'
INTO TABLE empleado
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_detalle.csv'
INTO TABLE detalle
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_producto_proveedor.csv'
INTO TABLE producto_proveedor
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_compra.csv'
INTO TABLE compra
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_envio.csv'
INTO TABLE envio
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_inventario.csv'
INTO TABLE inventario
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/structure/data_csv/data_movimiento.csv'
INTO TABLE movimiento_inventario
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;








