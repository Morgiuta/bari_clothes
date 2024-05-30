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

| Columna         | Tipo de Dato   |  NULL    | Unique  | Tipo Clave  | AutoIncrement |
|-----------------|----------------|----------|---------|-------------|---------------|
| sucursal_id     |      INT       | NOT NULL |   SI    |     PK      |      SI       |
| sucursal_ciudad |    VARCHAR     | NOT NULL |   NO    |      -      |      NO       |
| sucursal_calle  |    VARCHAR     | NOT NULL |   NO    |      -      |      NO       |
| codigo postal   |      INT       | NOT NULL |   No    |      -      |      NO       |

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



  En esta es una breve descripcion de mi primera entrega

  -

  - En el erchivo **bari_clothes_db_ortiz_ceballos** se puede visulizar la base de datos creada por el alumno
  - En el archivo **bari_clothes_DER_ortiz_ceballos** se puede ver el **"Diagrama Entidad Relación"**
  - En **descripcion_y_listado_DB_ortiz_ceballos** Se encuentra un adescripcion de la base de datos


[def]: bari_clothes_DER_ortiz_ceballos.png