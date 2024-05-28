use ferreteria_mat ;

delimiter //

create procedure if not exists obtener_producto_mas_vendido(view_p varchar (50))
begin
     declare vista varchar(250);
            select 
                view_p into vista 
                       from dual;                      
end //

delimiter ;


call obtener_producto_mas_vendido("vista_producto_mas_vendido_proveedor");


delimiter //

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

delimiter ;


call obtener_stock_total_por_proveedor(1);



delimiter //

create procedure registrar_venta_y_actualizar_stock(
    in p_id_producto int,
    in p_fecha date,
    in p_total decimal(20, 2),
    in p_cantidad int
)
begin
    declare v_stock_actual int;

    -- verificar el stock actual del producto
    select stock into v_stock_actual
    from producto
    where id_producto = p_id_producto;

    -- verificar si hay suficiente stock
    if v_stock_actual >= p_cantidad then
        -- registrar la venta en la tabla de ventas
        insert into venta (fecha, total, id_compra)
        values (p_fecha, p_total, p_id_compra);

        -- actualizar el stock del producto
        update producto
        set stock = stock - p_cantidad
        where id_producto = p_id_producto;
    else
        -- si no hay suficiente stock, lanzar un error
        signal sqlstate '45000'
        set message_text = 'stock insuficiente para realizar la venta';
    end if;
end //

delimiter ;


call registrar_venta_y_actualizar_stock(1, '2023-05-22', 100.00, 2);



