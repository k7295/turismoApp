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
			INSERT INTO destinosTuristicos(nombreDestino,idCategoria,descripcion) VALUES(pNombre,@result
				,pDescripcion);
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
	SELECT dt.nombreDestino, c.categoria, dt.descripcion
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
	pCategoria VARCHAR(50),
	pDescripcion VARCHAR(250),
	pNuevoNombre VARCHAR(100),
	pNuevaCategoria VARCHAR(50),
	pNuevaDescripcion VARCHAR(250)
)
BEGIN
	CALL uspVerIdCategoria(IFNULL(pNuevaCategoria,pCategoria),@newCat);
	CALL uspVerIdCategoria(pCategoria,@categoria);

	UPDATE `destinosTuristicos`
	SET `nombreDestino`=IFNULL(pNuevoNombre,pDestino), `idCategoria`=@newCat, `descripcion`=IFNULL(pNuevaDescripcion,pDescripcion)
	WHERE LOWER(`nombreDestino`)=LOWER(pDestino) AND 
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