mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: ferreteria_mat
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'juan','olazabal2030','2023-09-10','1136789525'),(2,'leon','panama879','2023-08-10','1136789525'),(3,'laura','troillo987','2023-09-02','1136789525'),(4,'roman','acevedo226','2023-07-25','1136789525'),(5,'carlos','solis1978','2023-06-30','1136789525'),(6,'esteban','acevedo328','2023-08-11','1136789525'),(7,'leticia','malabia456','2023-07-15','1136789525'),(8,'romina','castillo951','2023-06-25','1136789525'),(9,'ignacio','pringles230','2023-09-04','1136789525'),(10,'marcelo','arenales523','2023-10-05','1136789525');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `total` decimal(20,0) DEFAULT NULL,
  `id_clientes` int DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `__fk_compra_clientesPRIMARY` (`id_clientes`),
  CONSTRAINT `__fk_compra_clientesPRIMARY` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2023-06-10',6000,1),(2,'2023-07-23',7000,2),(3,'2023-08-21',3000,3),(4,'2023-03-21',15000,4),(5,'2023-07-15',20000,3),(6,'2023-07-23',7000,5),(7,'2023-08-09',30000,6),(8,'2023-05-28',10000,7),(9,'2023-06-10',5000,8),(10,'2023-02-26',15000,9);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_precios`
--

DROP TABLE IF EXISTS `historial_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_precios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `precio_anterior` decimal(20,2) DEFAULT NULL,
  `nuevo_precio` decimal(20,2) DEFAULT NULL,
  `fecha_cambio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `__fk_historial_precios_producto` (`id_producto`),
  CONSTRAINT `__fk_historial_precios_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_precios`
--

