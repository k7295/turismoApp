-- 279 hasta 424 agregar validacion de existencia
-- verpersona(cedula)

USE `servicioExcursiones`;
DROP procedure IF EXISTS `servicioExcursiones`.`uspInsertarCategorias`;

-- CRUD CATEGORIAS --

DELIMITER $$
USE `servicioExcursiones`$$
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdCategoria`(
	pCategoria VARCHAR(50),
	OUT pSCategoria INT
)
BEGIN
	SELECT c.idCategoria INTO pSCategoria
	FROM categorias c
	WHERE c.categoria=pCategoria;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerCategoria`(
	pIdCategoria INT,
	OUT pSCategoria VARCHAR(50)
)
BEGIN
	SELECT c.categoria INTO pSCategoria
	FROM categorias c
	WHERE c.idCategoria=pIdCategoria;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerCategorias`()
BEGIN
	SELECT c.categoria
	FROM categorias c;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspActualizarCategorias`(
	pCategoria VARCHAR(50),
	pNuevoNombre VARCHAR(50)
)
BEGIN
	UPDATE `categorias`
	SET `categoria`=pNuevoNombre
	WHERE LOWER(`categoria`)=LOWER(pCategoria);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspBorrarCategorias`(
	pCategoria VARCHAR(50)
)
BEGIN
	DELETE FROM `categorias`
	WHERE LOWER(`categoria`)=LOWER(pCategoria);
END$$
DELIMITER ;

-- CRUD DESTINOS TURISTICOS

DELIMITER $$
USE `servicioExcursiones`$$
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerDestinos`()
BEGIN
	SELECT dt.nombreDestino
	FROM destinosTuristicos dt;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerInfoDestino`(
	pDestino VARCHAR(100)
)
BEGIN
	SELECT dt.nombreDestino, dt.lugar, c.categoria, dt.descripcion
	FROM destinosTuristicos dt INNER JOIN
		 categorias c ON(dt.idCategoria=c.idCategoria)
	WHERE dt.nombreDestino=pDestino;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdDestino`(
	pDestino VARCHAR(100),
	OUT pSDestino INT
)
BEGIN
	SELECT dt.idDestino INTO pSDestino
	FROM destinosTuristicos dt
	WHERE dt.nombreDestino=pDestino;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerDestino`(
	pIdDestino INT,
	OUT pSDestino VARCHAR(100)
)
BEGIN
	SELECT dt.nombreDestino INTO pSDestino
	FROM destinosTuristicos dt
	WHERE dt.idDestino=pIdDestino;
END$$
DELIMITER ;


DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspActualizarDestino`(
	pDestino VARCHAR(100),
	pLugar VARCHAR(100),
	pCategoria VARCHAR(50),
	pDescripcion VARCHAR(250),
	pNuevoNombre VARCHAR(100),
	pNuevoLugar VARCHAR(100),
	pNuevaCategoria VARCHAR(50),
	pNuevaDescripcion VARCHAR(250)
)
BEGIN
	CALL uspVerIdCategoria(IFNULL(pNuevaCategoria,pCategoria),@newCat);
	CALL uspVerIdCategoria(pCategoria,@categoria);

	UPDATE `destinosTuristicos`
	SET `nombreDestino`=IFNULL(pNuevoNombre,pDestino),
		`lugar`=IFNULL(pNuevoLugar,pLugar),
	 	`idCategoria`=@newCat,
	 	`descripcion`=IFNULL(pNuevaDescripcion,pDescripcion)
	WHERE LOWER(`nombreDestino`)=LOWER(pDestino) AND
		  LOWER(`lugar`)=LOWER(pLugar) AND 
		  `idCategoria`=@categoria AND
		  LOWER(`descripcion`)=LOWER(pDescripcion);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspBorrarDestino`(
	pDestino VARCHAR(100)
)
BEGIN
	DELETE FROM `destinosTuristicos`
	WHERE LOWER(`nombreDestino`)=LOWER(pDestino);
END$$
DELIMITER ;

-- CR COMENTARIOS

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarComentario`(
	pDestino VARCHAR(50),
	pPersona VARCHAR(150),
	pComentario VARCHAR(280)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	INSERT INTO comentariosDestino(idDestino,persona,comentario) 
	VALUES(@result,pPersona,pComentario);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerComentarioDestino`(
	pDestino VARCHAR(50)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	SELECT c.persona, c.comentario
	FROM comentariosDestino c
	WHERE c.idDestino=@result;
END$$
DELIMITER ;

-- CRD Imagenes

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarImagen`(
	pDestino VARCHAR(50),
	pUrl VARCHAR(300)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	INSERT INTO imagenesDestinos(url,idDestino) 
	VALUES(pUrl,@result);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerImagenesDestino`(
	pDestino VARCHAR(50)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	SELECT i.url
	FROM imagenesDestinos i
	WHERE i.idDestino=@result;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspBorrarImagen`(
	pUrl VARCHAR(300)
)
BEGIN
	DELETE FROM `imagenesDestinos`
	WHERE `url`=pUrl;
END$$
DELIMITER ;

-- CRUD MARCAS DE VEHICULOS

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarMarca`(
	pMarca VARCHAR(25)
)
BEGIN
	INSERT INTO marcasVehiculos(marca) 
	VALUES(pMarca);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdMarca`(
	pMarca VARCHAR(25),
	OUT pSMarca INT
)
BEGIN
	SELECT m.idMarca INTO pSMarca
	FROM marcasVehiculos m
	WHERE m.marca=pMarca;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerMarca`(
	pIdMarca INT,
	OUT pSMarca VARCHAR(25)
)
BEGIN
	SELECT m.marca INTO pSMarca
	FROM marcasVehiculos m
	WHERE m.idMarca=pIdMarca;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerMarcas`()
BEGIN
	SELECT m.marca
	FROM marcasVehiculos m;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspActualizarMarca`(
	pMarca VARCHAR(25),
	pNuevoNombre VARCHAR(25)
)
BEGIN
	UPDATE `marcasVehiculos`
	SET `marca`=pNuevoNombre
	WHERE LOWER(`marca`)=LOWER(pMarca);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspBorrarMarca`(
	pMarca VARCHAR(25)
)
BEGIN
	DELETE FROM `marcasVehiculos`
	WHERE LOWER(`marca`)=LOWER(pMarca);
END$$
DELIMITER ;

-- CRUD TIPOS DE VEHICULOS

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarTipo`(
	pTipo VARCHAR(25)
)
BEGIN
	INSERT INTO tipoVehiculos(tipoVehiculo) 
	VALUES(pTipo);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdTipo`(
	pTipo VARCHAR(25),
	OUT pSTipo INT
)
BEGIN
	SELECT t.idTipoVehiculo INTO pSTipo
	FROM tipoVehiculos t
	WHERE t.tipoVehiculo=pTipo;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerTipo`(
	pIdTipo INT,
	OUT pSTipo VARCHAR(25)
)
BEGIN
	SELECT t.tipoVehiculo INTO pSTipo
	FROM tipoVehiculos t
	WHERE t.idTipoVehiculo=pIdTipo;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerTiposVehiculos`()
BEGIN
	SELECT t.tipoVehiculo
	FROM tipoVehiculos t;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspActualizarTipo`(
	pTipo VARCHAR(25),
	pNuevoNombre VARCHAR(25)
)
BEGIN
	UPDATE `tipoVehiculos`
	SET `tipoVehiculo`=pNuevoNombre
	WHERE LOWER(`tipoVehiculo`)=LOWER(pTipo);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspBorrarTipo`(
	pTipo VARCHAR(25)
)
BEGIN
	DELETE FROM `tipoVehiculos`
	WHERE LOWER(`tipoVehiculo`)=LOWER(pTipo);
END$$
DELIMITER ;

-- CRUD TIPOS DE PUESTOS

DELIMITER $$
USE `servicioExcursiones`$$
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdPuesto`(
	pPuesto VARCHAR(20),
	OUT pSPuesto INT
)
BEGIN
	SELECT p.idPuesto INTO pSPuesto
	FROM puestos p
	WHERE p.puesto=pPuesto;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerPuesto`(
	pIdPuesto INT,
	OUT pSPuesto VARCHAR(20)
)
BEGIN
	SELECT p.puesto INTO pSPuesto
	FROM puestos p
	WHERE p.idPuesto=pIdPuesto;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerPuestos`()
BEGIN
	SELECT p.puesto
	FROM puestos p;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspActualizarPuesto`(
	pPuesto VARCHAR(20),
	pNuevoNombre VARCHAR(20)
)
BEGIN
	UPDATE `puestos`
	SET `puesto`=pNuevoNombre
	WHERE LOWER(`puesto`)=LOWER(pPuesto);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspBorrarPuesto`(
	pPuesto VARCHAR(20)
)
BEGIN
	DELETE FROM `puestos`
	WHERE LOWER(`puesto`)=LOWER(pPuesto);
END$$
DELIMITER ;

-- CR BANCOS

DELIMITER $$
USE `servicioExcursiones`$$
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdBanco`(
	pBanco VARCHAR(20),
	OUT pSBanco INT
)
BEGIN
	SELECT b.idBanco INTO pSBanco
	FROM bancos b
	WHERE b.banco=pBanco;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerBanco`(
	pIdBanco INT,
	OUT pSBanco VARCHAR(20)
)
BEGIN
	SELECT b.banco INTO pSBanco
	FROM bancos b
	WHERE b.idBanco=pIdBanco;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerBancos`()
BEGIN
	SELECT b.banco
	FROM bancos b;
END$$
DELIMITER ;

-- CRUD TIPOS DE PERSONAL

DELIMITER $$
USE `servicioExcursiones`$$
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdPersona`(
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerPersonas`()
BEGIN
	SELECT p.cedula, p.nombre, p.apellidos, p.numeroTelefono, p.correo, pu.puesto 
	FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto);
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspActualizarPersona`(
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspBorrarPersona`(
	pCedula VARCHAR(10)
)
BEGIN
	DELETE FROM `personal`
	WHERE cedula=pCedula;
END$$
DELIMITER ;

-- CRUD SERVICIOS

DELIMITER $$
USE `servicioExcursiones`$$
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerIdServicio`(
	pServicio VARCHAR(100),
	OUT pSServicio INT
)
BEGIN
	SELECT s.idServicio INTO pSServicio
	FROM servicios s
	WHERE s.servicio=pServicio;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerServicio`(
	pIdServicio INT,
	OUT pSServicio VARCHAR(100)
)
BEGIN
	SELECT s.servicio INTO pSServicio
	FROM servicios s
	WHERE s.idServicio=pIdServicio;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerServicios`()
BEGIN
	SELECT s.servicio
	FROM servicios s;
END$$
DELIMITER ;

-- CRUD SERVICIOxVEHICULOS

DELIMITER $$
USE `servicioExcursiones`$$
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
			INSERT INTO servicioXvehiculo(idVehiculo,idServicioVehiculo) VALUES(pPlaca,@servicio);
	ELSE
		SIGNAL msgError;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerServiciosXVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
	SELECT s.servicio
	FROM servicios s
	WHERE s.idVehiculo=pPlaca;
END$$
DELIMITER ;

-- CRUD SERVICIOxDESTINOS

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarServicioXDestino`(
	pServicio VARCHAR(100),
	pDestino VARCHAR(100)
)
BEGIN
	DECLARE msgError CONDITION FOR SQLSTATE '22012';
	DECLARE CONTINUE HANDLER FOR msgError
	RESIGNAL SET MESSAGE_TEXT = 'Servicio en el sistema';

	CALL uspVerIdServicio(pServicio,@servicio);
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
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerServiciosXDestino`(
	pDestino VARCHAR(100)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@destino);

	SELECT s.idServicioIncluido
	FROM serviciosIncluidos s
	WHERE s.idDestino=@destino;
END$$
DELIMITER ;

-- CRUD EXCURSIONES

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerExcursiones`()
BEGIN
	SELECT d.nombreDestino,e.fechaSalida,e.lugarSalida,e.horaSalida,e.cuposDisponibles,e.precioAdulto,
		   e.precioAdultoM,e.precioNino,(p.nombre+p.apellidos)
	FROM excursiones e INNER JOIN
		 destinosTuristicos dt ON(e.idDestino=dt.idDestino) INNER JOIN
		 personal p ON(e.guia=p.cedula)
	WHERE e.fechaSalida>CURDATE();
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerExcursion`(
	pDestino VARCHAR(100),
	pFecha DATE
)
BEGIN
	CALL uspVerIdDestino(pDestino,@destino);
	SELECT d.nombreDestino,e.fechaSalida,e.lugarSalida,e.horaSalida,e.cuposDisponibles,e.precioAdulto,
		   e.precioAdultoM,e.precioNino,(p.nombre+p.apellidos)
	FROM excursiones e INNER JOIN
		 destinosTuristicos dt ON(e.idDestino=dt.idDestino) INNER JOIN
		 personal p ON(e.guia=p.cedula)
	WHERE e.fechaSalida>CURDATE() AND
		  e.idDestino=@destino AND
		  e.fechaSalida=pFecha;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarExcursion`(
	pDestino VARCHAR(100),pFecha DATE,pLugar VARCHAR(100),pHora TIME,pCupos INT,pPrecioA INT,pPrecioAM INT,
	pPrecioNino INT, pGuia VARCHAR(10)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@destino);
	INSERT INTO excursiones(idDestino,fechaSalida,lugarSalida,horaSalida,cupos,cuposDisponibles,precioAdulto,
				precioAdultoM,precioNino,guia) 
	VALUES(@destino,pFecha,pLugar,pHora,pCupos,pCupos,pPrecioA,pPrecioAM,pPrecioNino,pGuia);
END$$
DELIMITER ;

-- CRUD flotilla

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarVehiculo`(
	pPlaca VARCHAR(6),
	pMarca VARCHAR(100),
	pTipoVehiculo VARCHAR(25),
	pCampos INT,
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
			VALUES(pPlaca,@marca,@tipo,pCampos,0,pChofer);
	ELSE
		SIGNAL msgError;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
	SELECT v.idVehiculo,m.marca,t.tipoVehiculo,v.campos,v.enMantenimiento,(p.nombre+p.apellidos)
	FROM flotilla v INNER JOIN
		 marcasVehiculos m ON(v.idMarca=m.idMarca) INNER JOIN
		 personal p ON(p.cedula=v.chofer) INNER JOIN
		 tipoVehiculos t ON(t.idTipoVehiculo=v.idTipoVehiculo)
	WHERE v.idVehiculo=pPlaca;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
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
END$$
DELIMITER ;

-- falta: reservaciones cancelarReservacion

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarReservacion`(
	pNombre VARCHAR(50), pApellidos VARCHAR(50), pNumeroTelefonico VARCHAR(8),
	pCampos INT, pDestino INT, pFPrimerPago DATE, pFechaFinal DATE
)
BEGIN
	INSERT INTO reservaciones(nombre,apellidos,numeroTelefono,camposReservados,idExcursion,primerPago,fechaPrimerPago,pagado,fechaLimite,cancelado) 
	VALUES(pNombre,pApellidos,pNumeroTelefonico,pCampos,pDestino,0,pFPrimerPago,0,pFechaFinal,0);
	
	UPDATE `excursiones`
	SET `cuposDisponibles`=(`cuposDisponibles`-pCampos)
	WHERE `idExcursion`=pDestino;

	SELECT LAST_INSERT_ID();
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER =`root`@`localhost` PROCEDURE `uspVerCamposReservados`(
	pIdReservacion INT,
	OUT pSCampos INT
)
BEGIN
	SELECT r.campos INTO pSCampos
	FROM reservaciones r
	WHERE r.idReservacion=pIdReservacion;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCancelarReservacion`(
	pIdReservacion INT
)
BEGIN
	UPDATE `reservaciones`
	SET `cancelado`=1
	WHERE `idReservacion`=pIdReservacion;

	CALL uspVerCamposReservados(pIdReservacion,@campos);

	UPDATE `excursiones`
	SET `cuposDisponibles`=(`cuposDisponibles`+@campos)
	WHERE `idExcursion`=pIdReservacion;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspPrimerPagoHecho`(
	pIdReservacion INT
)
BEGIN
	UPDATE `reservaciones`
	SET `primerPago`=1
	WHERE `idReservacion`=pIdReservacion;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSegundoPagoHecho`(
	pIdReservacion INT
)
BEGIN
	UPDATE `reservaciones`
	SET `pagado`=1
	WHERE `idReservacion`=pIdReservacion;
END$$
DELIMITER ;

DELIMITER $$
USE `servicioExcursiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListarParticipantes`(
	pIdExcursion INT
)
BEGIN
	SELECT (r.nombre+r.apellidos),r.numeroTelefono,r.camposReservados
	FROM reservaciones r
	WHERE r.idExcursion=pIdExcursion AND
		  r.pagado=1;
END$$
DELIMITER ;