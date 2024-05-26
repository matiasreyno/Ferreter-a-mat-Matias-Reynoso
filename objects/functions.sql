use ferreteria_mat ;

delimiter //

create function calcular_total_ventas_producto(
    producto_id int,
    fecha_inicio date,
    fecha_fin date
) 
returns decimal(20, 2)
deterministic
begin
    declare total_ventas decimal(20, 2);

    select sum(v.total) into total_ventas
    from venta v
    join producto p on v.id_venta = p.id_venta
    where p.id_producto = producto_id
      and v.fecha between fecha_inicio and fecha_fin;

    return ifnull(total_ventas, 0);
end //

delimiter ;


select calcular_total_ventas_producto(1, '2023-01-01', '2023-12-31') as total_ventas;


delimiter //

create function calcular_total_ventas_cliente(
    cliente_id int,
    fecha_inicio date,
    fecha_fin date
) 
returns decimal(20, 2)
deterministic
begin
    declare total_ventas decimal(20, 2);

    -- calcular el total de ventas del cliente en el período especificado
    select sum(v.total) into total_ventas
    from compra c
    join venta v on c.id_compra = v.id_venta
    where c.id_cliente = cliente_id
      and v.fecha between fecha_inicio and fecha_fin;

    return ifnull(total_ventas, 0);
end //

delimiter ;


select calcular_total_ventas_cliente(1, '2023-01-01', '2023-12-31') as total_ventas;
