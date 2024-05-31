<center>
<img src=https://media.licdn.com/dms/image/C4D12AQE7ZTPNXssGOA/article-cover_image-shrink_600_2000/0/1649683415795?e=2147483647&v=beta&t=HdQsW5-GwsOqZnM-I7J-CV8OSKbPQeLtGRbMRYvcrRA style="width: 100% ; aspect-ratio:16/9">
</center>

# <center>Entrega Proyecto Final</center>
@Francisco Ortiz Ceballos



---
## Tematica del projecto

Un cliente nos solicito que le desarrollemos una base de datos para su negocio de tienda de ropa. Para tener un mejor control y administracion de la misma

Entre los pedidios este nos detallo como tiene que funcionar la misma

  - ### Gestion en la compra de productos:
  
      Debemos crear una base de datos que nos permita ver quien hizo las compras, cual fue el metodo de pago, los productos que se llevaron, en que sucursal se realizo y por ultimo si tiene que ser enviado ya que fue online

  - ### Gestion sobre los productos

    La base de datos tiene que tener la capacidad de ver la cantidad de productos que tenemos y la capacidad de ver quien nos proveen los mismos

  - ### Gestion de los envios
    
    La base de datos tiene que poder mostrarnos a quien le va dirigido el envio. Quien se encarga de este y si llego destino o no

  - ### Gestion de empleados
    
    La base de datos nos tiene que mostrar la cantidad de empleados que tenemos y en que sucursal estan trabajando

## Modelo de negocio

## Diagrama Entidad Relacion
<center>
<img src=https://github.com/Morgiuta/bari_clothes/blob/main/image/bari_clothes.png style="width: 100% ; aspect-ratio:16/9">
</center>
  
## Listado de tablas y descripcion  
  
**Tabla: empleado**

| Columna           | Tipo de Dato   |  NULL    | Unique  | Tipo Clave  | AutoIncrement |
|-------------------|----------------|----------|---------|-------------|---------------|
| empleado_id       |      INT       | NOT NULL |   SI    |     PK      |      SI       |
| sucursal_id       |      INT       | NOT NULL |   NO    |     FK      |      NO       |
| empleado_nombre   |    VARCHAR     | NOT NULL |   NO    |      -      |      NO       |
| empleado_apellido |    VARCHAR     | NOT NULL |   NO    |      -      |      NO       |
| documento         |      INT       | NOT NULL |   SI    |      -      |      NO       |
| empelado_telefono |      INT       | NOT NULL |   NO    |      -      |      NO       |

**Tabla: sucursa**

| Columna         | Tipo de Dato |  NULL    | Unique  | Tipo Clave  | AutoIncrement |
|-----------------|--------------|----------|---------|-------------|---------------|
| sucursal_id     | INT          | NOT NULL | SI      | PK          | SI            |
| sucursal_ciudad | VARCHAR      | NOT NULL | NO      | -           | NO            |
| sucursal_calle  | VARCHAR      | NOT NULL | NO      | -           | NO            |
| codigo postal   | INT          | NOT NULL | NO      | -           | NO            |

**Tabla: compra**

| Columna        | Tipo de Dato |  NULL    | Unique | Tipo Clave  | AutoIncrement |
|--------------- |--------------|----------|--------|-------------|---------------|
| compra_id      |      INT     | NOT NULL |   SI   |     PK      |      SI       |
| cliente_id     |      INT     | NOT NULL |   NO   |     FK      |      NO       |
| sucursal_id    |      INT     | NOT NULL |   NO   |     FK      |      NO       |
| valor          |      INT     | NOT NULL |   NO   |      -      |      NO       |
| metodo_pago_id |      INT     | NOT NULL |   NO   |     FK      |      NO       |
| fecha_compra   |      DATE    | NOT NULL |   NO   |      -      |      NO       |

**Table: metodo_pagp**

| Columna            | Tipo de Dato   |  NULL    | Unique  | Tipo Clave  | AutoIncrement |
|--------------------|----------------|----------|---------|-------------|---------------|
| metodo_pago_id     |      INT       | NOT NULL |   SI    |     PK      |      SI       |
| metodo_pago_nombre |    VARCHAR     | NOT NULL |   NO    |      -      |      NO       |

**Table: detalle**

| Columna     | Tipo de Dato |  NULL    | Unique | Tipo Clave   | AutoIncrement |
|-------------|--------------|----------|--------|--------------|---------------|
| producto_id |      INT     | NOT NULL |   NO   | PK Compuesta |      SI       |
| compra_id   |      INT     | NOT NULL |   NO   | PK Compuesta |      NO       |

**Tabla: producto**

