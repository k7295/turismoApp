SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE SCHEMA IF NOT EXISTS `servicioExcursiones` DEFAULT CHARACTER SET utf8 ;
USE `servicioExcursiones` ;

---------------Tabla agregada en actualizacion 2--------------
CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`categorias`(
	`idCategoria` INT NOT NULL AUTO_INCREMENT,
	`categoria` VARCHAR(50),
)
ENGINE = InnoDB;

-------------------Se añade la columna descripcion--------------------
CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`destinosTuristicos`(
	`idDestino` INT NOT NULL AUTO_INCREMENT,
	`nombreDestino` VARCHAR(100) NOT NULL,
	`idCategoria` INT NOT NULL,
	`descripcion` VARCHAR(250) NOT NULL,
	PRIMARY KEY(`idDestino`),
	FOREIGN KEY(`idCategoria`) REFERENCES `destinosTuristicos`(`idCategoria`)
)
ENGINE = InnoDB;

--Se cambia el nombre de caracteristicasDestino a comentariosDestino--
-----Se cambia de nombre la columna caracteristica por comentario-----
----Se añade la columna persona para saber quien hizo el comentario---
CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`comentariosDestino`(
	`idCaracteristica` INT NOT NULL AUTO_INCREMENT,
	`idDestino` INT NOT NULL,
	`persona` VARCHAR(150),
	`comentario` VARCHAR(150),
	PRIMARY KEY(`idCaracteristica`),
	FOREIGN KEY(`idDestino`) REFERENCES `destinosTuristicos`(`idDestino`)
)
ENGINE = InnoDB;

-----------------Tabla agregada en actualizacion 2------------------
CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`imagenesDestinOs`(
	`idImagen` INT NOT NULL AUTO_INCREMENT,
	`url` VARCHAR(100) NOT NULL,
	`idDestino` INT NOT NULL,
	PRIMARY KEY(),
	FOREIGN KEY(`idDestino`) REFERENCES `destinosTuristicos`(`idDestino`)
)
ENGINE = InnoDB;

------------------PUEDEN SER ELIMINADAS----------------------------

CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`marcasVehiculos`(
	`idMarca` INT NOT NULL AUTO_INCREMENT,
	`marca` VARCHAR(25) NOT NULL,
	PRIMARY KEY(`idMarca`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`tipoVehiculos`(
	`idTipoVehiculo` INT NOT NULL AUTO_INCREMENT,
	`tipoVehiculo` VARCHAR(25),--Bus/Buseta/etc
	PRIMARY KEY(`idTipoVehiculo`)
)
ENGINE = InnoDB;
--------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`flotilla`(
	`idVehiculo` VARCHAR(6) NOT NULL, --LA PLACA DE LA BUSETA/BUS
	`idMarca` INT NOT NULL,
	`idTipoVehiculo` INT NOT NULL,
	`campos` INT NOT NULL,
	`enMantenimiento` TINYINT(1), --VALOR BOOLEANO PARA SABER SI PUEDE USARSE O NO
	PRIMARY KEY(`idVehiculo`),
	FOREIGN KEY(`idMarca`) REFERENCES `marcasVehiculos`(`idMarca`),
	FOREIGN KEY(`idTipoVehiculo`) REFERENCES `tipoVehiculos`(`idTipoVehiculo`)
)
ENGINE = InnoDB;

--------------Se añade columna de lugar de salida--------------
CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`excursiones`(
	`idExcursion` INT NOT NULL AUTO_INCREMENT,
	`idDestino` INT NOT NULL,
	`fechaSalida` DATE NOT NULL, --FORMATO: YYYY-MM-DD
	`lugarSalida` VARCHAR(100),
	`cupos` INT NOT NULL,
	`cuposDisponibles` INT NOT NULL, --SE QUEDA?--
	`precio` INT NOT NULL,
	PRIMARY KEY(`idExcursion`),
	FOREIGN KEY(`idDestino`) REFERENCES `destinosTuristicos`(`idDestino`)
)
ENGINE = InnoDB;

------------------Tabla agregada en actualizacion 2-------------------
CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`servicios`(
	`idServicio` INT NOT NULL AUTO_INCREMENT,
	`servicio` VARCHAR(100) NOT NULL,
	PRIMARY KEY(`idServicio`)
)
ENGINE = InnoDB;

------------------Tabla agregada en actualizacion 2-------------------
CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`serviciosIncluidos`(
	`idServicioIncluido` INT NOT NULL AUTO_INCREMENT,
	`idServicio` INT NOT NULL,
	`idExcursion` INT NOT NULL,
	PRIMARY KEY(`idServicioIncluido`),
	FOREIGN KEY(`idServicio`) REFERENCES `servicios`(`idServicio`),
	FOREIGN KEY(`idExcursion`) REFERENCES `excursiones`(`idExcursion`)
)
ENGINE = InnoDB;

------------------PUEDEN SER ELIMINADAS----------------------------

CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`flotillaXexcursion`(
	`idFxE` INT NOT NULL AUTO_INCREMENT,
	`idExcursion` INT NOT NULL,
	`idVehiculo` INT NOT NULL,
	PRIMARY KEY(`idFxE`),
	FOREIGN KEY(`idExcursion`) REFERENCES `excursiones`(`idExcursion`),
	FOREIGN KEY(`idVehiculo`) REFERENCES `flotilla`(`idVehiculo`)
)
ENGINE = InnoDB;

---TABLA DE INFORMACION DE PAGO???--

-------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `servicioExcursiones`.`reservaciones`(
	`idReservacion` INT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(50) NOT NULL,
	`apellidos` VARCHAR(50) NOT NULL,
	`numeroTelefono` VARCHAR(8) NOT NULL,
	`camposReservados` INT NOT NULL,
	`idDestino` INT NOT NULL,
	`pagado` TINYINT(1) NOT NULL, --PARA SABER SI REALIZÓ EL O NO EL PAGO DE LA RESERVACION
	`fechaLimite` DATE NOT NULL, --FORMATO YYYY-MM-DD
)
ENGINE = InnoDB;
