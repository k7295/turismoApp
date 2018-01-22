CREATE DATABASE  IF NOT EXISTS `servicioexcursiones` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `servicioexcursiones`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: servicioexcursiones
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT,
  `banco` varchar(20) NOT NULL,
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` VALUES (1,'BCR');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Playa'),(3,'Montana');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentariosdestino`
--

DROP TABLE IF EXISTS `comentariosdestino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentariosdestino` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `idDestino` int(11) NOT NULL,
  `comentario` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idDestino` (`idDestino`),
  CONSTRAINT `comentariosdestino_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentariosdestino`
--

LOCK TABLES `comentariosdestino` WRITE;
/*!40000 ALTER TABLE `comentariosdestino` DISABLE KEYS */;
INSERT INTO `comentariosdestino` VALUES (1,8,'*-*'),(2,9,'holi :3'),(3,9,':33'),(4,9,'yuhu'),(5,9,'boom');
/*!40000 ALTER TABLE `comentariosdestino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinosturisticos`
--

DROP TABLE IF EXISTS `destinosturisticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinosturisticos` (
  `idDestino` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDestino` varchar(100) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`idDestino`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinosturisticos`
--

LOCK TABLES `destinosturisticos` WRITE;
/*!40000 ALTER TABLE `destinosturisticos` DISABLE KEYS */;
INSERT INTO `destinosturisticos` VALUES (1,'Playas del Coco','Guanacaste',3,'modificado'),(8,'Pacayas','por donde el viento se devuelve',3,':3'),(9,'destinoPrueba','china',1,'ahhhhh');
/*!40000 ALTER TABLE `destinosturisticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursiones`
--

DROP TABLE IF EXISTS `excursiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excursiones` (
  `idExcursion` int(11) NOT NULL AUTO_INCREMENT,
  `idDestino` int(11) NOT NULL,
  `fechaHoraSalida` varchar(20) NOT NULL,
  `lugarSalida` varchar(100) NOT NULL,
  `cupos` int(11) NOT NULL,
  `cuposDisponibles` int(11) NOT NULL,
  `precioAdulto` int(11) NOT NULL,
  `precioAdultoM` int(11) NOT NULL,
  `precioNino` int(11) NOT NULL,
  `guia` varchar(10) NOT NULL,
  `lugarSalida2` varchar(100) DEFAULT NULL,
  `lugarSalida3` varchar(100) DEFAULT NULL,
  `nombreExcursion` varchar(100) NOT NULL,
  `fechaPrimerPago` varchar(20) NOT NULL,
  `fechaLimite` varchar(20) NOT NULL,
  `cuentaBancaria` varchar(100) NOT NULL,
  PRIMARY KEY (`idExcursion`),
  KEY `idDestino` (`idDestino`),
  KEY `guia` (`guia`),
  CONSTRAINT `excursiones_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`) ON DELETE CASCADE,
  CONSTRAINT `excursiones_ibfk_2` FOREIGN KEY (`guia`) REFERENCES `personal` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursiones`
--