| Columna         | Tipo de Dato |  NULL    | Unique | Tipo Clave  | AutoIncrement |
|-----------------|--------------|----------|--------|-------------|---------------|
| producto_id     | INT          | NOT NULL | SI     | PK          | SI            |
| modelo          | VARCHAR      | NOT NULL | NO     | -           | NO            |
| marca           | VARCHAR      | NOT NULL | NO     | -           | NO            |
| precio_producto | INT          | NOT NULL |  NO    | -           | NO            |
| temporada       | DATE         | NULL     | NO     | -           | NO            |

**Tabla: proveedor**

| Columna            | Tipo de Dato | NULL     | Unique | Tipo Clave | AutoIncrement |
|--------------------|--------------|----------|--------|------------|---------------|
| proveedor_id       | INT          | NOT NULL | SI     | PK         | SI            |
| proveedor_nombre   | VARCHAR      | NULL     | NO     | -          | SI            |
| proveedor_email    | VARCHAR      | NOT NULL | SI     | -          | SI            |
| proveedor_telefono | INT          | NOT NULL | NO     | -          | SI            |

**Tabla: producto_proveedor**

| Columna         | Tipo de Dato |  NULL    | Unique | Tipo Clave | AutoIncrement |
|-----------------|--------------|----------|--------|------------|---------------|
| producto_id     | INT          | NOT NULL | SI     | PK         | SI            |
| proveedor_id    | INT          | NOT NULL | SI     | PK         | SI            |

**Tabla: empresa_transporte**

| Columna                   | Tipo de Dato | NULL     | Unique | Tipo Clave | AutoIncrement |
|---------------------------|--------------|----------|--------|------------|---------------|
| empresa_transporte_id     | INT          | NOT NULL | SI     | PK         | SI            |
| empresa_transporte_nombre | VARCHAR      | NOT NULL | NO     | -          | NO            |
| empresa_transporte_mail   | VARCHAR      | NOT NULL | SI     | -          | NO            |
| proveedor_telefono        | INT          | NULL     | NO     | -          | NO            |

**Tabla: envio**

| Columna               | Tipo de Dato | NULL     | Unique | Tipo Clave | AutoIncrement |
|-----------------------|--------------|----------|--------|------------|---------------|
| envio_id              | INT          | NOT NULL | SI     | PK         | SI            |
| compra_id             | INT          | NOT NULL | NO     | FK         | NO            |
| empresa_transporte_id | INT          | NOT NULL | NO     | FK         | NO            |
| ciudad_envio          | VARCHAR      | NOT NULL | NO     | -          | NO            |
| calle_envio           | VARCHAR      | NOT NULL | NO     | -          | NO            |
| entregado             | BOOL         | NOT NULL | NO     | -          | NO            |

**Tabla: cliente**

| Columna           | Tipo de Dato | NULL     | Unique | Tipo Clave | AutoIncrement |
|-------------------|--------------|----------|--------|------------|---------------|
| cliente_id        | INT          | NOT NULL | SI     | PK         | SI            |
| cliente_nombre    | VARCHAR      | NULL     | NO     | -          | NO            |
| cliente_apellido  | VARCHAR      | NULL     | NO     | -          | NO            |
| cliente_documento | INT          | NOT NULL | NO     | -          | NO            |
| cliente_mail      | VARCHAR      | NOT NULL | NO     | -          | NO            |
| cliente_telefono  | INT          | NOT NULL | NO     | -          | NO            |

**Tabla: inventario**

| Columna             | Tipo de Dato | NULL     | Unique | Tipo Clave | AutoIncrement |
|---------------------|--------------|----------|--------|------------|---------------|
| inventario_id       | INT          | NOT NULL | SI     | PK         | SI            |
| sucursal_id         | INT          | NOT NULL | NO     | FK         | NO            |
| producto_id         | INT          | NOT NULL | NO     | FK         | NO            |
| cantidad_disponible | INT          | NOT NULL | NO     | -          | NO            |

**Tabla: tipo_movimiento**

| Columna                | Tipo de Dato | NULL     | Unique | Tipo Clave | AutoIncrement |
|------------------------|--------------|----------|--------|------------|---------------|
| tipo_movimiento_id     | INT          | NOT NULL | SI     | PK         | SI            |
| tipo_movimiento_nombre | VARCHAR      | NOT NULL | NO     | -          | NO            |

**Tabla: movimiento_inventario**

| Columna            | Tipo de Dato | NULL     | Unique | Tipo Clave | AutoIncrement |
|--------------------|--------------|----------|--------|------------|---------------|
| movimiento_id      | INT          | NOT NULL | SI     | PK         | SI            |
| inventario_id      | INT          | NOT NULL | NO     | FK         | NO            |
| tipo_movimiento_id | INT          | NOT NULL | NO     | FK         | NO            |
| cantidad_afectada  | INT          | NOT NULL | NO     | -          | NO            |
| fecha_movimiento   | DATE         | NOT NULL | NO     | -          | NO            |

