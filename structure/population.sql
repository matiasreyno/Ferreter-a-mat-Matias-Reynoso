use ferreteria_mat;




insert into clientes(nombre,direccion,fecha,tel) values
("juan","olazabal2030","2023/09/10",1136789525),
("leon","panama879","2023/08/10",1136789525),
("laura","troillo987","2023/09/02",1136789525),
("roman","acevedo226","2023/07/25",1136789525),
("carlos","solis1978","2023/06/30",1136789525),
("esteban","acevedo328","2023/08/11",1136789525),
("leticia","malabia456","2023/07/15",1136789525),
("romina","castillo951","2023/06/25",1136789525),
("ignacio","pringles230","2023/09/04",1136789525),
("marcelo","arenales523","2023/10/05",1136789525);





insert into compra(fecha,total,id_clientes) values
("2023/06/10",6000,1),
("2023/07/23",7000,2),
("2023/08/21",3000,3),
("2023/03/21",15000,4),
("2023/07/15",20000,3),
("2023/07/23",7000,5),
("2023/08/09",30000,6),
("2023/05/28",10000,7),
("2023/06/10",5000,8),
("2023/02/26",15000,9);



insert into venta(fecha,total,id_compra) values
("2023/09/02",100000,4),
("2023/08/10",22000,5),
("2023/09/02",35000,6),
("2023/07/25",40000,7),
("2023/06/30",5000,7),
("2023/08/11",60000,8),
("2023/07/15",70000,9),
("2023/06/25",18000,10),
("2023/09/04",30000,2),
("2023/10/05",98000,10);



insert into producto(nombre,precio,stock,id_venta) values
("amoladora-angular",29500,20,10),
("taladro-destornillador-inal.",50000,50,10),
("tester",10000,15,15),
("martillo",5000,50,20),
("juego-de-pinzas",8000,40,11),
("pinza-de-punta",7000,60,80),
("tornillosmadera1pulgada",5000,100,10),
("tenaza",8000,20,30),
("destornillador",6000,150,50),
("termica25a",10000,30,150);



insert into proveedor(nombre,dereccion,tel,mail,id_producto) values
("lomanegra","olazabal4030","lomanegra@gmail.com",48587963,1),
("sicca","bulnes5620","lomanegra@gmail.com",69874563,2),
("generalelectric","rivadavia3641","lomanegra@gmail.com",52877963,3),
("ferrum","thames564","ferrum@gmail.com",45892365,4),
("accesorioslalo","sucre92","accesorioslalo@gmail.com",45852365,5),
("costasjuan","riobamva500","costasjuan@gmail.com",58964556,6),
("elcosito","belgrano2789","elcosito@gmail.com",21235698,7),
("soluciones","neuquen458","soluciones@gmail.com",12457896,7),
("buloneralola","olazabal2019","buloneralola@gmail.com",25457896,9),
("santoro","castillo328","santoro@gmail.com",36569874,10);