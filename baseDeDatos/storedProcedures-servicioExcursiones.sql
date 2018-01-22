DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarCategorias`(
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
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarMarca`(
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarPuesto`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspActualizarTipo`(
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspAumentarCampos`(
	pIdReservacion INT
)
BEGIN
	SET @destino=(SELECT r.idExcursion FROM reservaciones r WHERE r.idReservacion=pIdReservacion);
	CALL uspVerCamposReservados(pIdReservacion,@campos);

	UPDATE `excursiones`
	SET `cuposDisponibles`=(`cuposDisponibles`+@campos)
	WHERE `idExcursion`=@destino;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarCategorias`(
	pCategoria VARCHAR(50)
)
BEGIN
	DELETE FROM `categorias`
	WHERE LOWER(`categoria`)=LOWER(pCategoria);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarDestino`(
	pDestino VARCHAR(100)
)
BEGIN
	DELETE FROM `destinosTuristicos`
	WHERE LOWER(`nombreDestino`)=LOWER(pDestino);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarExcursion`(
	pExcursion VARCHAR(100)
)
BEGIN
	DELETE FROM `excursiones`
	WHERE nombreExcursion=pExcursion;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarImagen`(
	pUrl VARCHAR(300)
)
BEGIN
	DELETE FROM `imagenesDestinos`
	WHERE `url`=pUrl;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarMarca`(
	pMarca VARCHAR(25)
)
BEGIN
	DELETE FROM `marcasVehiculos`
	WHERE LOWER(`marca`)=LOWER(pMarca);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarPersona`(
	pCedula VARCHAR(10)
)
BEGIN
	DELETE FROM `personal`
	WHERE cedula=pCedula;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarPuesto`(
	pPuesto VARCHAR(20)
)
BEGIN
	DELETE FROM `puestos`
	WHERE LOWER(`puesto`)=LOWER(pPuesto);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarServiciosXExcursion`(
	pExcursion INT
)
BEGIN
	DELETE FROM serviciosxexcursion WHERE idExcursion=pExcursion;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarServiciosXVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
	DELETE FROM servicioxvehiculo WHERE idVehiculo=pPlaca;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarTipo`(
	pTipo VARCHAR(25)
)
BEGIN
	DELETE FROM `tipoVehiculos`
	WHERE LOWER(`tipoVehiculo`)=LOWER(pTipo);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
    CALL uspBorrarServiciosXVehiculo(pPlaca);
    CALL uspBorrarVehiculoExcursion(pPlaca);
    
	DELETE FROM `flotilla`
	WHERE idVehiculo=pPlaca;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBorrarVehiculoExcursion`(
	pPlaca VARCHAR(6)
)
BEGIN
	DELETE FROM `flotillaxexcursion`
	WHERE idVehiculo=pPlaca;    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCancelarReservacion`(
	pIdReservacion INT
)
BEGIN
	UPDATE reservaciones r
    SET cancelado=1
    WHERE r.idReservacion=pIdReservacion;
    
	CALL uspAumentarCampos(pIdReservacion);
END$$
DELIMITER ;

DELIMITER $$
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarComentario`(
	pDestino VARCHAR(50),
	pComentario VARCHAR(280)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	INSERT INTO comentariosDestino(idDestino,comentario) 
	VALUES(@result,pComentario);
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarMarca`(
	pMarca VARCHAR(25)
)
BEGIN
	INSERT INTO marcasVehiculos(marca) 
	VALUES(pMarca);
END$$
DELIMITER ;

DELIMITER $$
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
    
    
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspInsertarTipo`(
	pTipo VARCHAR(25)
)
BEGIN
	INSERT INTO tipoVehiculos(tipoVehiculo) 
	VALUES(pTipo);
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
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

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspListarParticipantes`()
BEGIN
	SELECT e.nombreExcursion,CONCAT(r.nombre,' ',r.apellidos) AS nombre,r.numeroTelefono,r.camposReservados
	FROM reservaciones r INNER JOIN
		 excursiones e ON (r.idExcursion=e.idExcursion)
	WHERE r.primerPago=1 AND
		  r.pagado=1;
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspPonerEnMantenimiento`(
	pPlaca VARCHAR(6)
)
BEGIN
	UPDATE flotilla
    SET enMantenimiento=1
    WHERE pPlaca=idVehiculo;
END$$
DELIMITER ;

DELIMITER $$
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspRestarCampos`(
	pDestino VARCHAR(100),
	pCampos INT
)
BEGIN
	CALL uspVerIdExcursion(pDestino,@destino);

	UPDATE `excursiones`
	SET `cuposDisponibles`=(`cuposDisponibles`-pCampos)
	WHERE `idExcursion`=@destino;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSacarDeMantenimiento`(
	pPlaca VARCHAR(6)
)
BEGIN
	UPDATE flotilla
    SET enMantenimiento=0
    WHERE pPlaca=idVehiculo;
END$$
DELIMITER ;

DELIMITER $$
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerBanco`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerBancos`()
BEGIN
	SELECT b.banco
	FROM bancos b;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerCamposReservados`(
	pIdReservacion INT,
	OUT pSCampos INT
)
BEGIN
	SELECT r.camposReservados INTO pSCampos
	FROM reservaciones r
	WHERE r.idReservacion=pIdReservacion;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerCategoria`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerCategorias`()
BEGIN
	SELECT c.categoria
	FROM categorias c;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerChoferes`()
BEGIN
	SELECT p.cedula,CONCAT(p.nombre,' ',p.apellidos) AS nombre
    FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto)
	WHERE LOWER(pu.puesto)=LOWER('Chofer');
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerComentarioDestino`(
	pDestino VARCHAR(50)
)
BEGIN
	CALL uspVerIdDestino(pDestino,@result);

	SELECT c.comentario
	FROM comentariosDestino c
	WHERE c.idDestino=@result;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerDestino`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerDestinos`()
BEGIN
	SELECT dt.nombreDestino
	FROM destinosTuristicos dt;
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerExcursiones`()
BEGIN
	SELECT e.NombreExcursion,dt.nombreDestino,e.fechaHoraSalida,e.cuposDisponibles
	FROM excursiones e INNER JOIN
		 destinosTuristicos dt ON(e.idDestino=dt.idDestino) INNER JOIN
		 personal p ON(e.guia=p.cedula);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerExcursionesCliente`()
BEGIN
	SELECT DISTINCT e.NombreExcursion,dt.nombreDestino,e.fechaHoraSalida,e.cuposDisponibles,i.url
	FROM excursiones e INNER JOIN
		 destinosTuristicos dt ON(e.idDestino=dt.idDestino) INNER JOIN
		 personal p ON(e.guia=p.cedula) INNER JOIN
         imagenesdestinos i ON(dt.idDestino=i.idDestino)
	GROUP BY e.NombreExcursion;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerGuias`()
BEGIN
	SELECT p.cedula,CONCAT(p.nombre,' ',p.apellidos) AS nombre
    FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto)
	WHERE LOWER(pu.puesto)='guia';
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdBanco`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdCategoria`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdDestino`(
	pDestino VARCHAR(100),
	OUT pSDestino INT
)
BEGIN
	SELECT dt.idDestino INTO pSDestino
	FROM destinosturisticos dt
	WHERE dt.nombreDestino=pDestino;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdExcursion`(
    pNombre VARCHAR(100),
	OUT pSExcursion INT
)
BEGIN
	SELECT e.idExcursion INTO pSExcursion
    FROM excursiones e
    WHERE e.nombreExcursion=pNombre;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdMarca`(
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdPuesto`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdServicio`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdServicioD`(
	pServicio VARCHAR(100),
	OUT pSServicio INT
)
BEGIN
	SELECT s.idServicio INTO pSServicio
	FROM serviciosDestinos s
	WHERE s.servicio=pServicio;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerIdTipo`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerImagenes`()
BEGIN
	SELECT id.url,d.nombreDestino
	FROM imagenesdestinos id INNER JOIN
		 destinosturisticos d ON(id.idDestino=d.idDestino);
END$$
DELIMITER ;

DELIMITER $$
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerInfoDestino`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerInfoDestinos`()
BEGIN
	SELECT dt.nombreDestino, c.categoria
	FROM destinosTuristicos dt INNER JOIN
		 categorias c ON (dt.idCategoria=c.idCategoria);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerMarca`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerMarcas`()
BEGIN
	SELECT m.marca
	FROM marcasVehiculos m;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPersonas`()
BEGIN
	SELECT p.cedula, p.nombre, p.apellidos, p.numeroTelefono, p.correo, pu.puesto 
	FROM personal p INNER JOIN
		 puestos pu ON(p.idPuesto=pu.idPuesto);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPlacas`()
BEGIN
	SELECT v.idVehiculo, v.campos
	FROM flotilla v INNER JOIN
		 marcasVehiculos m ON(v.idMarca=m.idMarca) INNER JOIN
		 personal p ON(p.cedula=v.chofer) INNER JOIN
		 tipoVehiculos t ON(t.idTipoVehiculo=v.idTipoVehiculo)
	WHERE v.enMantenimiento=0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPuesto`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerPuestos`()
BEGIN
	SELECT p.puesto
	FROM puestos p;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServicio`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServicioD`(
	pIdServicio INT,
	OUT pSServicio VARCHAR(100)
)
BEGIN
	SELECT s.servicio INTO pSServicio
	FROM serviciosdestinos s
	WHERE s.idServicio=pIdServicio;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServicios`()
BEGIN
	SELECT s.servicio
	FROM servicios s;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosD`()
BEGIN
	SELECT s.servicio
	FROM serviciosdestinos s;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosXExcursion`(
	pExcursion VARCHAR(100)
)
BEGIN
	CALL uspVerIdExcursion(pExcursion,@excursion);

	SELECT sd.servicio
	FROM serviciosXexcursion s INNER JOIN
		 serviciosdestinos sd ON (s.idServicio=sd.Idservicio)
	WHERE s.idExcursion=@excursion;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosXVehiculo`(
	pPlaca VARCHAR(6)
)
BEGIN
	SELECT s.servicio
    FROM servicios s INNER JOIN
		 servicioXVehiculo sv ON(s.idServicio=sv.idServicio)
	WHERE sv.idVehiculo=pPlaca;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerServiciosXVehiculos`()
BEGIN
	SELECT sv.idVehiculo, s.servicio
	FROM servicioxvehiculo sv INNER JOIN
		 servicios s ON(sv.idServicio=s.idServicio)
	ORDER BY(sv.idVehiculo);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerTipo`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerTiposVehiculos`()
BEGIN
	SELECT t.tipoVehiculo
	FROM tipoVehiculos t;
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspVerVehiculos`()
BEGIN
	SELECT v.idVehiculo AS 'placa',m.marca,CONCAT(p.nombre,' ',p.apellidos) AS 'chofer'
	FROM flotilla v INNER JOIN
		 marcasVehiculos m ON(v.idMarca=m.idMarca) INNER JOIN
		 personal p ON(p.cedula=v.chofer) INNER JOIN
		 tipoVehiculos t ON(t.idTipoVehiculo=v.idTipoVehiculo)
	WHERE v.enMantenimiento=0;
END$$
DELIMITER ;