## Ingesta de datos

*La ingesta de datos de todas las tablas se realiza mediante archivos csv*

## Objetos de la base de datos

Los objetos estan colocados sobre la carpeta objects
  - a_funciones.sql
  - b_tirggers.sql
  - c stored_procedures.sql
  - d_vistas.sql
  - e_roles-.sql

Abajo se van a documentar los objetos

### Funciones 

## Funcion: fn_total_compras_por_cliente

**Descripcion** 

Esta funcion nos permite saber la cantidad de compras que hizo un cliente en la tienda de ropa. Esta se calcula contando las veces que aparece el cliente_id en la tabla compra

**Paraametros**

| Parametro    | Descripcion             |
|--------------|-------------------------|
| p_cliente_id | id del cliente tipo INT |

**Retorno**

La funcion retorna la cantidad de veces que el cliente_id se encuentra en la tabla de compras

**Uso**

```sql
SELECT fn_total_compras_por_cliente(5);
```
## Funcion: fn_promedio_precios_productos_por_marca

**Descripcion** 

Esta funcion nos permite saber la marca m´as cara de toda la tienda de ropa calculando su promedio de precios. Esta se calcula sacando un promedio de precio_producto de la tabla producto

**Parametros**

| Parametro | Descripcion                 |
|-----------|-----------------------------|
| p_marca   | nombre de la marca tipo INT |

**Retorno**

La funcion retorna el promedio de los precios de una marca en especifico

```sql
SELECT fn_promedio_precios_productos_por_marca ('Puma');
```

## Funcion: fn_total_ventas_por_mes

**Descripcion**

Esta funcion calcula la cantidad de ventas hechas en el mes que nosotros queramos saber. Esta se calcula atra vez de filtrar la tabla compra por año y mes

**Parametros**

| Parametro | Descripcion          |
|-----------|----------------------|
| p_mes     | mes del año tipo INT |
| p-año     | año tipo INT         |

**Retorno**

Esta funcion retorna la cantidad de productos que se vendieron en cierto mes

**Uso**

```sql
SELECT fn_total_ventas_por_mes(04, 2020);
```

## Funcion: fn_obtener_nombre_proveedor_por_producto

**Descripcion**

Esta funcion encuentra a quien le pertenece el producto cual se busca. Esto se encuentra mediante el producto_id y en la tabla de producto_proveedor para finalmente ser encontrado en la tabla proveedor

**Parametros**

| Parametro      | Descripcion              |
|----------------|--------------------------|
| p_productos_id | id del producto tipo INT |

**Retorno**

Esta funcion nos devuelve el nombre del proveedor que nos proveyo de ese producto

**Uso**

```sql
SELECT fn_obtener_nombre_proveedor_por_producto(5);
```

### Documentación de Triggers 

### Listado de triggers

### Trigger: tr_actualizar_inventario_despues_insertar_compra

**Descripcion**

Este trigger se ejecuta cada vez que se agrega un registro en la tabla de compras

### Trigger: tr_actualizar_inventario_despues_eliminar_compra

**Este trigger se ejecuta cada ves que se elimina un registro en la tabla de compras


### Documentación de Procedimientos Almacenados


### Procedimiento: sp_agregar_producto_inventario

**Descripcion**

Este procedimiento agrega productos al inventario

### Procedimiento: sp_elmiminar_producto_inventario

**Descrpicion**

Este procedimiento elimina productos del inventario

### Procedimiento: sp_registrar_entrada_inventario

**Descripcion**

Este procedimito agrega entradas al inventrio

### Procedimiento: sp_agregar_empleado

**Descripcion**

Este procedimetno agrega empleados a la tabla empleado

### Procedimiento: sp_eliminar_empleado

**Descripcion**

Este procedimiento elimina empleados


### Documentación de Vistas


### Listado de Vistas

### Vista: vw_cantidad_ventas

**Descripcion**

Esta vista muestra la cantidad de ventas

### Vista: vw_ventas_2023

**Descripcion**

Esta vista muestra la cantidad de ventas en el año 2023

### Vista: vw_empleados_sucursal

**Descripcion**

Esta vista muestra los empleados de cierta sucursal

### Vista: vw_envio_no_entregados

**Descripcion**

Esta vista muestra los envios que todavia no llegaron a su destinatario

## Vista: vw_metodo_pago_mas_usado

**Descripcion**

Esta vista muestra el metodo de pago más usado en la tienda de ropa