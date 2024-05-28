use ferreteria_mat;

create user 'admin_user'@'localhost' identified by 'admin_password';
create user 'gerente_ferreteria_user'@'localhost' identified by 'gerente_password';
create user 'cajero_user'@'localhost' identified by 'cajero_password';


create role 'admin';
create role 'gerente_ferreteria';
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