LOCK TABLES `excursiones` WRITE;
/*!40000 ALTER TABLE `excursiones` DISABLE KEYS */;
INSERT INTO `excursiones` VALUES (20,8,'2018-01-01 20:10','SalidaA',23,22,15,16,12,'30483','SalidaA','null','DestinoB','2018-01-01 20:10','2018-01-01 20:10','914834623'),(21,9,'2018-01-01 20:10','ja',45,45,13,41,12,'30483','','','DestinoA','2018-01-01 20:10','2018-01-01 20:10','765431');
/*!40000 ALTER TABLE `excursiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flotilla`
--

DROP TABLE IF EXISTS `flotilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flotilla` (
  `idVehiculo` varchar(6) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idTipoVehiculo` int(11) NOT NULL,
  `campos` int(11) NOT NULL,
  `enMantenimiento` tinyint(1) DEFAULT NULL,
  `chofer` varchar(10) NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  KEY `idMarca` (`idMarca`),
  KEY `idTipoVehiculo` (`idTipoVehiculo`),
  KEY `chofer` (`chofer`),
  CONSTRAINT `flotilla_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marcasvehiculos` (`idMarca`),
  CONSTRAINT `flotilla_ibfk_2` FOREIGN KEY (`idTipoVehiculo`) REFERENCES `tipovehiculos` (`idTipoVehiculo`),
  CONSTRAINT `flotilla_ibfk_3` FOREIGN KEY (`chofer`) REFERENCES `personal` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flotilla`
--

LOCK TABLES `flotilla` WRITE;
/*!40000 ALTER TABLE `flotilla` DISABLE KEYS */;
INSERT INTO `flotilla` VALUES ('02',1,2,45,0,'123'),('09',2,2,15,1,'123'),('111',2,1,54,0,'123'),('1415',1,2,10,1,'123'),('222',1,2,32,1,'123'),('321',2,1,23,1,'123'),('322',2,1,23,1,'123'),('44534',1,2,45,1,'123'),('5601',2,1,67,0,'123'),('563',2,1,14,0,'123'),('564',1,1,45,1,'123'),('5641',2,1,67,0,'123'),('6',1,1,15,0,'123'),('643',1,2,43,1,'123'),('654',1,1,15,0,'123'),('660',1,1,2,1,'123'),('665',1,1,2,1,'123'),('669',1,1,2,1,'123'),('67',1,2,43,1,'123'),('7',1,1,76,0,'123'),('745',1,2,43,1,'123'),('7645',1,1,23,0,'123'),('785',2,1,67,0,'123'),('789',2,1,56,1,'123'),('856',2,1,65,0,'123'),('86',2,1,6,1,'123'),('8654',2,1,4,0,'123'),('869',2,2,6,1,'123'),('87',1,2,44,0,'123'),('875',1,2,5,1,'123'),('900',1,1,2,0,'123'),('901',2,2,23,0,'123'),('903',2,2,85,0,'123'),('9876',1,1,78,0,'123'),('9999',2,1,56,1,'123');
/*!40000 ALTER TABLE `flotilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flotillaxexcursion`
--

DROP TABLE IF EXISTS `flotillaxexcursion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flotillaxexcursion` (
  `idFxE` int(11) NOT NULL AUTO_INCREMENT,
  `idExcursion` int(11) NOT NULL,
  `idVehiculo` varchar(6) NOT NULL,
  PRIMARY KEY (`idFxE`),
  KEY `idExcursion` (`idExcursion`),
  KEY `idVehiculo` (`idVehiculo`),
  CONSTRAINT `flotillaxexcursion_ibfk_1` FOREIGN KEY (`idExcursion`) REFERENCES `excursiones` (`idExcursion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flotillaxexcursion_ibfk_2` FOREIGN KEY (`idVehiculo`) REFERENCES `flotilla` (`idVehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flotillaxexcursion`
--

LOCK TABLES `flotillaxexcursion` WRITE;
/*!40000 ALTER TABLE `flotillaxexcursion` DISABLE KEYS */;
INSERT INTO `flotillaxexcursion` VALUES (3,20,'901'),(4,21,'1415');
/*!40000 ALTER TABLE `flotillaxexcursion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenesdestinos`
--

DROP TABLE IF EXISTS `imagenesdestinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenesdestinos` (
  `idImagen` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(300) NOT NULL,
  `idDestino` int(11) NOT NULL,
  PRIMARY KEY (`idImagen`),
  KEY `idDestino` (`idDestino`),
  CONSTRAINT `imagenesdestinos_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesdestinos`
--

LOCK TABLES `imagenesdestinos` WRITE;
/*!40000 ALTER TABLE `imagenesdestinos` DISABLE KEYS */;
INSERT INTO `imagenesdestinos` VALUES (6,'playasDelCoco2.jpg',1),(12,'playasDelCoco2.jpg',8),(14,'bahiaBallenas2.jpg',9),(15,'volcanArenal3.jpg',1),(19,'volcanArenal3.jpg',9),(20,'bahiaBallenas3.jpg',1),(21,'PlayasDelCoco3.jpg',1);
/*!40000 ALTER TABLE `imagenesdestinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcasvehiculos`
--

DROP TABLE IF EXISTS `marcasvehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcasvehiculos` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(25) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcasvehiculos`
--

LOCK TABLES `marcasvehiculos` WRITE;
/*!40000 ALTER TABLE `marcasvehiculos` DISABLE KEYS */;
INSERT INTO `marcasvehiculos` VALUES (1,'Toyota'),(2,'Hyundai');
/*!40000 ALTER TABLE `marcasvehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `numeroTelefono` varchar(8) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `idPuesto` int(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `idPuesto` (`idPuesto`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idPuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES ('123','Geova','Villa','22231516','Giova@hotmail.com',1),('30483','Roberto','Ortiz','2131','sadasd',2);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puestos` (
  `idPuesto` int(11) NOT NULL AUTO_INCREMENT,
  `puesto` varchar(20) NOT NULL,
  PRIMARY KEY (`idPuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Chofer'),(2,'guia');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaciones`
--

DROP TABLE IF EXISTS `reservaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaciones` (
  `idReservacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `numeroTelefono` varchar(8) NOT NULL,
  `camposReservados` int(11) NOT NULL,
  `idExcursion` int(11) NOT NULL,
  `primerPago` tinyint(1) NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `cancelado` tinyint(1) NOT NULL,
  `urlPago1` varchar(300) DEFAULT NULL,
  `urlPago2` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idReservacion`),
  KEY `idExcursion` (`idExcursion`),
  CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`idExcursion`) REFERENCES `excursiones` (`idExcursion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
INSERT INTO `reservaciones` VALUES (24,'Karen','Lepiz','645789',3,20,0,0,1,NULL,NULL),(25,'Giovanni','Villalobos','645789',5,21,0,0,1,NULL,NULL),(26,'sdasd','asdad','31231',12,20,0,0,1,NULL,NULL),(27,'fdads','asdas','3423',12,21,0,0,1,NULL,NULL),(28,'dfsd','fasdas','3242',12,20,0,0,1,NULL,NULL),(29,'asad','adasa','123221',3,20,0,0,1,NULL,NULL),(30,'sdasd','asdasd','a4231',1,20,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `reservaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'WIFI'),(2,'Banos'),(3,'Bar'),(4,'Aire Acondicionado'),(5,'TV'),(6,'Musica');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviciosdestinos`
--

DROP TABLE IF EXISTS `serviciosdestinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviciosdestinos` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciosdestinos`
--

LOCK TABLES `serviciosdestinos` WRITE;
/*!40000 ALTER TABLE `serviciosdestinos` DISABLE KEYS */;
INSERT INTO `serviciosdestinos` VALUES (1,'Todo incluido'),(2,'Desayuno'),(3,'Almuerzo'),(4,'Cena'),(5,'Merienda');
/*!40000 ALTER TABLE `serviciosdestinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviciosxexcursion`
--

DROP TABLE IF EXISTS `serviciosxexcursion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviciosxexcursion` (
  `idServicioExcursion` int(11) NOT NULL AUTO_INCREMENT,
  `idServicio` int(11) NOT NULL,
  `idExcursion` int(11) NOT NULL,
  PRIMARY KEY (`idServicioExcursion`),
  KEY `serviciosxexcursion_ibfk_1` (`idServicio`),
  KEY `serviciosxexcursion_ibfk_2` (`idExcursion`),
  CONSTRAINT `serviciosxexcursion_ibfk_1` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`) ON DELETE CASCADE,
  CONSTRAINT `serviciosxexcursion_ibfk_2` FOREIGN KEY (`idExcursion`) REFERENCES `excursiones` (`idExcursion`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciosxexcursion`
--

LOCK TABLES `serviciosxexcursion` WRITE;
/*!40000 ALTER TABLE `serviciosxexcursion` DISABLE KEYS */;
INSERT INTO `serviciosxexcursion` VALUES (14,2,20),(15,5,21),(16,2,21);
/*!40000 ALTER TABLE `serviciosxexcursion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicioxvehiculo`
--

DROP TABLE IF EXISTS `servicioxvehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicioxvehiculo` (
  `idServicioVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVehiculo` varchar(6) NOT NULL,
  `idServicio` int(11) NOT NULL,
  PRIMARY KEY (`idServicioVehiculo`),
  KEY `idVehiculo` (`idVehiculo`),
  KEY `idServicio` (`idServicio`),
  CONSTRAINT `servicioxvehiculo_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `flotilla` (`idVehiculo`),
  CONSTRAINT `servicioxvehiculo_ibfk_2` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicioxvehiculo`
--

LOCK TABLES `servicioxvehiculo` WRITE;
/*!40000 ALTER TABLE `servicioxvehiculo` DISABLE KEYS */;
INSERT INTO `servicioxvehiculo` VALUES (1,'1415',1),(2,'1415',3),(3,'67',3),(4,'875',4),(5,'563',4),(6,'563',4),(7,'785',4),(8,'785',5),(10,'44534',1),(11,'44534',2),(12,'44534',5),(13,'900',2),(14,'903',2),(15,'903',3),(16,'903',4),(17,'903',5),(18,'903',6),(19,'643',1),(20,'643',4),(21,'8654',2),(22,'7',3),(23,'7',5),(24,'564',2),(25,'5641',2),(26,'5641',2),(27,'5601',2),(29,'111',1),(30,'111',2),(31,'222',1),(32,'665',1),(33,'669',1),(34,'669',3),(35,'669',5),(36,'660',1),(37,'660',3),(38,'660',5),(39,'322',1),(40,'321',1);
/*!40000 ALTER TABLE `servicioxvehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipovehiculos`
--

DROP TABLE IF EXISTS `tipovehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipovehiculos` (
  `idTipoVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `tipoVehiculo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTipoVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipovehiculos`
--

LOCK TABLES `tipovehiculos` WRITE;
/*!40000 ALTER TABLE `tipovehiculos` DISABLE KEYS */;
INSERT INTO `tipovehiculos` VALUES (1,'Microbus'),(2,'Bus');
/*!40000 ALTER TABLE `tipovehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'servicioexcursiones'
--
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarCategorias`(
	pCategoria VARCHAR(50),
	pNuevoNombre VARCHAR(50)
)
BEGIN
	UPDATE `categorias`
	SET `categoria`=pNuevoNombre
	WHERE LOWER(`categoria`)=LOWER(pCategoria);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarDestino`(
	pDestino VARCHAR(100),
	pLugar VARCHAR(100),
	pCategoria VARCHAR(50),
	pDescripcion VARCHAR(250)
)
BEGIN
	CALL uspVerIdCategoria(pCategoria,@newCat);

	UPDATE `destinosTuristicos`
	SET `nombreDestino`=pDestino,
		`lugar`=pLugar,
	 	`idCategoria`=@newCat,
	 	`descripcion`=pDescripcion
	WHERE LOWER(`nombreDestino`)=LOWER(pDestino);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarExcursion`(
	pDestino VARCHAR(100),pFechaHora VARCHAR(20),pLugar VARCHAR(100),pCupos INT,pPrecioA INT,pPrecioAM INT,
	pPrecioNino INT, pGuia VARCHAR(10),pLugar2 VARCHAR(100),pLugar3 VARCHAR(100),pNombre VARCHAR(100),
    pFechaPrimerPago VARCHAR(20), pFechaLimite VARCHAR(20),pCuentaBancaria VARCHAR(100),pPlaca VARCHAR(6)
)
BEGIN
	CALL uspVerIdExcursion(pNombre,@excursion);
    CALL uspVerIdDestino(pDestino,@destino);
    
	UPDATE `excursiones`
	SET idDestino=@destino,
		fechaHoraSalida=pFechaHora,
        lugarSalida=pLugar,
        cupos=pCupos,
        cuposDisponibles=pCupos,
        precioAdulto=pPrecioA,
        precioAdultoM=pPrecioAM,
        precioNino=pPrecioNino,
        guia=pGuia,
        lugarSalida2=pLugar2,
        lugarSalida3=pLugar3,
        fechaPrimerPago=pFechaPrimerPago,
        fechaLimite=pFechaLimite,
        cuentaBancaria=pCuentaBancaria
	WHERE LOWER(`nombreExcursion`)=LOWER(pNombre);
    
    UPDATE `flotillaxexcursion`
    SET idVehiculo=pPlaca
    WHERE idExcursion=@excursion;
	
	CALL uspBorrarServiciosXExcursion(@excursion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarMarca`(
	pMarca VARCHAR(25),
	pNuevoNombre VARCHAR(25)
)
BEGIN
	UPDATE `marcasVehiculos`
	SET `marca`=pNuevoNombre
	WHERE LOWER(`marca`)=LOWER(pMarca);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarPersona`(
	pCedula VARCHAR(10),pNombre VARCHAR(50),pApellidos VARCHAR(50),pNumeroTelefonico VARCHAR(8),pCorreo VARCHAR(30),
	pPuesto VARCHAR(20),pCuentaBancaria VARCHAR(17),pBanco VARCHAR(20),
	pNuevaCed VARCHAR(10),pNuevoNombre VARCHAR(50), pNuevoApe VARCHAR(50),pNuevoNum VARCHAR(8),pNewCorreo VARCHAR(30),
	pNuevoPuesto VARCHAR(20), pNuevaCuenta VARCHAR(17),pNuevoBanco VARCHAR(17)
)
BEGIN
	CALL uspVerIdPuesto(IFNULL(pNuevoPuesto,pPuesto),@newPuesto);
	CALL uspVerIdBanco(IFNULL(pNuevoBanco,pBanco),@banco);

	UPDATE `personal`
	SET `cedula`=IFNULL(pNuevaCed,pCedula),
		`nombre`=IFNULL(pNuevoNombre,pNombre),
	 	`apellidos`=IFNULL(pNuevoApe,pApellidos),
	 	`numeroTelefono`=IFNULL(pNuevoNum,pNumeroTelefonico),
	 	`correo`=IFNULL(pNewCorreo,pCorreo),
	 	`idPuesto`=@newPuesto,
	 	`cuentaBancaria`=IFNULL(pNuevaCuenta,pCuentaBancaria),
	 	`idBanco`=@banco
	WHERE `cedula`=pCedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarPuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarPuesto`(
	pPuesto VARCHAR(20),
	pNuevoNombre VARCHAR(20)
)
BEGIN
	UPDATE `puestos`
	SET `puesto`=pNuevoNombre
	WHERE LOWER(`puesto`)=LOWER(pPuesto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarTipo`(
	pTipo VARCHAR(25),
	pNuevoNombre VARCHAR(25)
)
BEGIN
	UPDATE `tipoVehiculos`
	SET `tipoVehiculo`=pNuevoNombre
	WHERE LOWER(`tipoVehiculo`)=LOWER(pTipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspActualizarVehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarVehiculo`(
	pPlaca VARCHAR(6),
	pMarca VARCHAR(100),
	pTipoVehiculo VARCHAR(25),
	pCampos INT,
    pMantenimiento TINYINT(1),
	pChofer VARCHAR(10)
)
BEGIN
	CALL uspVerIdMarca(pMarca,@marca);
	CALL uspVerIdTipo(pTipoVehiculo,@tipo);

	UPDATE `flotilla`
	SET `idVehiculo`=pPlaca,
		`idMarca`=@marca,
	 	`idTipoVehiculo`=@tipo,
	 	`campos`=pCampos,
        `enMantenimiento`=pMantenimiento,
        `chofer`=pChofer
	WHERE `idVehiculo`=pPlaca;
    
    CALL uspBorrarServiciosXVehiculo(pPlaca);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspAumentarCampos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspAumentarCampos`(
	pIdReservacion INT
)
BEGIN
	SET @destino=(SELECT r.idExcursion FROM reservaciones r WHERE r.idReservacion=pIdReservacion);
	CALL uspVerCamposReservados(pIdReservacion,@campos);

	UPDATE `excursiones`
	SET `cuposDisponibles`=(`cuposDisponibles`+@campos)
	WHERE `idExcursion`=@destino;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarCategorias`(
	pCategoria VARCHAR(50)
)
BEGIN
	DELETE FROM `categorias`
	WHERE LOWER(`categoria`)=LOWER(pCategoria);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarDestino`(
	pDestino VARCHAR(100)
)
BEGIN
	DELETE FROM `destinosTuristicos`
	WHERE LOWER(`nombreDestino`)=LOWER(pDestino);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarExcursion`(
	pExcursion VARCHAR(100)
)
BEGIN
	DELETE FROM `excursiones`
	WHERE nombreExcursion=pExcursion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarImagen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarImagen`(
	pUrl VARCHAR(300)
)
BEGIN
	DELETE FROM `imagenesDestinos`
	WHERE `url`=pUrl;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarMarca`(
	pMarca VARCHAR(25)
)
BEGIN
	DELETE FROM `marcasVehiculos`
	WHERE LOWER(`marca`)=LOWER(pMarca);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarPersona`(
	pCedula VARCHAR(10)
)
BEGIN
	DELETE FROM `personal`
	WHERE cedula=pCedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarPuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarPuesto`(
	pPuesto VARCHAR(20)
)
BEGIN
	DELETE FROM `puestos`
	WHERE LOWER(`puesto`)=LOWER(pPuesto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarServiciosXExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarServiciosXExcursion`(
	pExcursion INT
)
BEGIN
	DELETE FROM serviciosxexcursion WHERE idExcursion=pExcursion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarServiciosXVehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarServiciosXVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
	DELETE FROM servicioxvehiculo WHERE idVehiculo=pPlaca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarTipo`(
	pTipo VARCHAR(25)
)
BEGIN
	DELETE FROM `tipoVehiculos`
	WHERE LOWER(`tipoVehiculo`)=LOWER(pTipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarVehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
    CALL uspBorrarServiciosXVehiculo(pPlaca);
    CALL uspBorrarVehiculoExcursion(pPlaca);
    
	DELETE FROM `flotilla`
	WHERE idVehiculo=pPlaca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspBorrarVehiculoExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarVehiculoExcursion`(
	pPlaca VARCHAR(6)
)
BEGIN
	DELETE FROM `flotillaxexcursion`
	WHERE idVehiculo=pPlaca;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspCancelarReservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCancelarReservacion`(
	pIdReservacion INT
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Reservacion ya cancelada';
    
    IF EXISTS(
			SELECT r.cancelado
            FROM reservaciones r
            WHERE pIdReservacion=r.idReservacion AND
				  r.cancelado=1
		)
		THEN
			SIGNAL msgError;
	ELSE
		UPDATE reservaciones
		SET cancelado=1
		WHERE idReservacion=pIdReservacion;
		
		CALL uspAumentarCampos(pIdReservacion);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarBanco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarBanco`(
	pBanco VARCHAR(20)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Banco en el sistema';

	IF NOT EXISTS(
			SELECT b.banco
			FROM bancos b
			WHERE b.banco=pBanco
		)
		THEN
			INSERT INTO bancos(banco) VALUES(pBanco);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarCategorias`(
	pCategoria VARCHAR(50)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Categoria en el sistema';

	IF NOT EXISTS(
			SELECT c.categoria
			FROM categorias c
			WHERE c.categoria=pCategoria
		)
		THEN
			INSERT INTO categorias(categoria) VALUES(pCategoria);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarComentario`(
	pDestino VARCHAR(50),
	pComentario VARCHAR(280)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	INSERT INTO comentariosDestino(idDestino,comentario) 
	VALUES(@result,pComentario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarDestino`(
	pNombre VARCHAR(100),
	pLugar VARCHAR(100),
	pCategoria VARCHAR(50),
	pDescripcion VARCHAR(250)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Destino en el sistema';

	CALL uspVerIdCategoria(pCategoria,@result);

	IF NOT EXISTS(
			SELECT dt.nombreDestino
			FROM destinosTuristicos dt
			WHERE dt.nombreDestino=pNombre
		)
		THEN
			INSERT INTO destinosTuristicos(nombreDestino,lugar,idCategoria,descripcion) 
			VALUES(pNombre,pLugar,@result,pDescripcion);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarExcursion`(
	pDestino VARCHAR(100),pFechaHora VARCHAR(20),pLugar VARCHAR(100),pCupos INT,pPrecioA INT,pPrecioAM INT,
	pPrecioNino INT, pGuia VARCHAR(10),pLugar2 VARCHAR(100),pLugar3 VARCHAR(100),pNombre VARCHAR(100),
    pFechaPrimerPago VARCHAR(20), pFechaLimite VARCHAR(20),pCuentaBancaria VARCHAR(100),pPlaca VARCHAR(6)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Verifique los datos';

	SET @puesto=(SELECT p.puesto
				 FROM puestos p INNER JOIN
					  personal pe ON(p.idPuesto=pe.idPuesto)
				 WHERE pe.cedula=pGuia);
                 
	CALL uspVerIdExcursion(pNombre,@excursion);
    
    IF (LOWER(@puesto)='guia') THEN
		CALL uspVerIdDestino(pDestino,@destino);
		INSERT INTO excursiones(idDestino,fechaHoraSalida,lugarSalida,cupos,cuposDisponibles,precioAdulto,
								precioAdultoM,precioNino,guia,lugarSalida2,lugarSalida3,nombreExcursion,fechaPrimerPago,fechaLimite,cuentaBancaria) 
		VALUES(@destino,pFechaHora,pLugar,pCupos,pCupos,pPrecioA,pPrecioAM,pPrecioNino,pGuia,pLugar2,pLugar3,pNombre,pFechaPrimerPago,pFechaLimite,pCuentaBancaria);
        
        CALL uspInsertarVehiculoXExcursion(pPlaca,LAST_INSERT_ID());
	ELSE
		SIGNAL msgError;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarImagenDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarImagenDestino`(
	pDestino VARCHAR(100),
    pUrl VARCHAR(300)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Imagen en el sistema';

	CALL uspVerIdDestino(pDestino,@result);

	IF NOT EXISTS(
			SELECT id.idImagen
			FROM imagenesdestinos id
			WHERE id.url=pUrl AND idDestino=@result
		)
		THEN
			INSERT INTO imagenesdestinos(url,idDestino) 
			VALUES(pUrl,@result);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarMarca`(
	pMarca VARCHAR(25)
)
BEGIN
	INSERT INTO marcasVehiculos(marca) 
	VALUES(pMarca);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarPersona`(
	pCedula VARCHAR(10),
	pNombre VARCHAR(50),
	pApellidos VARCHAR(50),
	pNumeroTelefonico VARCHAR(8),
	pCorreo VARCHAR(30),
	pPuesto VARCHAR(20),
	pCuentaBancaria VARCHAR(17),
	pBanco VARCHAR(20)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Puesto en el sistema';

	CALL uspVerIdPuesto(pPuesto,@result);
	CALL uspVerIdBanco(pBanco,@banco);

	IF NOT EXISTS(
			SELECT p.cedula
			FROM personal p
			WHERE p.cedula=pCedula
		)
		THEN
			INSERT INTO personal(cedula,nombre,apellidos,numeroTelefono,correo,idPuesto,cuentaBancaria,idBanco)
			VALUES(pCedula,pNombre,pApellidos,pNumeroTelefonico,pCorreo,@result,pCuentaBancaria,@banco);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarPuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarPuesto`(
	pPuesto VARCHAR(20)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Puesto en el sistema';

	IF NOT EXISTS(
			SELECT p.puesto
			FROM puestos p
			WHERE p.puesto=pPuesto
		)
		THEN
			INSERT INTO puestos(puesto) VALUES(pPuesto);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarReservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarReservacion`(
	pNombre VARCHAR(50), pApellidos VARCHAR(50), pNumeroTelefonico VARCHAR(8),
	pCampos INT, pDestino VARCHAR(100)
)
BEGIN
	CALL uspVerIdExcursion(pDestino,@destino);

	INSERT INTO reservaciones(nombre,apellidos,numeroTelefono,camposReservados,idExcursion,primerPago,pagado,cancelado) 
	VALUES(pNombre,pApellidos,pNumeroTelefonico,pCampos,@destino,0,0,0);
	
    CALL uspRestarCampos(pDestino,pCampos);
    
	SELECT LAST_INSERT_ID() AS idReservacion;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarServicio`(
	pServicio VARCHAR(100)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Servicio en el sistema';

	IF NOT EXISTS(
			SELECT s.servicio
			FROM servicios s
			WHERE s.servicio=pServicio
		)
		THEN
			INSERT INTO servicios(servicio) VALUES(pServicio);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarServicioD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarServicioD`(
	pServicio VARCHAR(100)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Servicio en el sistema';

	IF NOT EXISTS(
			SELECT s.servicio
			FROM serviciosDestinos s
			WHERE s.servicio=pServicio
		)
		THEN
			INSERT INTO serviciosDestinos(servicio) VALUES(pServicio);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarServicioXDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarServicioXDestino`(
	pServicio VARCHAR(100),
	pDestino VARCHAR(100)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Servicio en el sistema';

	CALL uspVerIdServicioD(pServicio,@servicio);
	CALL uspVerIdDestino(pDestino,@destino);

	IF NOT EXISTS(
			SELECT s.idServicioIncluido
			FROM serviciosIncluidos s
			WHERE s.idServicio=@servicio AND
				  s.idDestino=@destino
		)
		THEN
			INSERT INTO idServicioIncluido(idServicio,idDestino) VALUES(@servicio,@destino);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarServicioXExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarServicioXExcursion`(
	pServicio VARCHAR(100),
	pExcursion VARCHAR(100) -- Nombre de la excursion
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Servicio en el sistema';

	CALL uspVerIdServicioD(pServicio,@servicio);
	CALL uspVerIdExcursion(pExcursion,@excursion);

	IF NOT EXISTS(
			SELECT s.idServicioExcursion
			FROM serviciosXexcursion s
			WHERE s.idServicio=@servicio AND
				  s.idExcursion=@excursion
		)
		THEN
			INSERT INTO serviciosXexcursion(idServicio,idExcursion) VALUES(@servicio,@excursion);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarServicioXVehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarServicioXVehiculo`(
	pServicio VARCHAR(100),
	pPlaca VARCHAR(6)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Servicio en el sistema';

	CALL uspVerIdServicio(pServicio,@servicio);

	IF NOT EXISTS(
			SELECT s.idServicioVehiculo
			FROM servicioXvehiculo s
			WHERE s.idServicioVehiculo=@servicio AND
				  s.idVehiculo=pPlaca
		)
		THEN
			INSERT INTO servicioXvehiculo(idVehiculo,idServicio) VALUES(pPlaca,@servicio);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarTipo`(
	pTipo VARCHAR(25)
)
BEGIN
	INSERT INTO tipoVehiculos(tipoVehiculo) 
	VALUES(pTipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarVehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarVehiculo`(
	pPlaca VARCHAR(6),
	pMarca VARCHAR(100),
	pTipoVehiculo VARCHAR(25),
	pCampos INT,
    pMantenimiento TINYINT(1),
	pChofer VARCHAR(10)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Vehiculo en el sistema';

	CALL uspVerIdMarca(pMarca,@marca);
	CALL uspVerIdTipo(pTipoVehiculo,@tipo);

	IF NOT EXISTS(
			SELECT f.idVehiculo
			FROM flotilla f
			WHERE f.idVehiculo=pPlaca
		)
		THEN
			INSERT INTO flotilla(idVehiculo,idMarca,idTipoVehiculo,campos,enMantenimiento,chofer) 
			VALUES(pPlaca,@marca,@tipo,pCampos,pMantenimiento,pChofer);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspInsertarVehiculoXExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarVehiculoXExcursion`(
	pPlaca VARCHAR(6),
	pIdExcursion INT
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Vehiculo ya asignado a la excursion';

	IF NOT EXISTS(
			SELECT fe.idFxE
			FROM flotillaXexcursion fe
			WHERE fe.idVehiculo=pPlaca AND
				  fe.idExcursion=pIdExcursion
		)
		THEN
			INSERT INTO flotillaXexcursion(idExcursion,idVehiculo) 
			VALUES(pIdExcursion,pPlaca);
	ELSE
		SIGNAL msgError;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListarParticipantes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListarParticipantes`()
BEGIN
	SELECT e.nombreExcursion,CONCAT(r.nombre,' ',r.apellidos) AS nombre,r.numeroTelefono,r.camposReservados
	FROM reservaciones r INNER JOIN
		 excursiones e ON (r.idExcursion=e.idExcursion)
	WHERE r.primerPago=1 AND
		  r.pagado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspListarReservaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListarReservaciones`(
	pExcursion VARCHAR(100)
)
BEGIN
	SELECT e.nombreExcursion,CONCAT(r.nombre,' ',r.apellidos) AS nombre,r.numeroTelefono,r.camposReservados
	FROM reservaciones r INNER JOIN
		 excursiones e ON (r.idExcursion=e.idExcursion)
	WHERE r.primerPago=1 AND
		  r.pagado=1 AND
          e.nombreExcursion=IFNULL(pExcursion,e.nombreExcursion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspPonerEnMantenimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspPonerEnMantenimiento`(
	pPlaca VARCHAR(6)
)
BEGIN
	UPDATE flotilla
    SET enMantenimiento=1
    WHERE pPlaca=idVehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspPrimerPagoHecho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspPrimerPagoHecho`(
	pIdReservacion INT,
    pUrl VARCHAR(300)
)
BEGIN
	IF NOT EXISTS(
		SELECT r.urlPago1
        FROM reservaciones r
        WHERE r.idReservacion=pIdReservacion
    )
		THEN
			UPDATE `reservaciones`
			SET `primerPago`=1
			WHERE `idReservacion`=pIdReservacion;
            
            INSERT INTO reservaciones(urlPago1) VALUES(pUrl);
    ELSE
		CALL uspSegundoPagoHecho(pIdReservacion,pUrl);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspRestarCampos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspRestarCampos`(
	pDestino VARCHAR(100),
	pCampos INT
)
BEGIN
	CALL uspVerIdExcursion(pDestino,@destino);

	UPDATE `excursiones`
	SET `cuposDisponibles`=(`cuposDisponibles`-pCampos)
	WHERE `idExcursion`=@destino;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspSacarDeMantenimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSacarDeMantenimiento`(
	pPlaca VARCHAR(6)
)
BEGIN
	UPDATE flotilla
    SET enMantenimiento=0
    WHERE pPlaca=idVehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspSegundoPagoHecho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSegundoPagoHecho`(
	pIdReservacion INT,
    pUrl VARCHAR(300)
)
BEGIN
	UPDATE `reservaciones`
	SET `pagado`=1
	WHERE `idReservacion`=pIdReservacion;
    
    INSERT INTO reservaciones(urlPago2) VALUES(pUrl);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerBanco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerBanco`(
	pIdBanco INT,
	OUT pSBanco VARCHAR(20)
)
BEGIN
	SELECT b.banco INTO pSBanco
	FROM bancos b
	WHERE b.idBanco=pIdBanco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerBancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerBancos`()
BEGIN
	SELECT b.banco
	FROM bancos b;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerCamposReservados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerCamposReservados`(
	pIdReservacion INT,
	OUT pSCampos INT
)
BEGIN
	SELECT r.camposReservados INTO pSCampos
	FROM reservaciones r
	WHERE r.idReservacion=pIdReservacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerCategoria`(
	pIdCategoria INT,
	OUT pSCategoria VARCHAR(50)
)
BEGIN
	SELECT c.categoria INTO pSCategoria
	FROM categorias c
	WHERE c.idCategoria=pIdCategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerCategorias`()
BEGIN
	SELECT c.categoria
	FROM categorias c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerChoferes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerChoferes`()
BEGIN
	SELECT p.cedula,CONCAT(p.nombre,' ',p.apellidos) AS nombre
    FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto)
	WHERE LOWER(pu.puesto)=LOWER('Chofer');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerComentarioDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerComentarioDestino`(
	pDestino VARCHAR(50)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	SELECT c.comentario
	FROM comentariosDestino c
	WHERE c.idDestino=@result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerDestino`(
	pIdDestino INT,
	OUT pSDestino VARCHAR(100)
)
BEGIN
	SELECT dt.nombreDestino INTO pSDestino
	FROM destinosTuristicos dt
	WHERE dt.idDestino=pIdDestino;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerDestinos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerDestinos`()
BEGIN
	SELECT dt.nombreDestino
	FROM destinosTuristicos dt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerExcursion`(
	pNombre VARCHAR(100)
)
BEGIN
	SELECT e.NombreExcursion,dt.nombreDestino,e.fechaHoraSalida,e.lugarSalida,e.lugarSalida2,e.lugarSalida3,e.cuposDisponibles,e.precioAdulto,
		   e.precioAdultoM,e.precioNino,CONCAT(p.nombre,' ',p.apellidos) as 'guia',p.correo,e.cuentaBancaria,e.fechaPrimerPago,e.fechaLimite,fxe.idVehiculo,c.categoria
	FROM excursiones e INNER JOIN
		 destinosTuristicos dt ON(e.idDestino=dt.idDestino) INNER JOIN
		 personal p ON(e.guia=p.cedula) INNER JOIN
         flotillaxexcursion fxe ON(fxe.idExcursion=e.idExcursion) INNER JOIN
         categorias c ON(c.idCategoria=dt.idCategoria)
	WHERE e.nombreExcursion=pNombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerExcursiones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerExcursiones`()
BEGIN
	SELECT e.NombreExcursion,dt.nombreDestino,e.fechaHoraSalida,e.cuposDisponibles
	FROM excursiones e INNER JOIN
		 destinosTuristicos dt ON(e.idDestino=dt.idDestino) INNER JOIN
		 personal p ON(e.guia=p.cedula);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerExcursionesCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerExcursionesCliente`()
BEGIN
	SELECT DISTINCT e.NombreExcursion,dt.nombreDestino,e.fechaHoraSalida,e.cuposDisponibles,i.url
	FROM excursiones e INNER JOIN
		 destinosTuristicos dt ON(e.idDestino=dt.idDestino) INNER JOIN
		 personal p ON(e.guia=p.cedula) INNER JOIN
         imagenesdestinos i ON(dt.idDestino=i.idDestino)
	GROUP BY e.NombreExcursion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerGuias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerGuias`()
BEGIN
	SELECT p.cedula,CONCAT(p.nombre,' ',p.apellidos) AS nombre
    FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto)
	WHERE LOWER(pu.puesto)='guia';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdBanco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdBanco`(
	pBanco VARCHAR(20),
	OUT pSBanco INT
)
BEGIN
	SELECT b.idBanco INTO pSBanco
	FROM bancos b
	WHERE b.banco=pBanco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdCategoria`(
	pCategoria VARCHAR(50),
	OUT pSCategoria INT
)
BEGIN
	SELECT c.idCategoria INTO pSCategoria
	FROM categorias c
	WHERE c.categoria=pCategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdDestino`(
	pDestino VARCHAR(100),
	OUT pSDestino INT
)
BEGIN
	SELECT dt.idDestino INTO pSDestino
	FROM destinosturisticos dt
	WHERE dt.nombreDestino=pDestino;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdExcursion`(
    pNombre VARCHAR(100),
	OUT pSExcursion INT
)
BEGIN
	SELECT e.idExcursion INTO pSExcursion
    FROM excursiones e
    WHERE e.nombreExcursion=pNombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdMarca`(
	pMarca VARCHAR(25),
	OUT pSMarca INT
)
BEGIN
	SELECT m.idMarca INTO pSMarca
	FROM marcasVehiculos m
	WHERE m.marca=pMarca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdPersona`(
	pNombre VARCHAR(50),
	pApellidos VARCHAR(50),
	pNumeroTelefonico VARCHAR(8)
)
BEGIN
	SELECT p.cedula, p.nombre, p.apellidos, p.numeroTelefono, p.correo, pu.puesto 
	FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto)
	WHERE p.nombre=pNombre AND
		  p.apellidos=pApellidos AND
		  p.numeroTelefono=pNumeroTelefonico;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdPuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdPuesto`(
	pPuesto VARCHAR(20),
	OUT pSPuesto INT
)
BEGIN
	SELECT p.idPuesto INTO pSPuesto
	FROM puestos p
	WHERE p.puesto=pPuesto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdServicio`(
	pServicio VARCHAR(100),
	OUT pSServicio INT
)
BEGIN
	SELECT s.idServicio INTO pSServicio
	FROM servicios s
	WHERE s.servicio=pServicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdServicioD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdServicioD`(
	pServicio VARCHAR(100),
	OUT pSServicio INT
)
BEGIN
	SELECT s.idServicio INTO pSServicio
	FROM serviciosDestinos s
	WHERE s.servicio=pServicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerIdTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdTipo`(
	pTipo VARCHAR(25),
	OUT pSTipo INT
)
BEGIN
	SELECT t.idTipoVehiculo INTO pSTipo
	FROM tipoVehiculos t
	WHERE t.tipoVehiculo=pTipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerImagenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerImagenes`()
BEGIN
	SELECT id.url,d.nombreDestino
	FROM imagenesdestinos id INNER JOIN
		 destinosturisticos d ON(id.idDestino=d.idDestino);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerImagenesDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerImagenesDestino`(
	pDestino VARCHAR(50)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	SELECT i.url
	FROM imagenesDestinos i
	WHERE i.idDestino=@result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerInfoDestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerInfoDestino`(
	pDestino VARCHAR(100)
)
BEGIN
	SELECT dt.nombreDestino, dt.lugar, c.categoria, dt.descripcion
	FROM destinosTuristicos dt INNER JOIN
		 categorias c ON(dt.idCategoria=c.idCategoria)
	WHERE dt.nombreDestino=pDestino;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerInfoDestinos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerInfoDestinos`()
BEGIN
	SELECT dt.nombreDestino, c.categoria
	FROM destinosTuristicos dt INNER JOIN
		 categorias c ON (dt.idCategoria=c.idCategoria);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerMarca`(
	pIdMarca INT,
	OUT pSMarca VARCHAR(25)
)
BEGIN
	SELECT m.marca INTO pSMarca
	FROM marcasVehiculos m
	WHERE m.idMarca=pIdMarca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerMarcas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerMarcas`()
BEGIN
	SELECT m.marca
	FROM marcasVehiculos m;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerPersonas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPersonas`()
BEGIN
	SELECT p.cedula, p.nombre, p.apellidos, p.numeroTelefono, p.correo, pu.puesto 
	FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerPlacas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPlacas`()
BEGIN
	SELECT v.idVehiculo, v.campos
	FROM flotilla v INNER JOIN
		 marcasVehiculos m ON(v.idMarca=m.idMarca) INNER JOIN
		 personal p ON(p.cedula=v.chofer) INNER JOIN
		 tipoVehiculos t ON(t.idTipoVehiculo=v.idTipoVehiculo)
	WHERE v.enMantenimiento=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerPuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPuesto`(
	pIdPuesto INT,
	OUT pSPuesto VARCHAR(20)
)
BEGIN
	SELECT p.puesto INTO pSPuesto
	FROM puestos p
	WHERE p.idPuesto=pIdPuesto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerPuestos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPuestos`()
BEGIN
	SELECT p.puesto
	FROM puestos p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServicio`(
	pIdServicio INT,
	OUT pSServicio VARCHAR(100)
)
BEGIN
	SELECT s.servicio INTO pSServicio
	FROM servicios s
	WHERE s.idServicio=pIdServicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerServicioD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServicioD`(
	pIdServicio INT,
	OUT pSServicio VARCHAR(100)
)
BEGIN
	SELECT s.servicio INTO pSServicio
	FROM serviciosdestinos s
	WHERE s.idServicio=pIdServicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerServicios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServicios`()
BEGIN
	SELECT s.servicio
	FROM servicios s;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerServiciosD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosD`()
BEGIN
	SELECT s.servicio
	FROM serviciosdestinos s;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerServiciosXExcursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosXExcursion`(
	pExcursion VARCHAR(100)
)
BEGIN
	CALL uspVerIdExcursion(pExcursion,@excursion);

	SELECT sd.servicio
	FROM serviciosXexcursion s INNER JOIN
		 serviciosdestinos sd ON (s.idServicio=sd.Idservicio)
	WHERE s.idExcursion=@excursion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerServiciosXVehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosXVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
	SELECT s.servicio
    FROM servicios s INNER JOIN
		 servicioXVehiculo sv ON(s.idServicio=sv.idServicio)
	WHERE sv.idVehiculo=pPlaca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerServiciosXVehiculos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosXVehiculos`()
BEGIN
	SELECT sv.idVehiculo, s.servicio
	FROM servicioxvehiculo sv INNER JOIN
		 servicios s ON(sv.idServicio=s.idServicio)
	ORDER BY(sv.idVehiculo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerTipo`(
	pIdTipo INT,
	OUT pSTipo VARCHAR(25)
)
BEGIN
	SELECT t.tipoVehiculo INTO pSTipo
	FROM tipoVehiculos t
	WHERE t.idTipoVehiculo=pIdTipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerTiposVehiculos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerTiposVehiculos`()
BEGIN
	SELECT t.tipoVehiculo
	FROM tipoVehiculos t;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerVehiculo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
	SELECT v.idVehiculo as placa,m.marca,t.tipoVehiculo,v.campos,v.enMantenimiento,CONCAT(p.nombre,' ',p.apellidos) AS 'chofer'
	FROM flotilla v INNER JOIN
		 marcasVehiculos m ON(v.idMarca=m.idMarca) INNER JOIN
		 personal p ON(p.cedula=v.chofer) INNER JOIN
		 tipoVehiculos t ON(t.idTipoVehiculo=v.idTipoVehiculo)
	WHERE v.idVehiculo=pPlaca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspVerVehiculos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerVehiculos`()
BEGIN
	SELECT v.idVehiculo AS 'placa',m.marca,CONCAT(p.nombre,' ',p.apellidos) AS 'chofer'
	FROM flotilla v INNER JOIN
		 marcasVehiculos m ON(v.idMarca=m.idMarca) INNER JOIN
		 personal p ON(p.cedula=v.chofer) INNER JOIN
		 tipoVehiculos t ON(t.idTipoVehiculo=v.idTipoVehiculo)
	WHERE v.enMantenimiento=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verEstadoReservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `verEstadoReservacion`(In pCodigo TINYINT(1))
BEGIN
	SELECT r.Cancelado
    FROM reservaciones r
    WHERE r.idReservacion = pCodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22 15:54:29
