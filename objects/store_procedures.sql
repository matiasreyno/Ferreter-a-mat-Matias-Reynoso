USE ferreteria_mat ;

DELIMITER //

create procedure if not exists obtener_producto_mas_vendido(view_P varchar(50))
begin
     declare vista varchar(250);
              select
                    view_P into vista
                             from DUAL;
end //

DELIMITER ;


call obtener_producto_mas_vendido("vista_producto_mas_vendido_proveedor");


DELIMITER //

create procedure obtener_stock_total_por_proveedor(in proveedor_id int)
begin
    select 
        p.id_producto,
        p.nombre as nombre_producto,
        p.stock,
        p.precio,
        prov.nombre as nombre_proveedor,
        prov.dereccion,
        prov.tel,
        prov.mail
    from 
        producto p
    join 
        proveedor prov on p.id_producto = prov.id_producto
    where 
        prov.id_proveedor = proveedor_id;
end //

DELIMITER ;


call obtener_stock_total_por_proveedor(1);