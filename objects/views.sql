use ferreteria_mat ;

create view vista_clientes_compras as
select
    c.id_clientes,
    c.nombre,
    c.direccion,
    c.fecha as fecha_registro,
    c.tel,
    comp.id_compra,
    comp.fecha as fecha_compra,
    comp.total
from 
    clientes c
left join 
    compra comp on c.id_clientes = comp.id_clientes;

select * from vista_clientes_compras;


create view vista_productos_proveedores as
select 
    p.id_producto,
    p.nombre as nombre_producto,
    p.precio,
    p.stock,
    p.id_venta,
    prov.id_proveedor,
    prov.nombre as nombre_proveedor,
    prov.dereccion,
    prov.tel,
    prov.mail
from
    producto p
left join 
    proveedor prov on p.id_producto = prov.id_producto;

select * from vista_productos_proveedores;



create view vista_producto_mas_vendido_proveedor as
select 
    p.id_producto,
    p.nombre as nombre_producto,
    p.precio,
    p.stock,
    prov.id_proveedor,
    prov.nombre as nombre_proveedor,
    prov.dereccion,
    prov.tel,
    prov.mail,
    ventas_mas_altas.total_ventas
from 
    producto p
join 
    proveedor prov on p.id_producto = prov.id_producto
join 
    (select 
        v.id_producto, 
        count(v.id_venta) as total_ventas
     from 
        producto p
     join 
        venta v on p.id_venta = v.id_venta
     group by 
        v.id_producto
     order by 
        total_ventas desc
     limit 1) as ventas_mas_altas on p.id_producto = ventas_mas_altas.id_producto;


select * from vista_producto_mas_vendido_proveedor ;