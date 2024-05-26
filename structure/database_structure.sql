DROP DATABASE IF EXISTS ferreteria_mat;
CREATE DATABASE IF NOT EXISTS ferreteria_mat;

USE ferreteria_mat;

CREATE TABLE clientes (
     id_clientes   INT PRIMARY KEY AUTO_INCREMENT
,    nombre        VARCHAR(100)
,    direccion     VARCHAR(150)
,    fecha         DATE
,    tel           VARCHAR(50)
,    id_producto   INT
,    id_compra     INT

) ;
CREATE TABLE compra (
	 id_compra    INT PRIMARY KEY AUTO_INCREMENT
,    fecha        DATE
,    total        DECIMAL(20,0)
,    id_producto  INT
,    id_venta     INT
,    id_clientes  INT

) ;
CREATE TABLE venta (
	 id_venta    INT PRIMARY KEY AUTO_INCREMENT
,    fecha       DATE
,    total       DECIMAL(20,0)
,    id_producto INT
,    id_compra   INT

) ;
CREATE TABLE producto (
     id_producto  INT PRIMARY KEY AUTO_INCREMENT
,    nombre       VARCHAR(200)
,    descripcion  TEXT
,    precio       DECIMAL(20,00)
,    stock        INT
,    id_proveedor INT
,    id_clientes  INT
,    id_compra    INT
,    id_venta     INT

) ;
CREATE TABLE proveedor (
     id_proveedor  INT PRIMARY KEY AUTO_INCREMENT
,    nombre        VARCHAR(200)
,    dereccion     VARCHAR(200)
,    tel           VARCHAR(50)
,    mail          VARCHAR(200)
,    id_producto   INT
,    id_compra     INT
) ;


-- fk tabla cliente

ALTER TABLE  clientes
   ADD CONSTRAINT fk_clientes_compra
    FOREIGN KEY(id_compra) REFERENCES compra(id_compra) ;

ALTER TABLE  clientes
   ADD CONSTRAINT fk_clientes_producto
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto) ;

-- fk compra
    
    ALTER TABLE  compra
   ADD CONSTRAINT fk_compra_producto
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto) ;
    
     ALTER TABLE  compra
   ADD CONSTRAINT fk_compra_venta
    FOREIGN KEY(id_venta) REFERENCES venta(id_venta) ;
    
-- fk venta

 ALTER TABLE  venta
   ADD CONSTRAINT fk_venta_producto
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto) ;    
    
-- fk producto 

ALTER TABLE  producto
   ADD CONSTRAINT fk_producto_proveedor
    FOREIGN KEY(id_proveedor) REFERENCES proveedor(id_proveedor) ;     
    
-- fk proveedor 

ALTER TABLE  proveedor
   ADD CONSTRAINT fk_proveedor_compra
    FOREIGN KEY(id_compra) REFERENCES compra(id_compra) ;