LOCK TABLES `historial_precios` WRITE;
/*!40000 ALTER TABLE `historial_precios` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `precio` decimal(20,0) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `id_venta` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `__fk_producto_venta` (`id_venta`),
  CONSTRAINT `__fk_producto_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'amoladora-angular',29500,18,1),(2,'taladro-destornillador-inal.',50000,50,2),(3,'tester',10000,15,3),(4,'martillo',5000,50,4),(5,'juego-de-pinzas',8000,40,5),(6,'pinza-de-punta',7000,60,6),(7,'tornillosmadera1pulgada',5000,100,7),(8,'tenaza',8000,20,8),(9,'destornillador',6000,150,9),(10,'termica25a',10000,30,10);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_producto_update` BEFORE UPDATE ON `producto` FOR EACH ROW begin
    -- registrar el cambio de precio en el historial
    if old.precio <> new.precio then
        insert into historial_precios (id_producto, precio_anterior, nuevo_precio)
        values (old.id_producto, old.precio, new.precio);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `dereccion` varchar(200) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `__fk_proveedor_producto` (`id_producto`),
  CONSTRAINT `__fk_proveedor_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'lomanegra','olazabal4030','lomanegra@gmail.com','48587963',1),(2,'sicca','bulnes5620','lomanegra@gmail.com','69874563',2),(3,'generalelectric','rivadavia3641','lomanegra@gmail.com','52877963',3),(4,'ferrum','thames564','ferrum@gmail.com','45892365',4),(5,'accesorioslalo','sucre92','accesorioslalo@gmail.com','45852365',5),(6,'costasjuan','riobamva500','costasjuan@gmail.com','58964556',6),(7,'elcosito','belgrano2789','elcosito@gmail.com','21235698',7),(8,'soluciones','neuquen458','soluciones@gmail.com','12457896',7),(9,'buloneralola','olazabal2019','buloneralola@gmail.com','25457896',9),(10,'santoro','castillo328','santoro@gmail.com','36569874',10);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `total` decimal(20,0) DEFAULT NULL,
  `id_compra` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `__fk_venta_compra` (`id_compra`),
  CONSTRAINT `__fk_venta_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2023-09-02',100000,4),(2,'2023-08-10',22000,5),(3,'2023-09-02',35000,6),(4,'2023-07-25',40000,7),(5,'2023-06-30',5000,7),(6,'2023-08-11',60000,8),(7,'2023-07-15',70000,9),(8,'2023-06-25',18000,10),(9,'2023-09-04',30000,2),(10,'2023-10-05',98000,10),(11,'2023-05-22',100,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_venta_insert` AFTER INSERT ON `venta` FOR EACH ROW begin
    declare producto_id int;
    
    -- obtener el id_producto de la tabla compra
    select id_producto into producto_id
    from compra
    where id_compra = new.id_compra;
    
    -- reducir el stock del producto
    update producto
    set stock = stock - 1
    where id_producto = producto_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_clientes_compras`
--

DROP TABLE IF EXISTS `vista_clientes_compras`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_compras` AS SELECT 
 1 AS `id_clientes`,
 1 AS `nombre`,
 1 AS `direccion`,
 1 AS `fecha_registro`,
 1 AS `tel`,
 1 AS `id_compra`,
 1 AS `fecha_compra`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_producto_mas_vendido_proveedor`
--

DROP TABLE IF EXISTS `vista_producto_mas_vendido_proveedor`;
/*!50001 DROP VIEW IF EXISTS `vista_producto_mas_vendido_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_producto_mas_vendido_proveedor` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `precio`,
 1 AS `stock`,
 1 AS `id_proveedor`,
 1 AS `nombre_proveedor`,
 1 AS `dereccion`,
 1 AS `tel`,
 1 AS `mail`,
 1 AS `total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_proveedores`
--

DROP TABLE IF EXISTS `vista_productos_proveedores`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_proveedores` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `precio`,
 1 AS `stock`,
 1 AS `id_venta`,
 1 AS `id_proveedor`,
 1 AS `nombre_proveedor`,
 1 AS `dereccion`,
 1 AS `tel`,
 1 AS `mail`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_clientes_compras`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_compras` AS select `c`.`id_clientes` AS `id_clientes`,`c`.`nombre` AS `nombre`,`c`.`direccion` AS `direccion`,`c`.`fecha` AS `fecha_registro`,`c`.`tel` AS `tel`,`comp`.`id_compra` AS `id_compra`,`comp`.`fecha` AS `fecha_compra`,`comp`.`total` AS `total` from (`clientes` `c` left join `compra` `comp` on((`c`.`id_clientes` = `comp`.`id_clientes`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_producto_mas_vendido_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `vista_producto_mas_vendido_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_producto_mas_vendido_proveedor` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre_producto`,`p`.`precio` AS `precio`,`p`.`stock` AS `stock`,`prov`.`id_proveedor` AS `id_proveedor`,`prov`.`nombre` AS `nombre_proveedor`,`prov`.`dereccion` AS `dereccion`,`prov`.`tel` AS `tel`,`prov`.`mail` AS `mail`,`ventas_mas_altas`.`total_ventas` AS `total_ventas` from ((`producto` `p` join `proveedor` `prov` on((`p`.`id_producto` = `prov`.`id_producto`))) join (select `p`.`id_producto` AS `id_producto`,count(`v`.`id_venta`) AS `total_ventas` from (`producto` `p` join `venta` `v` on((`p`.`id_venta` = `v`.`id_venta`))) group by `p`.`id_producto` order by `total_ventas` desc limit 1) `ventas_mas_altas` on((`p`.`id_producto` = `ventas_mas_altas`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_proveedores` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre_producto`,`p`.`precio` AS `precio`,`p`.`stock` AS `stock`,`p`.`id_venta` AS `id_venta`,`prov`.`id_proveedor` AS `id_proveedor`,`prov`.`nombre` AS `nombre_proveedor`,`prov`.`dereccion` AS `dereccion`,`prov`.`tel` AS `tel`,`prov`.`mail` AS `mail` from (`producto` `p` left join `proveedor` `prov` on((`p`.`id_producto` = `prov`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 21:24:37
