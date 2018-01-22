CREATE DATABASE `servicioexcursiones` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `bancos` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT,
  `banco` varchar(20) NOT NULL,
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `comentariosdestino` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `idDestino` int(11) NOT NULL,
  `comentario` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idDestino` (`idDestino`),
  CONSTRAINT `comentariosdestino_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `destinosturisticos` (
  `idDestino` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDestino` varchar(100) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`idDestino`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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

CREATE TABLE `imagenesdestinos` (
  `idImagen` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(300) NOT NULL,
  `idDestino` int(11) NOT NULL,
  PRIMARY KEY (`idImagen`),
  KEY `idDestino` (`idDestino`),
  CONSTRAINT `imagenesdestinos_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destinosturisticos` (`idDestino`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE `marcasvehiculos` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(25) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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

CREATE TABLE `puestos` (
  `idPuesto` int(11) NOT NULL AUTO_INCREMENT,
  `puesto` varchar(20) NOT NULL,
  PRIMARY KEY (`idPuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`idReservacion`),
  KEY `idExcursion` (`idExcursion`),
  CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`idExcursion`) REFERENCES `excursiones` (`idExcursion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `serviciosdestinos` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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

CREATE TABLE `tipovehiculos` (
  `idTipoVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `tipoVehiculo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTipoVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
