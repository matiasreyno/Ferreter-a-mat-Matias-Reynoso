DROP DATABASE IF EXISTS ferreteria_mat ;
CREATE DATABASE IF NOT EXISTS ferreteria_mat ;

USE ferreteria_mat ;

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

alter table  clientes
    add constraINT fk_clientes_compra
    foreign key (id_compra) references compra (id_compra) ;

alter table  clientes
    add constraINT fk_clientes_producto
    foreign key (id_producto) references producto (id_producto) ;

-- fk compra
    
    alter table  compra
    add constraINT fk_compra_producto
    foreign key (id_producto) references producto (id_producto) ;
    
     alter table  compra
    add constraINT fk_compra_venta
    foreign key (id_venta) references venta (id_venta) ;
    
-- fk venta

 alter table  venta
    add constraINT fk_venta_producto
    foreign key (id_producto) references producto (id_producto) ;    
    
-- fk producto 

alter table  producto
    add constraINT fk_producto_proveedor
    foreign key (id_proveedor) references proveedor (id_proveedor) ;     
    
-- fk proveedor 

alter table  proveedor
    add constraINT fk_proveedor_compra
    foreign key (id_compra) references compra (id_compra) ;