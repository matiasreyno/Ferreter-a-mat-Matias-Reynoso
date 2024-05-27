drop database if exists ferreteria_mat ;
create database ferreteria_mat ;


 use ferreteria_mat ;


create table clientes (
        id_clientes      int primary key not null auto_increment 
,       nombre           varchar(100) 
,       direccion        varchar(150) 
,       fecha            date 
,       tel              varchar(50)  
		
) ;

-- select * from ferreteria_mat.clientes ;

create table compra  (
       id_compra     int primary key not null auto_increment 
,      fecha         date 
,      total         decimal(20,0) 
,      id_clientes   int 

) ;

-- select * from ferreteria_mat.compra ;


create table venta  (
	    id_venta      int primary key not null auto_increment 
,      fecha         date 
,      total         decimal(20,0)  
,      id_compra     int
)  ;


create table producto (
       id_producto    int primary key not null auto_increment
,      nombre         varchar(200) 
,      precio         decimal(20,0) 
,      stock          int 
,      id_venta       int  

)  ;

-- select * from ferreteria_mat.producto  ;


create table proveedor  (
	   id_proveedor      int  primary key not null auto_increment
,      nombre           varchar(200) 
,      dereccion        varchar(200) 
,      tel              varchar(50) 
,      mail             varchar(200) 
,      id_producto      int 
)  ;

create table historial_precios (
    id int auto_increment primary key,
    id_producto int,
    precio_anterior decimal(20, 2),
    nuevo_precio decimal(20, 2),
    fecha_cambio timestamp default current_timestamp
);


-- select * from ferreteria_mat.proveedor ;

-- fk de proveedor

alter table proveedor
   add constraint __fk_proveedor_producto
   foreign key (id_producto) references producto (id_producto) ;
   
-- fk de producto
   
alter table producto
   add constraint __fk_producto_venta
   foreign key (id_venta) references venta (id_venta) ;
   
-- fk de venta

alter table venta
   add constraint __fk_venta_compra
   foreign key (id_compra) references compra (id_compra) ;
   
-- fk de compra

alter table compra
   add constraint __fk_compra_clientesPRIMARY
   foreign key (id_clientes) references clientes (id_clientes) ;
   

 
alter table historial_precios
   add constraint __fk_historial_precios_producto
   foreign key (id_producto) references producto (id_producto) ;



