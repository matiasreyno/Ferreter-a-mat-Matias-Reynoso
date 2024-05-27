use ferreteria_mat ;

delimiter //

create trigger after_venta_insert
after insert on venta
for each row 
begin
    declare producto_id int;
    
    -- obtener el id_producto de la tabla compra
    select id_producto into producto_id
    from compra
    where id_compra = new.id_compra;
    
    -- reducir el stock del producto
    update producto
    set stock = stock - 1
    where id_producto = producto_id;
end //

delimiter ;


delimiter //

create trigger before_producto_update
before update on producto
for each row 
begin
    -- registrar el cambio de precio en el historial
    if old.precio <> new.precio then
        insert into historial_precios (id_producto, precio_anterior, nuevo_precio)
        values (old.id_producto, old.precio, new.precio);
    end if;
end //

delimiter ;
