USE mysql;

-- create user 'admin_user'@'localhost' identified by 'admin_password';
-- create user 'gerente_ferreteria_user'@'localhost' identified by 'gerente_password';
-- create user 'cajero_user'@'localhost' identified by 'cajero_password';
drop user if exists 'admin_super'@'%';
create user 'admin_super'@'%' identified by '1111';
grant all privileges on control_inventario.* to 'admin_super'@'%' with grant option;

use ferreteria_mat;
drop role if exists 'admin';
create role 'admin';

drop role if exists 'gerente_ferreteria';
create role 'gerente_ferreteria';

drop role if exists 'cajero';
create role 'cajero';


grant all privileges on *.* to 'admin';
grant select, insert, update on ferreteria_mat.* to 'gerente_ferreteria';
grant create view on ferreteria_mat.* to 'gerente_ferreteria';
grant select, insert, update on ferreteria_mat.producto to 'cajero';
grant select, insert, update on ferreteria_mat.venta to 'cajero';


grant 'admin' to 'admin_user'@'localhost';
grant 'gerente_ferreteria' to 'gerente_ferreteria_user'@'localhost';
grant 'cajero' to 'cajero_user'@'localhost';


flush privileges;






