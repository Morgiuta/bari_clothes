USE bari_clothes;

USE bari_clothes;

-- PRIMERA VISTA --
-- Se quieren saber la cantidad de ventas que han hecho a travez del tiempo
-- Ya que una un cliente puede comprar más de un producto a la vez

CREATE OR REPLACE VIEW vw_cantidad_ventas AS
    (SELECT 
        COUNT(DISTINCT compra_id) AS cantidad_ventas
    FROM
        DETALLE);
 
SELECT 
    *
FROM
    vw_cantidad_ventas;

-- SEGUNDA VISTA --

CREATE OR REPLACE VIEW vw_ventas_2023 AS
    (SELECT 
        COUNT(*)
    FROM
        bari_clothes.COMPRA
    WHERE
        fecha_compra BETWEEN '2023-01-01' AND '2023-12-31');
  
SELECT 
    *
FROM
    bari_clothes.vw_ventas_2023;

-- TERCERA VISTA--
-- El dueño quiere tener una vista completa de los empleados,
-- y aque sucursal pertenecen

CREATE OR REPLACE VIEW vw_empleados_sucursal AS
    (SELECT 
        bce.empleado_nombre AS 'NOMBRE EMPLEADO'
	,	bce.empleado_apellido AS 'APELLIDO EMPLEADO'
    ,	bcs.sucursal_ciudad AS 'SUCURSAL CIUDAD'
    FROM
        bari_clothes.EMPLEADO AS bce
            INNER JOIN
        bari_clothes.SUCURSAL AS bcs ON bce.sucursal_id = bcs.sucursal_id);

SELECT 
    *
FROM
    bari_clothes.vw_empleados_sucursal; 
    
-- CUARTA VISTA--
-- El empleado encargado de los envios quiere ver los que todavia no llegaron a su destino

CREATE OR REPLACE VIEW vw_envio_no_entregados AS
    (SELECT 
        *
    FROM
        bari_clothes.ENVIO
    WHERE
        entregado = 0);
        
SELECT 
    *
FROM
    bari_clothes.vw_envio_no_entregados;

-- QUINTA VISTA--

-- Se quiere saber el metodo de pago más usado.
-- El id, la cantidad de veces que se uso y el nombre.

CREATE OR REPLACE VIEW vw_metodo_pago_mas_usado AS
	(SELECT 
		bcc.metodo_pago_id
	, 	COUNT(*) AS 'CANTIDAD DE VECES USADO'
	,	bcmp.metodo_pago_nombre
	FROM
		bari_clothes.COMPRA AS bcc 
		JOIN
		bari_clothes.METODO_PAGO AS bcmp ON bcc.metodo_pago_id = bcmp.metodo_pago_id
	GROUP BY metodo_pago_id
	ORDER BY metodo_pago_id DESC
	LIMIT 1);
    
SELECT 
    *
FROM
    bari_clothes.vw_metodo_pago_mas_usado;