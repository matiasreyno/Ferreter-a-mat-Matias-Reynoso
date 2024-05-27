use ferreteria_mat ;

create user 'gerente_de_venta_user'@'localhost' identified by 'gerente_password';
create user 'cajero_user'@'localhost' identified by 'cajero_password';


create role gerente_de_venta;


grant select, insert, update on ferreteria_mat.* to 'gerente_de_ventas';
grant create view on ferreteria_mat.* to 'gerente_de_ventas';



create role cajero;

grant select, insert, update on ferreteria_mat.producto to 'cajero';
grant select, insert, update on ferreteria_mat.venta to 'cajero';



grant 'gerente_de_venta' to 'gerente_de_venta_user'@'localhost';
grant 'cajero' to 'cajero_user'@'localhost';


set default role gerente_de_venta to 'gerente_de_venta_user'@'localhost';
set default role cajero to 'cajero_user'@'localhost';

flush privileges;







