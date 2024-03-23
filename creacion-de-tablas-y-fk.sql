-- link de la presentacion: 

-- https://my.visme.co/view/pvm9e4p4-ferreteria-mat

-- DER: https://excalidraw.com/#json=khYowZ0laOARMT80SGduy,_zYN3qnehFC27AK8JgaCzg

drop database if exists ferreteria_mat ;
create database ferreteria_mat ;

use ferreteria_mat ;

create table clientes (
     id_clientes   int primary key auto_increment
,    nombre        varchar (100)
,    direccion     varchar (150)
,    fecha         date
,    tel           varchar (50)
,    id_producto   int
,    id_compra     int

) ;
create table compra (
	 id_compra    int primary key auto_increment
,    fecha        date
,    total        decimal (20,0)
,    id_producto  int
,    id_venta     int
,    id_clientes  int

) ;
create table venta (
	 id_venta    int primary key auto_increment
,    fecha       date
,    total       decimal (20,0)
,    id_producto int
,    id_compra   int

) ;
create table producto (
     id_producto  int primary key auto_increment
,    nombre       varchar (200)
,    descripcion  text
,    precio       decimal (20,00)
,    stock        int
,    id_proveedor int
,    id_clientes  int
,    id_compra    int
,    id_venta     int

) ;
create table proveedor (
     id_proveedor  int primary key auto_increment
,    nombre        varchar (200)
,    dereccion     varchar (200)
,    tel           varchar (50)
,    mail          varchar (200)
,    id_producto   int
,    id_compra     int
) ;


-- fk tabla cliente

alter table  clientes
    add constraint fk_clientes_compra
    foreign key (id_compra) references compra (id_compra) ;

alter table  clientes
    add constraint fk_clientes_producto
    foreign key (id_producto) references producto (id_producto) ;

-- fk compra
    
    alter table  compra
    add constraint fk_compra_producto
    foreign key (id_producto) references producto (id_producto) ;
    
     alter table  compra
    add constraint fk_compra_venta
    foreign key (id_venta) references venta (id_venta) ;
    
-- fk venta

 alter table  venta
    add constraint fk_venta_producto
    foreign key (id_producto) references producto (id_producto) ;    
    
-- fk producto 

alter table  producto
    add constraint fk_producto_proveedor
    foreign key (id_proveedor) references proveedor (id_proveedor) ;     
    
-- fk proveedor 

alter table  proveedor
    add constraint fk_proveedor_compra
    foreign key (id_compra) references compra (id_compra) ;     