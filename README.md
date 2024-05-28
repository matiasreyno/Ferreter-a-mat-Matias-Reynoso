<center>
<img src="./imagenes/ferreteria-mat-1.png" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final</center>
@Alumno: Matias Reynoso

@Comision: 53180

@Tutor: Santiago Angel Gonzalez Martin

@Docente: Anderson Michel Torres



---

## Indice

 - [Temática del Proyecto](#temática-del-proyecto)
 - [Modelo de Negocio](#modelo-de-negocio)
 - [Diagrama Entidad-Relación](#diagrama-entidad-relación)
 - [Listado de Tablas y Descripción](#listado-de-tablas-y-descripción)
 - [Ingesta de Datos](#ingesta-de-datos)
 - [Objetos de la Base de Datos](#objetos-de-la-base-de-datos)
   - [Documentación de Funciones](#documentación-de-funciones)
   - [Documentación de Triggers](#documentación-de-triggers)
   - [Documentación de Procedimientos Almacenados](#documentación-de-procedimientos-almacenados)
   - [Documentación de Vistas](#documentación-de-vistas)
   - [Roles, Permisos y Usuarios](#roles-permisos-y-usuarios)
 - [Backup de la Base de Datos](#backup-de-la-base-de-datos)
 - [Herramientas y Tecnologías Usadas](#herramientas-y-tecnologías-usadas)
 - [Instrucciones para Levantar el Proyecto en CodeSpaces GitHub](#instrucciones-para-levantar-el-proyecto-en-codespaces-github)
 - [Formato de Entrega](#formato-de-entrega)

---

## Tematica del proyecto

<img src="./imagenes/ferreteria-mat-2.png" style="width: 100% ; aspect-ratio:16/9">

## Modelo de negocio

**Productos:**

La ferretería almacena una amplia variedad de productos como herramientas, materiales de construcción, productos eléctricos, y más.
La gestión de productos incluye mantener el inventario actualizado, ajustar precios y realizar pedidos a los proveedores.

**Proveedores:**

La ferretería trabaja con múltiples proveedores para obtener los productos necesarios.
La relación con los proveedores incluye la gestión de pedidos y el registro de información sobre el precio y disponibilidad de productos.

**Ventas:**

Las ventas se realizan a clientes finales que compran productos para sus necesidades personales o profesionales.
La gestión de ventas incluye registrar transacciones, actualizar el inventario y generar informes de ventas.

**Clientes:**

Los clientes pueden ser individuos o empresas que compran productos de la ferretería.
La gestión de clientes puede incluir mantener un registro de compras, contacto para promociones y seguimiento de satisfacción.

## Diagrama entidad relacion (DER)

<img src="./imagenes/der_ferreteria_mat.png" style="width: 80% ; aspect-ratio:16/9">

## Listado de tablas y descripcion

<img src="./imagenes/tabla-clientes.png" style="width: 80% ; aspect-ratio:16/9">

**Tabla clientes**

Contiene la información de los clientes que compran productos en la ferretería.

**id_cliente** (int, AI, PK): Identificador único para cada cliente.
**nombre** (varchar(100)): Nombre del cliente.
**direccion** (varchar(150)): Dirección del cliente.
**fecha** (date): Fecha en que el cliente fue registrado.
**tel** (varchar(50)): Teléfono de contacto del cliente.
**id_compra** (int, FK): Clave foránea que referencia a la tabla compra.

<img src="./imagenes/tabla-compra.png" style="width: 80% ; aspect-ratio:16/9">

**Tabla compra**
Registra las compras realizadas por los clientes.

**id_compra** (int, AI, PK): Identificador único para cada compra.
**fecha** (date): Fecha en que se realizó la compra.
**total** (decimal(20, 2)): Monto total de la compra.
**id_cliente** (int, FK): Clave foránea que referencia a la tabla clientes.
sql


<img src="./imagenes/tabla-venta.png" style="width: 80% ; aspect-ratio:16/9">

**Tabla venta**
Registra las ventas realizadas por la ferretería.

**id_venta** (int, AI, PK): Identificador único para cada venta.
**fecha**ate): Fecha en que se realizó la venta.
**total** (decimal(20, 2)): Monto total de la venta.
**id_compra** (int, FK): Clave foránea (si corresponde) que podría usarse para relacionar compras (dependiendo del contexto específico).

<img src="./imagenes/tabla-producto.png" style="width: 80% ; aspect-ratio:16/9">

**Tabla producto**
Almacena información sobre los productos que la ferretería vende.

**id_producto** (int, AI, PK): Identificador único para cada producto.
**nombr** (varchar(200)): Nombre del producto.
**preci** (decimal(20, 2)): Precio del producto.
**stock**(int): Cantidad de producto disponible en inventario.
**id_venta** (int, FK): Clave foránea que referencia a la tabla venta.

<img src="./imagenes/tabla-proveedor.png" style="width: 80% ; aspect-ratio:16/9">

**Tabla proveedor**
Contiene la información de los proveedores de los productos.

**id_proveedor** (int, AI, PK): Identificador único para cada proveedor.
**nombre** (varchar(200)): Nombre del proveedor.
**direccion** (varchar(200)): Dirección del proveedor.
**tel** (varchar(200)): Teléfono de contacto del proveedor.
**mail** (varchar(50)): Correo electrónico del proveedor.
**id_producto** (int, FK): Clave foránea que referencia a la tabla producto.
sql


<img src="./imagenes/tabla-historial-precios.png" style="width: 80% ; aspect-ratio:16/9">

**Tabla historial_precios**
Registra los cambios en los precios de los productos a lo largo del tiempo.

**id** (int, AI, PK): Identificador único para cada registro de cambio de precio.
**id_producto** (int, FK): Clave foránea que referencia a la tabla producto.
**precio_anterior** (decimal(20, 2)): Precio del producto antes del cambio.
**nuevo_precio** (decimal(20, 2)): Nuevo precio del producto después del cambio.
**fecha_cambio** (timestamp): Fecha y hora en que se realizó el cambio de precio.

## Estructura e ingesta de datos

**Captura Inicial:** Los datos son ingresados manualmente.

**Validación:** Los datos son validados para asegurar que cumplen con los formatos y restricciones de la base de datos.

**Inserción/Actualización:** Los datos son insertados en las tablas correspondientes usando comandos SQL.

**Verificación:** Después de la inserción/actualización, se realizan verificaciones para asegurar que los datos se han ingresado correctamente.

**Monitoreo y Mantenimiento:** Se monitorean los datos para detectar y corregir cualquier inconsistencia, además de realizar mantenimientos periódicos para optimizar la base de datos.

## Objetos de la base de datos

Los objetos de la base de datos se ubican en la carpeta objects, con un archivo sql para cada tipo de objeto:
- Funciones : a_funtions.sql
- Triggers : b_triggers.sql
- Prodecimientos almacenados : c_stored_procedures.sql
- Vistas : d_views.sql
- Roles, permisos y usuarios : e_roles_users.sql 

A continuación, se desarrolla la documentación de cada uno de ellos.


## Roles y permisos

## Back up de la base de datos

## Herramientas y tecnologias usadas

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos
