-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: servicioexcursiones
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Playa');
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
  `persona` varchar(150) DEFAULT NULL,
  `comentario` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idDestino` (`idDestino`),
  CONSTRAINT `comentariosdestino_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentariosdestino`
--

LOCK TABLES `comentariosdestino` WRITE;
/*!40000 ALTER TABLE `comentariosdestino` DISABLE KEYS */;
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
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `destinosturisticos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinosturisticos`
--

LOCK TABLES `destinosturisticos` WRITE;
/*!40000 ALTER TABLE `destinosturisticos` DISABLE KEYS */;
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
  `fechaSalida` date NOT NULL,
  `lugarSalida` varchar(100) DEFAULT NULL,
  `horaSalida` time DEFAULT NULL,
  `cupos` int(11) NOT NULL,
  `cuposDisponibles` int(11) NOT NULL,
  `precioAdulto` int(11) NOT NULL,
  `precioAdultoM` int(11) NOT NULL,
  `precioNino` int(11) NOT NULL,
  `guia` varchar(10) NOT NULL,
  PRIMARY KEY (`idExcursion`),
  KEY `idDestino` (`idDestino`),
  KEY `guia` (`guia`),
  CONSTRAINT `excursiones_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`),
  CONSTRAINT `excursiones_ibfk_2` FOREIGN KEY (`guia`) REFERENCES `personal` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursiones`
--

LOCK TABLES `excursiones` WRITE;
/*!40000 ALTER TABLE `excursiones` DISABLE KEYS */;
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
  CONSTRAINT `flotillaxexcursion_ibfk_1` FOREIGN KEY (`idExcursion`) REFERENCES `excursiones` (`idExcursion`),
  CONSTRAINT `flotillaxexcursion_ibfk_2` FOREIGN KEY (`idVehiculo`) REFERENCES `flotilla` (`idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flotillaxexcursion`
--

LOCK TABLES `flotillaxexcursion` WRITE;
/*!40000 ALTER TABLE `flotillaxexcursion` DISABLE KEYS */;
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
  CONSTRAINT `imagenesdestinos_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesdestinos`
--

LOCK TABLES `imagenesdestinos` WRITE;
/*!40000 ALTER TABLE `imagenesdestinos` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcasvehiculos`
--

LOCK TABLES `marcasvehiculos` WRITE;
/*!40000 ALTER TABLE `marcasvehiculos` DISABLE KEYS */;
INSERT INTO `marcasvehiculos` VALUES (1,'Toyota');
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
  `cuentaBancaria` varchar(17) NOT NULL,
  `idBanco` int(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `idPuesto` (`idPuesto`),
  KEY `idBanco` (`idBanco`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idPuesto`),
  CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `bancos` (`idBanco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES ('123','Geova','Villa','22231516','Giova@hotmail.com',1,'6546549684',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Chofer');
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
  `fechaPrimerPago` date NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `fechaLimite` date NOT NULL,
  `cancelado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idReservacion`),
  KEY `idExcursion` (`idExcursion`),
  CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`idExcursion`) REFERENCES `excursiones` (`idExcursion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviciosincluidos`
--

DROP TABLE IF EXISTS `serviciosincluidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviciosincluidos` (
  `idServicioIncluido` int(11) NOT NULL AUTO_INCREMENT,
  `idServicio` int(11) NOT NULL,
  `idDestino` int(11) NOT NULL,
  PRIMARY KEY (`idServicioIncluido`),
  KEY `idServicio` (`idServicio`),
  KEY `idDestino` (`idDestino`),
  CONSTRAINT `serviciosincluidos_ibfk_1` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`),
  CONSTRAINT `serviciosincluidos_ibfk_2` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciosincluidos`
--

LOCK TABLES `serviciosincluidos` WRITE;
/*!40000 ALTER TABLE `serviciosincluidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `serviciosincluidos` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicioxvehiculo`
--

LOCK TABLES `servicioxvehiculo` WRITE;
/*!40000 ALTER TABLE `servicioxvehiculo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipovehiculos`
--

LOCK TABLES `tipovehiculos` WRITE;
/*!40000 ALTER TABLE `tipovehiculos` DISABLE KEYS */;
INSERT INTO `tipovehiculos` VALUES (1,'Microbus');
/*!40000 ALTER TABLE `tipovehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-20 11:35:21
