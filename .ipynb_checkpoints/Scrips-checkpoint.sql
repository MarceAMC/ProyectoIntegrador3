---------------------
DROP DATABASE modelo_negocio;
CREATE DATABASE IF NOT EXISTS modelo_negocio;
USE modelo_negocio;

 SELECT @@global.secure_file_priv; -- Para ver la ruta de origen donde poner los csv.

/*Importacion de las tablas*/
DROP TABLE IF EXISTS `gasto`;
CREATE TABLE IF NOT EXISTS `gasto` (
  	`IdGasto` 		INTEGER,
  	`IdSucursal` 	INTEGER,
  	`IdTipoGasto` 	INTEGER,
    `Fecha`			DATE,
  	`Monto` 		DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Gasto.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES (IdGasto,IdSucursal,IdTipoGasto,Fecha,Monto);
-- SELECT * FROM gasto;

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `IdCompra`			INTEGER,
  `Fecha` 				DATE,
  `IdProducto`			INTEGER,
  `Cantidad`			INTEGER,
  `Precio`				DECIMAL(10,2),
  `IdProveedor`			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Compra.csv' 
INTO TABLE `compra` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM compra;

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCanal`				INTEGER, 
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				VARCHAR(30),
  `Cantidad`			VARCHAR(30)
  -- `Precio`			DECIMAL(10,2),
  -- `Cantidad`			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Venta.csv' 
INTO TABLE `venta` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
-- SELECT * FROM venta;

DROP TABLE IF EXISTS sucursal;
CREATE TABLE IF NOT EXISTS sucursal (
	ID			INTEGER,
	Sucursal	VARCHAR(40),
	Domicilio	VARCHAR(150),
	Localidad	VARCHAR(80),
	Provincia	VARCHAR(50),
	Latitud2	VARCHAR(30),
	Longitud2	VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sucursales_ANSI.csv' 
INTO TABLE sucursal
CHARACTER SET latin1 -- Si no colocamos esta línea, no reconoce la codificación adecuada ANSI
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
 SELECT * FROM sucursal;
 TRUNCATE TABLE sucursal;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sucursales_UTF8.csv' 
INTO TABLE sucursal
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
 SELECT * FROM sucursal;

DROP TABLE IF EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente (
	ID					INTEGER,
	Provincia			VARCHAR(50),
	Nombre_y_Apellido	VARCHAR(80),
	Domicilio			VARCHAR(150),
	Telefono			VARCHAR(30),
	Edad				VARCHAR(5),
	Localidad			VARCHAR(80),
	X					VARCHAR(30),
	Y					VARCHAR(30),
    Fecha_Alta			DATE NOT NULL,
    Usuario_Alta		VARCHAR(20),
    Fecha_Ultima_Modificacion		DATE NOT NULL,
    Usuario_Ultima_Modificacion		VARCHAR(20),
    Marca_Baja			TINYINT,
	col10				VARCHAR(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Clientes.csv'
INTO TABLE cliente
CHARACTER SET latin1
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM cliente;

DROP TABLE IF EXISTS `canal_venta`;
CREATE TABLE IF NOT EXISTS `canal_venta` (
  `IdCanal`				INTEGER,
  `Canal` 				VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CanalDeVenta.csv' 
INTO TABLE `canal_venta` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM canal_venta;

DROP TABLE IF EXISTS `tipo_gasto`;
CREATE TABLE IF NOT EXISTS `tipo_gasto` (
  `IdTipoGasto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `Monto_Aproximado` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`IdTipoGasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\TiposDeGasto.csv' 
INTO TABLE `tipo_gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM tipo_gasto;

DROP TABLE IF EXISTS proveedor;
CREATE TABLE IF NOT EXISTS proveedor (
	IDProveedor		INTEGER,
	Nombre			VARCHAR(80),
	Domicilio		VARCHAR(150),
	Ciudad			VARCHAR(80),
	Provincia		VARCHAR(50),
	Pais			VARCHAR(20),
	Departamento	VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Proveedores.csv' 
INTO TABLE proveedor
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM proveedor;

DROP TABLE IF EXISTS producto;
CREATE TABLE IF NOT EXISTS producto (
	IDProducto					INTEGER,
	Concepto					VARCHAR(100),
	Tipo						VARCHAR(50),
	Precio2						VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Productos.csv' 
INTO TABLE `producto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM proveedor;

DROP TABLE IF EXISTS empleado;
CREATE TABLE IF NOT EXISTS empleado (
	IDEmpleado					INTEGER,
	Apellido					VARCHAR(100),
	Nombre						VARCHAR(100),
	Sucursal					VARCHAR(50),
	Sector						VARCHAR(50),
	Cargo						VARCHAR(50),
	Salario2					VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Empleados.csv' 
INTO TABLE `empleado` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
 SELECT * FROM empleado;
----------
/*Nombres de campos*/
use modelo_negocio;
/*Función y Procedimiento provistos*/
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS `UC_Words`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `UC_Words`( str VARCHAR(255) ) RETURNS varchar(255) CHARSET utf8
BEGIN  
  DECLARE c CHAR(1);  
  DECLARE s VARCHAR(255);  
  DECLARE i INT DEFAULT 1;  
  DECLARE bool INT DEFAULT 1;  
  DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';  
  SET s = LCASE( str );  
  WHILE i < LENGTH( str ) DO  
     BEGIN  
       SET c = SUBSTRING( s, i, 1 );  
       IF LOCATE( c, punct ) > 0 THEN  
        SET bool = 1;  
      ELSEIF bool=1 THEN  
        BEGIN  
          IF c >= 'a' AND c <= 'z' THEN  
             BEGIN  
               SET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));  
               SET bool = 0;  
             END;  
           ELSEIF c >= '0' AND c <= '9' THEN  
            SET bool = 0;  
          END IF;  
        END;  
      END IF;  
      SET i = i+1;  
    END;  
  END WHILE;  
  RETURN s;  
END$$
DELIMITER ;
DROP PROCEDURE IF EXISTS `Llenar_dimension_calendario`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Llenar_dimension_calendario`(IN `startdate` DATE, IN `stopdate` DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate < stopdate DO
        INSERT INTO calendario VALUES (
                        YEAR(currentdate)*10000+MONTH(currentdate)*100 + DAY(currentdate),
                        currentdate,
                        YEAR(currentdate),
                        MONTH(currentdate),
                        DAY(currentdate),
                        QUARTER(currentdate),
                        WEEKOFYEAR(currentdate),
                        DATE_FORMAT(currentdate,'%W'),
                        DATE_FORMAT(currentdate,'%M'));
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END$$
DELIMITER ;
select UC_Words('hola mundo');
select UC_Words('HOLA MUNDO');

/*Se genera la dimension calendario*/
DROP TABLE IF EXISTS `calendario`;
CREATE TABLE calendario (
        id                      INTEGER PRIMARY KEY,  -- year*10000+month*100+day
        fecha                 	DATE NOT NULL,
        anio                    INTEGER NOT NULL,
        mes                   	INTEGER NOT NULL, -- 1 to 12
        dia                     INTEGER NOT NULL, -- 1 to 31
        trimestre               INTEGER NOT NULL, -- 1 to 4
        semana                  INTEGER NOT NULL, -- 1 to 52/53
        dia_nombre              VARCHAR(9) NOT NULL, -- 'Monday', 'Tuesday'...
        mes_nombre              VARCHAR(9) NOT NULL -- 'January', 'February'...
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

ALTER TABLE `calendario` CHANGE `id` `IdFecha` INT(11) NOT NULL;
ALTER TABLE `calendario` ADD UNIQUE(`fecha`);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Calendario.csv' 
INTO TABLE calendario
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

TRUNCATE TABLE calendario;
CALL Llenar_dimension_calendario('2015-01-01','2021-01-01');
SELECT * FROM calendario;

ALTER TABLE `cliente` CHANGE `ID` `IdCliente` INT(11) NOT NULL;
ALTER TABLE `empleado` CHANGE `IDEmpleado` `IdEmpleado` INT(11) NULL DEFAULT NULL;
ALTER TABLE `proveedor` CHANGE `IDProveedor` `IdProveedor` INT(11) NULL DEFAULT NULL;
ALTER TABLE `sucursal` CHANGE `ID` `IdSucursal` INT(11) NULL DEFAULT NULL;
ALTER TABLE `tipo_gasto` CHANGE `Descripcion` `Tipo_Gasto` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL;
ALTER TABLE `producto` CHANGE `IDProducto` `IdProducto` INT(11) NULL DEFAULT NULL;
ALTER TABLE `producto` CHANGE `Concepto` `Producto` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL;

select * from tipo_gasto;
select * from producto;

/*Tipos de Datos*/
ALTER TABLE `cliente` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Y`, 
						ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
UPDATE cliente SET Y = '0' WHERE Y = '';
UPDATE cliente SET X = '0' WHERE X = '';
UPDATE `cliente` SET Latitud = REPLACE(Y,',','.');
UPDATE `cliente` SET Longitud = REPLACE(X,',','.');
 SELECT * FROM `cliente`;
ALTER TABLE `cliente` DROP `Y`;
ALTER TABLE `cliente` DROP `X`;

ALTER TABLE `empleado` ADD `Salario` DECIMAL(10,2) NOT NULL DEFAULT '0' AFTER `Salario2`;
UPDATE `empleado` SET Salario = Salario2;
ALTER TABLE `empleado` DROP `Salario2`;

ALTER TABLE `producto` ADD `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0' AFTER `Precio2`;
UPDATE `producto` SET Precio = REPLACE(Precio2,',','.');
ALTER TABLE `producto` DROP `Precio2`;

ALTER TABLE `sucursal` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Longitud2`, 
						ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
UPDATE `sucursal` SET Latitud = REPLACE(Latitud2,',','.');
UPDATE `sucursal` SET Longitud = REPLACE(Longitud2,',','.');
-- SELECT * FROM `sucursal`;
ALTER TABLE `sucursal` DROP `Latitud2`;
ALTER TABLE `sucursal` DROP `Longitud2`;

UPDATE `venta` set `Precio` = 0 WHERE `Precio` = '';
ALTER TABLE `venta` CHANGE `Precio` `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0';

/*Columnas sin usar*/
ALTER TABLE `cliente` DROP `col10`;

 SELECT * FROM cliente;

/*Imputar Valores Faltantes*/
UPDATE `cliente` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `cliente` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
UPDATE `cliente` SET Nombre_y_Apellido = 'Sin Dato' WHERE TRIM(Nombre_y_Apellido) = "" OR ISNULL(Nombre_y_Apellido);
UPDATE `cliente` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);

UPDATE `empleado` SET Apellido = 'Sin Dato' WHERE TRIM(Apellido) = "" OR ISNULL(Apellido);
UPDATE `empleado` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `empleado` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `empleado` SET Sector = 'Sin Dato' WHERE TRIM(Sector) = "" OR ISNULL(Sector);
UPDATE `empleado` SET Cargo = 'Sin Dato' WHERE TRIM(Cargo) = "" OR ISNULL(Cargo);

UPDATE `producto` SET Producto = 'Sin Dato' WHERE TRIM(Producto) = "" OR ISNULL(Producto);
UPDATE `producto` SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = "" OR ISNULL(Tipo);

UPDATE `proveedor` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `proveedor` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `proveedor` SET Ciudad = 'Sin Dato' WHERE TRIM(Ciudad) = "" OR ISNULL(Ciudad);
UPDATE `proveedor` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `proveedor` SET Pais = 'Sin Dato' WHERE TRIM(Pais) = "" OR ISNULL(Pais);
UPDATE `proveedor` SET Departamento = 'Sin Dato' WHERE TRIM(Departamento) = "" OR ISNULL(Departamento);

UPDATE `sucursal` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `sucursal` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `sucursal` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `sucursal` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);

/*Normalizacion a Letra Capital*/
UPDATE cliente SET  Domicilio = UC_Words(TRIM(Domicilio)),
                    Nombre_y_Apellido = UC_Words(TRIM(Nombre_y_Apellido));
					
UPDATE sucursal SET Domicilio = UC_Words(TRIM(Domicilio)),
                    Sucursal = UC_Words(TRIM(Sucursal));
					
UPDATE proveedor SET Nombre = UC_Words(TRIM(Nombre)),
                    Domicilio = UC_Words(TRIM(Domicilio));

UPDATE producto SET Producto = UC_Words(TRIM(Producto));

UPDATE tipo_producto SET TipoProducto = UC_Words(TRIM(TipoProducto));
					
UPDATE empleado SET Nombre = UC_Words(TRIM(Nombre)),
                    Apellido = UC_Words(TRIM(Apellido));

/*Tabla ventas limpieza y normalizacion*/
/*
select * from venta where Precio = '' or Cantidad = '';
select count(*) from venta;
*/
UPDATE venta v JOIN producto p ON (v.IdProducto = p.IdProducto) 
SET v.Precio = p.Precio
WHERE v.Precio = 0;

/*Tabla auxiliar donde se guardarán registros con problemas:
1-Cantidad en Cero
*/
DROP TABLE IF EXISTS `aux_venta`;
CREATE TABLE IF NOT EXISTS `aux_venta` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				FLOAT,
  `Cantidad`			INTEGER,
  `Motivo`				INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

UPDATE venta SET Cantidad = REPLACE(Cantidad, '\r', '');

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, 0, 1
FROM venta WHERE Cantidad = '' or Cantidad is null;

UPDATE venta SET Cantidad = '1' WHERE Cantidad = '' or Cantidad is null;
ALTER TABLE `venta` CHANGE `Cantidad` `Cantidad` INTEGER NOT NULL DEFAULT '0';

/*Chequeo de claves duplicadas*/
SELECT IdCliente, COUNT(*) FROM cliente GROUP BY IdCliente HAVING COUNT(*) > 1;
SELECT IdSucursal, COUNT(*) FROM sucursal GROUP BY IdSucursal HAVING COUNT(*) > 1;
SELECT IdEmpleado, COUNT(*) FROM empleado GROUP BY IdEmpleado HAVING COUNT(*) > 1;
SELECT IdProveedor, COUNT(*) FROM proveedor GROUP BY IdProveedor HAVING COUNT(*) > 1;
SELECT IdProducto, COUNT(*) FROM producto GROUP BY IdProducto HAVING COUNT(*) > 1;

-- select count(*) from empleado;

SELECT e.*, s.IdSucursal
FROM empleado e JOIN sucursal s
	ON (e.Sucursal = s.Sucursal);
    
select distinct Sucursal from empleado
where Sucursal NOT IN (select Sucursal from sucursal);

/*Generacion de clave única tabla empleado mediante creacion de clave subrogada*/
UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';
-- UPDATE empleado SET Sucursal = 'Córdoba Quiroz' WHERE Sucursal = 'Cordoba Quiroz';

ALTER TABLE `empleado` ADD `IdSucursal` INT NULL DEFAULT '0' AFTER `Sucursal`;

UPDATE empleado e JOIN sucursal s
	ON (e.Sucursal = s.Sucursal)
SET e.IdSucursal = s.IdSucursal;

ALTER TABLE `empleado` DROP `Sucursal`;

ALTER TABLE `empleado` ADD `CodigoEmpleado` INT NULL DEFAULT '0' AFTER `IdEmpleado`;

UPDATE empleado SET CodigoEmpleado = IdEmpleado;
UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado;

/*Chequeo de claves duplicadas*/
SELECT * FROM `empleado`;
SELECT IdEmpleado, COUNT(*) FROM empleado GROUP BY IdEmpleado HAVING COUNT(*) > 1;

/*Modificacion de la clave foranea de empleado en venta*/
UPDATE venta SET IdEmpleado = (IdSucursal * 1000000) + IdEmpleado;

/*Normalizacion tabla empleado*/
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` integer NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `IdSector` integer NOT NULL AUTO_INCREMENT,
  `Sector` varchar(50) NOT NULL,
  PRIMARY KEY (`IdSector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO cargo (Cargo) SELECT DISTINCT Cargo FROM empleado ORDER BY 1;
INSERT INTO sector (Sector) SELECT DISTINCT Sector FROM empleado ORDER BY 1;
                    
select * from cargo;
select * from sector;

ALTER TABLE `empleado` 	ADD `IdSector` INT NOT NULL DEFAULT '0' AFTER `IdSucursal`, 
						ADD `IdCargo` INT NOT NULL DEFAULT '0' AFTER `IdSector`;

UPDATE empleado e JOIN cargo c ON (c.Cargo = e.Cargo) SET e.IdCargo = c.IdCargo;
UPDATE empleado e JOIN sector s ON (s.Sector = e.Sector) SET e.IdSector = s.IdSector;

ALTER TABLE `empleado` DROP `Cargo`;
ALTER TABLE `empleado` DROP `Sector`;

SELECT * FROM `empleado`;

/*Normalización tabla producto*/
ALTER TABLE `producto` ADD `IdTipoProducto` INT NOT NULL DEFAULT '0' AFTER `Precio`;

DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `IdTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `TipoProducto` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO tipo_producto (TipoProducto) SELECT DISTINCT Tipo FROM producto ORDER BY 1;

UPDATE producto p JOIN tipo_producto t ON (p.Tipo = t.TipoProducto) SET p.IdTipoProducto = t.IdTipoProducto;

SELECT * FROM `producto`;

ALTER TABLE `producto`
  DROP `Tipo`;
---------------
use modelo_negocio;

update cliente set 	Provincia = Uc_Words(TRIM(Provincia)),
					Localidad = Uc_Words(TRIM(Localidad));

update sucursal set Provincia = Uc_Words(TRIM(Provincia)),
					Localidad = Uc_Words(TRIM(Localidad));
                    
update proveedor set Provincia = Uc_Words(TRIM(Provincia)),
					Departamento = Uc_Words(TRIM(Departamento)),
					Ciudad = Uc_Words(TRIM(Ciudad));

/*Normalización Localidad Provincia*/
DROP TABLE IF EXISTS aux_Localidad;
CREATE TABLE IF NOT EXISTS aux_Localidad (
	Localidad_Original	VARCHAR(80),
	Provincia_Original	VARCHAR(50),
	Localidad_Normalizada	VARCHAR(80),
	Provincia_Normalizada	VARCHAR(50),
	IdLocalidad			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Notar la difernecia entre el UNION y el UNION ALL*/
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM cliente where Localidad = 'Avellaneda'
UNION
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM sucursal where Localidad = 'Avellaneda'
UNION
SELECT DISTINCT Ciudad, Provincia, Ciudad, Provincia, 0 FROM proveedor where Ciudad = 'Avellaneda'
ORDER BY 2, 1;

SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM cliente where Localidad = 'Avellaneda'
UNION ALL
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM sucursal where Localidad = 'Avellaneda'
UNION ALL
SELECT DISTINCT Ciudad, Provincia, Ciudad, Provincia, 0 FROM proveedor where Ciudad = 'Avellaneda'
ORDER BY 2, 1;

INSERT INTO aux_localidad (Localidad_Original, Provincia_Original, Localidad_Normalizada, Provincia_Normalizada, IdLocalidad)
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM cliente
UNION
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM sucursal
UNION
SELECT DISTINCT Ciudad, Provincia, Ciudad, Provincia, 0 FROM proveedor
ORDER BY 2, 1;

SELECT * FROM aux_localidad ORDER BY Provincia_Original;

UPDATE `aux_localidad` SET Provincia_Normalizada = 'Córdoba'
WHERE Provincia_Original IN ('Cã³rdoba',
                            'Córdoba');

UPDATE `aux_localidad` SET Provincia_Normalizada = 'Entre Ríos'
WHERE Provincia_Original IN ('Entre Rã­os',
                            'Entre Ríos');
                            
UPDATE `aux_localidad` SET Provincia_Normalizada = 'Neuquén'
WHERE Provincia_Original IN ('Neuquã©n',
                            'Neuquén');
                            
UPDATE `aux_localidad` SET Provincia_Normalizada = 'Tucumán'
WHERE Provincia_Original IN ('Tucumã¡n',
                            'Tucuman');

UPDATE `aux_localidad` SET Provincia_Normalizada = 'Buenos Aires'
WHERE Provincia_Original IN ('B. Aires',
                            'B.Aires',
                            'Bs As',
                            'Bs.As.',
                            'Buenos Aires',
                            'C Debuenos Aires',
                            'Caba',
                            'Ciudad De Buenos Aires',
                            'Pcia Bs As',
                            'Prov De Bs As.',
                            'Provincia De Buenos Aires');
							
UPDATE `aux_localidad` SET Localidad_Normalizada = 'Capital Federal'
WHERE Localidad_Original IN ('Boca De Atencion Monte Castro',
                            'Caba',
                            'Cap.   Federal',
                            'Cap. Fed.',
                            'Capfed',
                            'Capital',
                            'Capital Federal',
                            'Cdad De Buenos Aires',
                            'Ciudad De Buenos Aires')
AND Provincia_Normalizada = 'Buenos Aires';
							
UPDATE `aux_localidad` SET Localidad_Normalizada = 'Córdoba'
WHERE Localidad_Original IN ('Coroba',
							'Cã³rdoba',
                            'Cordoba',
							'Cã³rdoba')
AND Provincia_Normalizada = 'Córdoba';

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE IF NOT EXISTS `localidad` (
  `IdLocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `Localidad` varchar(80) NOT NULL,
  `Provincia` varchar(80) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  PRIMARY KEY (`IdLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE IF NOT EXISTS `provincia` (
  `IdProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `Provincia` varchar(50) NOT NULL,
  PRIMARY KEY (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO Localidad (Localidad, Provincia, IdProvincia)
SELECT	DISTINCT Localidad_Normalizada, Provincia_Normalizada, 0
FROM aux_localidad
ORDER BY Provincia_Normalizada, Localidad_Normalizada;

INSERT INTO provincia (Provincia)
SELECT DISTINCT Provincia_Normalizada
FROM aux_localidad
ORDER BY Provincia_Normalizada;

select * from provincia;
select * from localidad;

UPDATE localidad l JOIN provincia p
	ON (l.Provincia = p.Provincia)
SET l.IdProvincia = p.IdProvincia;

UPDATE aux_localidad a JOIN localidad l 
			ON (l.Localidad = a.Localidad_Normalizada
                AND a.Provincia_Normalizada = l.Provincia)
SET a.IdLocalidad = l.IdLocalidad;

select * from aux_localidad;

ALTER TABLE `cliente` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Localidad`;
ALTER TABLE `proveedor` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Departamento`;
ALTER TABLE `sucursal` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Provincia`;

UPDATE cliente c JOIN aux_localidad a
	ON (c.Provincia = a.Provincia_Original AND c.Localidad = a.Localidad_Original)
SET c.IdLocalidad = a.IdLocalidad;

UPDATE sucursal s JOIN aux_localidad a
	ON (s.Provincia = a.Provincia_Original AND s.Localidad = a.Localidad_Original)
SET s.IdLocalidad = a.IdLocalidad;

UPDATE proveedor p JOIN aux_localidad a
	ON (p.Provincia = a.Provincia_Original AND p.Ciudad = a.Localidad_Original)
SET p.IdLocalidad = a.IdLocalidad;

select * from cliente;
select * from proveedor;
select * from sucursal;

ALTER TABLE `cliente`
  DROP `Provincia`,
  DROP `Localidad`;
  
ALTER TABLE `proveedor`
  DROP `Ciudad`,
  DROP `Provincia`,
  DROP `Pais`,
  DROP `Departamento`;
  
ALTER TABLE `sucursal`
  DROP `Localidad`,
  DROP `Provincia`;
  
ALTER TABLE `localidad`
  DROP `Provincia`;
  
SELECT * FROM `cliente`;
SELECT * FROM `proveedor`;
SELECT * FROM `sucursal`;
SELECT * FROM `localidad`;
SELECT * FROM `provincia`;

/*Discretización*/
ALTER TABLE `cliente` ADD `Rango_Etario` VARCHAR(20) NOT NULL DEFAULT '-' AFTER `Edad`;

UPDATE cliente SET Rango_Etario = '1_Hasta 30 años' WHERE Edad <= 30;
UPDATE cliente SET Rango_Etario = '2_De 31 a 40 años' WHERE Edad <= 40 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '3_De 41 a 50 años' WHERE Edad <= 50 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '4_De 51 a 60 años' WHERE Edad <= 60 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '5_Desde 60 años' WHERE Edad > 60 AND Rango_Etario = '-';

select Rango_Etario, count(*)
from cliente
group by Rango_Etario
order by Rango_Etario;

/*Deteccion y corrección de Outliers sobre ventas*/
/*Motivos:
2-Outlier de Cantidad
3-Outlier de Precio
*/
-- Detección de outliers
SELECT IdProducto, avg(Precio) as promedio, avg(Precio) + (3 * stddev(Precio)) as maximo
from venta
GROUP BY IdProducto;

SELECT IdProducto, avg(Precio) as promedio, avg(Precio) - (3 * stddev(Precio)) as minimo
from venta
GROUP BY IdProducto;

-- Detección de Outliers
SELECT v.*, o.promedio, o.maximo, o.minimo
from venta v
JOIN (SELECT IdProducto, avg(Precio) as promedio, avg(Precio) + (3 * stddev(Precio)) as maximo,
						avg(Precio) - (3 * stddev(Precio)) as minimo
	from venta
	GROUP BY IdProducto) o
ON (v.IdProducto = o.IdProducto)
WHERE v.Precio > o.maximo OR v.Precio < minimo;
SELECT *
FROM venta
WHERE IdProducto = 42890;
SELECT v.*, o.promedio, o.maximo, o.minimo
from venta v
JOIN (SELECT IdProducto, avg(Cantidad) as promedio, avg(Cantidad) + (3 * stddev(Cantidad)) as maximo,
						avg(Cantidad) - (3 * stddev(Cantidad)) as minimo
	from venta
	GROUP BY IdProducto) o
ON (v.IdProducto = o.IdProducto)
WHERE v.Cantidad > o.maximo OR v.Cantidad < o.minimo;

-- Introducimos los outliers de cantidad en la tabla aux_venta
INSERT into aux_venta
select v.IdVenta, v.Fecha, v.Fecha_Entrega, v.IdCliente, v.IdSucursal, v.IdEmpleado,
v.IdProducto, v.Precio, v.Cantidad, 2
from venta v
JOIN (SELECT IdProducto, avg(Cantidad) as promedio, stddev(Cantidad) as Desv
	from venta
	GROUP BY IdProducto) v2
ON (v.IdProducto = v2.IdProducto)
WHERE v.Cantidad > (v2.Promedio + (3*v2.Desv)) OR v.Cantidad < (v2.Promedio - (3*v2.Desv)) OR v.Cantidad < 0;
-- Introducimos los outliers de precio en la tabla aux_venta
INSERT into aux_venta
select v.IdVenta, v.Fecha, v.Fecha_Entrega, v.IdCliente, v.IdSucursal,
v.IdEmpleado, v.IdProducto, v.Precio, v.Cantidad, 3
from venta v
JOIN (SELECT IdProducto, avg(Precio) as promedio, stddev(Precio) as Desv
	from venta
	GROUP BY IdProducto) v2
ON (v.IdProducto = v2.IdProducto)
WHERE v.Precio > (v2.Promedio + (3*v2.Desv)) OR v.Precio < (v2.Promedio - (3*v2.Desv)) OR v.Precio < 0;

select * from aux_venta where Motivo = 2; -- outliers de cantidad
select * from aux_venta where Motivo = 3; -- outliers de precio

ALTER TABLE `venta` ADD `Outlier` TINYINT NOT NULL DEFAULT '1' AFTER `Cantidad`;

UPDATE venta v JOIN aux_venta a
	ON (v.IdVenta = a.IdVenta AND a.Motivo IN (2,3))
SET v.Outlier = 0;

SELECT 	co.TipoProducto,
		co.PromedioVentaConOutliers,
        so.PromedioVentaSinOutliers
FROM
	(SELECT 	tp.TipoProducto,
			AVG(v.Precio * v.Cantidad) as PromedioVentaConOutliers
	FROM 	venta v JOIN producto p
		ON (v.IdProducto = p.IdProducto)
			JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
	GROUP BY tp.TipoProducto) co
JOIN
	(SELECT 	tp.TipoProducto,
			AVG(v.Precio * v.Cantidad) as PromedioVentaSinOutliers
	FROM 	venta v JOIN producto p
		ON (v.IdProducto = p.IdProducto and v.Outlier = 1)
			JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
	GROUP BY tp.TipoProducto) so
ON co.TipoProducto = so.TipoProducto;

-- KPI: Margen de Ganancia por producto superior a 20%
SELECT 	venta.Producto, 
		venta.SumaVentas, 
        venta.CantidadVentas, 
        venta.SumaVentasOutliers,
        compra.SumaCompras, 
        compra.CantidadCompras,
        ((venta.SumaVentas / compra.SumaCompras - 1) * 100) as margen
FROM
	(SELECT 	p.Producto,
			SUM(v.Precio * v.Cantidad * v.Outlier) 	as 	SumaVentas,
			SUM(v.Outlier) 							as	CantidadVentas,
			SUM(v.Precio * v.Cantidad) 				as 	SumaVentasOutliers,
			COUNT(*) 								as	CantidadVentasOutliers
	FROM venta v JOIN producto p
		ON (v.IdProducto = p.IdProducto
			AND YEAR(v.Fecha) = 2019)
	GROUP BY p.Producto) AS venta
JOIN
	(SELECT 	p.Producto,
			SUM(c.Precio * c.Cantidad) 				as SumaCompras,
			COUNT(*)								as CantidadCompras
	FROM compra c JOIN producto p
		ON (c.IdProducto = p.IdProducto
			AND YEAR(c.Fecha) = 2019)
	GROUP BY p.Producto) as compra
ON (venta.Producto = compra.Producto);

/*KPIs: Correccion Latitud y Longitud para evaluar la demora en la entrega teniendo den cuenta tambien la distancia*/
ALTER TABLE `localidad` ADD `Latitud` DOUBLE NOT NULL DEFAULT '0' AFTER `IdProvincia`, ADD `Longitud` DOUBLE NOT NULL DEFAULT '0' AFTER `Latitud`;

DROP TABLE IF EXISTS aux_cliente;
CREATE TABLE IF NOT EXISTS aux_cliente (
	IdCliente			INTEGER,
	Latitud				DOUBLE,
	Longitud			DOUBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO aux_cliente (IdCliente, Latitud, Longitud)
SELECT 	IdCliente, Latitud, Longitud
FROM cliente WHERE Latitud < -55;

UPDATE cliente c JOIN aux_cliente ac
	ON (c.IdCliente = ac.IdCliente)
SET c.Latitud = ac.Longitud, c.Longitud = ac.Latitud;

UPDATE `cliente` SET Latitud = Latitud * -1 WHERE Latitud > 0;
UPDATE `cliente` SET Longitud = Longitud * -1 WHERE Longitud > 0;

UPDATE localidad l 
	JOIN (	SELECT IdLocalidad, AVG(Latitud) AS Latitud
			FROM cliente WHERE Latitud <> 0 
			GROUP BY IdLocalidad) c
	ON (l.IdLocalidad = c.IdLocalidad)
SET l.Latitud = c.Latitud;

UPDATE localidad l 
	JOIN (	SELECT IdLocalidad, AVG(Longitud) AS Longitud
			FROM cliente WHERE Longitud <> 0 
			GROUP BY IdLocalidad) c
	ON (l.IdLocalidad = c.IdLocalidad)
SET l.Longitud = c.Longitud;

UPDATE cliente c JOIN localidad l
	ON (c.IdLocalidad = l.IdLocalidad)
SET c.Latitud = l.Latitud
WHERE c.Latitud = 0;

UPDATE cliente c JOIN localidad l
	ON (c.IdLocalidad = l.IdLocalidad)
SET c.Longitud = l.Longitud
WHERE c.Longitud = 0; 

SELECT v.*, SQRT( (c.Latitud - s.Latitud) * (c.Latitud - s.Latitud) + (c.Longitud - s.Longitud) * (c.Longitud - s.Longitud) ) * 111.1 as Dist
FROM venta v JOIN cliente c
		ON (v.IdCliente = c.IdCliente)
    JOIN sucursal s
    	ON (v.IdSucursal = s.IdSucursal);
------------
use modelo_negocio;

SELECT 	p.Provincia,
		l.Localidad,
		c.Rango_Etario,
		SUM(v.Precio * v.Cantidad) AS Venta
FROM venta v JOIN cliente c
		ON (v.IdCliente = c.IdCliente)
			-- AND v.Outlier = 1
			-- AND YEAR(v.Fecha) = 2020) -- OP1
    JOIN localidad l
		ON (c.IdLocalidad = l.IdLocalidad)
	JOIN provincia p
		ON (l.IdProvincia = p.IdProvincia)
WHERE YEAR(v.Fecha) = 2020 -- OP2
GROUP BY p.Provincia, l.Localidad, c.Rango_Etario
ORDER BY p.Provincia, l.Localidad, c.Rango_Etario;
-- Antes del indice 4.3s
-- OP1 = 3.8s
-- OP2 = 3.9s

-- Después del indice 0.2s
-- OP1 = 0.03s
-- OP2 = 0.04s

SELECT 	pr.Provincia,
		l.Localidad,
        tp.TipoProducto,
		SUM(v.Precio * v.Cantidad) AS Venta
FROM venta v JOIN producto p
		ON (v.IdProducto = p.IdProducto)
	JOIN tipo_producto tp
		ON (tp.IdTipoProducto = p.IdTipoProducto)
	JOIN cliente c
		ON (v.IdCliente = c.IdCliente)
    JOIN localidad l
		ON (c.IdLocalidad = l.IdLocalidad)
	JOIN provincia pr
		ON (l.IdProvincia = pr.IdProvincia)
GROUP BY pr.Provincia, l.Localidad, tp.TipoProducto
ORDER BY pr.Provincia, l.Localidad, tp.TipoProducto;
-- Antes del indice 0.8s
-- Después del índice 0.3s

select * from venta;

SELECT 	venta.Producto, 
		venta.SumaVentas, 
        venta.CantidadVentas, 
        venta.SumaVentasOutliers,
        compra.SumaCompras, 
        compra.CantidadCompras,
        ((venta.SumaVentas / compra.SumaCompras - 1) * 100) as margen
FROM
	(SELECT p.Producto,
			SUM(v.Precio * v.Cantidad * v.Outlier) 	as 	SumaVentas,
			SUM(v.Outlier) 							as	CantidadVentas,
			SUM(v.Precio * v.Cantidad) 				as 	SumaVentasOutliers,
			COUNT(*) 								as	CantidadVentasOutliers
	FROM venta v JOIN producto p
		ON (v.IdProducto = p.IdProducto
			AND YEAR(v.Fecha) = 2019)
	GROUP BY p.Producto) AS venta
JOIN
	(SELECT 	p.Producto,
			SUM(c.Precio * c.Cantidad) 				as SumaCompras,
			COUNT(*)								as CantidadCompras
	FROM compra c JOIN producto p
		ON (c.IdProducto = p.IdProducto
			AND YEAR(c.Fecha) = 2019)
	GROUP BY p.Producto) as compra
ON (venta.Producto = compra.Producto);

-- 0.15s

/*Creamos indices de las tablas determinando claves primarias y foraneas*/
ALTER TABLE `venta` ADD PRIMARY KEY(`IdVenta`);
ALTER TABLE `venta` ADD INDEX(`IdProducto`);
ALTER TABLE `venta` ADD INDEX(`IdEmpleado`);
ALTER TABLE `venta` ADD INDEX(`Fecha`);
ALTER TABLE `venta` ADD INDEX(`Fecha_Entrega`);
ALTER TABLE `venta` ADD INDEX(`IdCliente`);
ALTER TABLE `venta` ADD INDEX(`IdSucursal`);
ALTER TABLE `venta` ADD INDEX(`IdCanal`);

ALTER TABLE `canal_venta` ADD PRIMARY KEY(`IdCanal`);

ALTER TABLE `producto` ADD PRIMARY KEY(`IdProducto`);
ALTER TABLE `producto` ADD INDEX(`IdTipoProducto`);

ALTER TABLE `sucursal` ADD PRIMARY KEY(`IdSucursal`);
ALTER TABLE `sucursal` ADD INDEX(`IdLocalidad`);

ALTER TABLE `empleado` ADD PRIMARY KEY(`CodigoEmpleado`); -- Esto da error de clave duplicada
ALTER TABLE `empleado` ADD PRIMARY KEY(`IdEmpleado`);
ALTER TABLE `empleado` ADD INDEX(`IdSucursal`);
ALTER TABLE `empleado` ADD INDEX(`IdSector`);
ALTER TABLE `empleado` ADD INDEX(`IdCargo`);

ALTER TABLE `localidad` ADD INDEX(`IdProvincia`);

ALTER TABLE `proveedor` ADD PRIMARY KEY(`IdProveedor`);
ALTER TABLE `proveedor` ADD INDEX(`IdLocalidad`);

ALTER TABLE `gasto` ADD PRIMARY KEY(`IdGasto`);
ALTER TABLE `gasto` ADD INDEX(`IdSucursal`);
ALTER TABLE `gasto` ADD INDEX(`IdTipoGasto`);
ALTER TABLE `gasto` ADD INDEX(`Fecha`);

ALTER TABLE `cliente` ADD PRIMARY KEY(`IdCliente`);
ALTER TABLE `cliente` ADD INDEX(`IdLocalidad`);

ALTER TABLE `compra` ADD PRIMARY KEY(`IdCompra`);
ALTER TABLE `compra` ADD INDEX(`Fecha`);
ALTER TABLE `compra` ADD INDEX(`IdProducto`);
ALTER TABLE `compra` ADD INDEX(`IdProveedor`);

DROP INDEX IdCliente ON venta;
ALTER TABLE `venta` ADD INDEX(`IdCliente`);

/*Creamos las relaciones entre las tablas, y con ellas las restricciones*/
ALTER TABLE venta ADD CONSTRAINT `venta_fk_cliente` FOREIGN KEY (IdCliente) REFERENCES cliente (IdCliente) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE venta ADD CONSTRAINT `venta_fk_sucursal` FOREIGN KEY (IdSucursal) REFERENCES sucursal (IdSucursal) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE venta ADD CONSTRAINT `venta_fk_producto` FOREIGN KEY (IdProducto) REFERENCES producto (IdProducto) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE venta ADD CONSTRAINT `venta_fk_empleado` FOREIGN KEY (IdEmpleado) REFERENCES empleado (IdEmpleado) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE venta ADD CONSTRAINT `venta_fk_canal` FOREIGN KEY (IdCanal) REFERENCES canal_venta (IdCanal) ON DELETE RESTRICT ON UPDATE RESTRICT;

select * from venta where IdCliente = 969;
delete from cliente where IdCliente = 969; -- No me deja porque está creada la restricción

select * from cliente where IdCliente NOT IN (SELECT IdCliente FROM venta);
delete from cliente where IdCliente = 443; -- Me deja, está creada la restricción, pero no existe el cliente en ventas

ALTER TABLE producto ADD CONSTRAINT `producto_fk_tipoproducto` FOREIGN KEY (IdTipoProducto) REFERENCES tipo_producto (IdTipoProducto) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE empleado ADD CONSTRAINT `empleado_fk_sector` FOREIGN KEY (IdSector) REFERENCES sector (IdSector) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE empleado ADD CONSTRAINT `empleado_fk_cargo` FOREIGN KEY (IdCargo) REFERENCES cargo (IdCargo) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE empleado ADD CONSTRAINT `empleado_fk_sucursal` FOREIGN KEY (IdSucursal) REFERENCES sucursal (IdSucursal) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE cliente ADD CONSTRAINT `cliente_fk_localidad` FOREIGN KEY (IdLocalidad) REFERENCES localidad (IdLocalidad) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE proveedor ADD CONSTRAINT `proveedor_fk_localidad` FOREIGN KEY (IdLocalidad) REFERENCES localidad (IdLocalidad) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE sucursal ADD CONSTRAINT `sucursal_fk_localidad` FOREIGN KEY (IdLocalidad) REFERENCES localidad (IdLocalidad) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE localidad ADD CONSTRAINT `localidad_fk_provincia` FOREIGN KEY (IdProvincia) REFERENCES provincia (IdProvincia) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE compra ADD CONSTRAINT `compra_fk_producto` FOREIGN KEY (IdProducto) REFERENCES producto (IdProducto) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE compra ADD CONSTRAINT `compra_fk_proveedor` FOREIGN KEY (IdProveedor) REFERENCES proveedor (IdProveedor) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE gasto ADD CONSTRAINT `gasto_fk_sucursal` FOREIGN KEY (IdSucursal) REFERENCES sucursal (IdSucursal) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE gasto ADD CONSTRAINT `gasto_fk_tipogasto` FOREIGN KEY (IdTipoGasto) REFERENCES tipo_gasto (IdTipoGasto) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ALTER TABLE gasto DROP CONSTRAINT `gasto_fk_tipogasto`;

ALTER TABLE venta ADD CONSTRAINT `venta_fk_fecha` FOREIGN KEY (fecha) REFERENCES calendario (fecha) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE compra ADD CONSTRAINT `compra_fk_fecha` FOREIGN KEY (Fecha) REFERENCES calendario (fecha) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE gasto ADD CONSTRAINT `gasto_fk_fecha` FOREIGN KEY (Fecha) REFERENCES calendario (fecha) ON DELETE RESTRICT ON UPDATE RESTRICT;

/*Cracion de Tablas de Hechos para modelo Estrella*/
DROP TABLE IF EXISTS `fact_venta`;
CREATE TABLE IF NOT EXISTS `fact_venta` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCanal`				INTEGER, 
  `IdCliente`			INTEGER, 
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				DECIMAL(15,3),
  `Cantidad`			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO fact_venta
SELECT IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad
FROM venta
WHERE YEAR(Fecha) = 2020;

ALTER TABLE `fact_venta` ADD PRIMARY KEY(`IdVenta`);
ALTER TABLE `fact_venta` ADD INDEX(`IdProducto`);
ALTER TABLE `fact_venta` ADD INDEX(`IdEmpleado`);
ALTER TABLE `fact_venta` ADD INDEX(`Fecha`);
ALTER TABLE `fact_venta` ADD INDEX(`Fecha_Entrega`);
ALTER TABLE `fact_venta` ADD INDEX(`IdCliente`);
ALTER TABLE `fact_venta` ADD INDEX(`IdCanal`);

DROP TABLE IF EXISTS dim_cliente;
CREATE TABLE IF NOT EXISTS dim_cliente (
	IdCliente			INTEGER,
	Nombre_y_Apellido	VARCHAR(80),
	Domicilio			VARCHAR(150),
	Telefono			VARCHAR(30),
	Rango_Etario		VARCHAR(20),
	IdLocalidad			INTEGER,
	Latitud				DECIMAL(13,10),
	Longitud			DECIMAL(13,10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO dim_cliente
SELECT IdCliente, Nombre_y_Apellido, Domicilio, Telefono, Rango_Etario, IdLocalidad, Latitud, Longitud
FROM cliente
WHERE IdCliente IN (SELECT distinct IdCliente FROM fact_venta);

DROP TABLE IF EXISTS dim_producto;
CREATE TABLE IF NOT EXISTS dim_producto (
	IdProducto					INTEGER,
	Producto					VARCHAR(100),
	IdTipoProducto				VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO dim_producto
SELECT IdProducto, Producto, IdTipoProducto
FROM producto
WHERE IdProducto IN (SELECT distinct IdProducto FROM fact_venta);
----------------
use modelo_negocio;
-- 1) Creamos la tabla que auditará a los usuarios que realizan cambios
DROP TABLE IF EXISTS `fact_venta_auditoria`;
CREATE TABLE IF NOT EXISTS `fact_venta_auditoria` (
	`Fecha`				DATE,
	`Fecha_Entrega`		DATE,
  	`IdCanal` 			INTEGER,
  	`IdCliente` 		INTEGER,
  	`IdEmpleado` 		INTEGER,
  	`IdProducto` 		INTEGER,
    `usuario` 			VARCHAR(20),
    `fechaModificacion` 	DATETIME
);

-- Creamos el trigger que se ejecutara luego de cada cambio
DROP TRIGGER fact_venta_auditoria;
CREATE TRIGGER fact_venta_auditoria AFTER INSERT ON fact_venta
FOR EACH ROW
INSERT INTO fact_venta_auditoria (Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, usuario, fechaModificacion)
VALUES (NEW.Fecha, NEW.Fecha_Entrega, NEW.IdCanal, NEW.IdCliente, NEW.IdEmpleado, NEW.IdProducto, CURRENT_USER,NOW());

select CURRENT_USER,NOW();

truncate table fact_venta;
-- truncate table fact_venta_auditoria;

-- 2)

insert into fact_venta (IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad)
select IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad
from venta;

select count(*) from fact_venta;
select count(*) from fact_venta_auditoria;

-- 3) Creamos la tabla que llevara una cuenta de los registros.
DROP TABLE IF EXISTS `fact_venta_registros`;
CREATE TABLE IF NOT EXISTS `fact_venta_registros` (
  	id 	INT NOT NULL AUTO_INCREMENT,
	cantidadRegistros INT,
	usuario VARCHAR (20),
	fecha DATETIME,
	PRIMARY KEY (id)
);

-- 4) Creamos el trigger que se ejecutara luego de cada cambio
DROP TRIGGER fact_venta_registros;
CREATE TRIGGER fact_venta_registros
AFTER INSERT ON fact_venta
FOR EACH ROW
INSERT INTO fact_inicial_registros (cantidadRegistros,usuario, fecha)
VALUES ((SELECT COUNT(*) FROM fact_venta),CURRENT_USER,NOW());

-- 5) Creamos una tabla donde podremos almacenar la cantidad de registros por día
DROP TABLE registros_tablas;
CREATE TABLE registros_tablas (
id INT NOT NULL AUTO_INCREMENT,
tabla VARCHAR(30),
fecha DATETIME,
cantidadRegistros INT,
PRIMARY KEY (id)
);

-- Esta instrucción nos permite cargar la tabla anterior y saber cual es la cantidad de registros por día.
INSERT INTO registros_tablas (tabla, fecha, cantidadRegistros)
SELECT 'venta', Now(), COUNT(*) FROM venta;
INSERT INTO registros_tablas (tabla, fecha, cantidadRegistros)
SELECT 'gasto', Now(), COUNT(*) FROM gasto;
INSERT INTO registros_tablas (tabla, fecha, cantidadRegistros)
SELECT 'compra', Now(), COUNT(*) FROM compra;

SELECT * FROM registros_tablas;
show triggers;

SELECT DATE('2011-01-01 00:00:10');

-- 6) Creamos una tabla para auditar cambios
DROP TABLE IF EXISTS `fact_venta_cambios`;
CREATE TABLE IF NOT EXISTS `fact_venta_cambios` (
  	`Fecha` 			DATE,
  	`IdCliente` 		INTEGER,
  	`IdProducto` 		INTEGER,
    `Precio` 			DECIMAL(15,3),
    `Cantidad` 			INTEGER
);

-- Creamos el trigger que carga nuevos registros
DROP TRIGGER auditoria_cambios;
CREATE TRIGGER auditoria_cambios AFTER UPDATE ON fact_venta
FOR EACH ROW
INSERT INTO fact_venta_cambios (Fecha, IdCliente, IdProducto, Precio, Cantidad)
VALUES (OLD.Fecha,OLD.IdCliente, OLD.IdProducto, OLD.Precio, OLD.Cantidad);

-- 7)

SELECT * FROM fact_venta_cambios;
select * from fact_venta where IdVenta = 1;
update fact_venta set Precio = 820 where IdVenta = 1;

-- Variante para los puntos 6 y 7
-- Creamos el trigger que carga cambios en los registros
DROP TRIGGER auditoria_actualizacion;
CREATE TRIGGER auditoria_actualizacion AFTER UPDATE ON fact_venta
FOR EACH ROW
UPDATE fact_venta_cambios
SET 
IdCliente = OLD.IdCliente, 
IdProducto = OLD.IdProducto,
IdCliente1 = NEW.IdCliente, 
IdProducto1 = NEW.IdProducto
WHERE Fecha = OLD.Fecha;
--------------------------
-- Solución de Homework.
use modelo_negocio;
-- 1)
DROP PROCEDURE listaProductos;
DELIMITER $$
CREATE PROCEDURE listaProductos(IN fechaVenta DATE)
BEGIN
	Select distinct tp.TipoProducto, p.Producto
	From fact_venta v join dim_producto p
			On (v.IdProducto = p.IdProducto
				And v.Fecha = fechaVenta)
		join tipo_producto tp
			On (p.idTipoProducto = tp.IdTipoProducto)
	Order by tp.TipoProducto, p.Producto;
END $$
DELIMITER;

CALL listaProductos('2020-01-01');

-- 2)
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION margenBruto;

DELIMITER $$
CREATE FUNCTION margenBruto(precio DECIMAL(15,3), margen DECIMAL (9,2)) RETURNS DECIMAL (15,3)
BEGIN
	DECLARE margenBruto DECIMAL (15,3);
    
    SET margenBruto = precio * margen;
    
    RETURN margenBruto;
END$$

DELIMITER ;

Select margenBruto(100.50, 1.2);

Select 	c.Fecha,
		pr.Nombre					as Proveedor,
		p.Producto,
		c.Precio 					as PrecioCompra,
        margenBruto(c.Precio, 1.3)	as PrecioMargen
From 	compra c Join producto p
			On (c.IdProducto = p.IdProducto)
		Join proveedor pr
			On (c.IdProveedor = pr.IdProveedor);

SELECT 	Producto, 
		margenBruto(Precio, 1.30) AS Margen
FROM producto;

-- 3)
SELECT 	p.IdProducto, 
		p.Producto,
        p.Precio,
        margenBruto(Precio, 1.3) AS PrecioMargen
FROM producto p join tipo_producto tp
	On (p.IdTipoProducto = tp.IdTipoProducto
		And TipoProducto = 'Impresión');
     
SELECT 	IdProducto, 
		precio as PrecioVenta, 
        ROUND(precio * ( (100 + 10) /100 ), 2) AS PrecioFinal
FROM compra;

DELIMITER $$
CREATE PROCEDURE MargenbrutoJ(IN porcent int)
BEGIN
    /*SELECT IdProducto, precio as PrecioVenta, ROUND(precio /((100 - porcent)/100),2) AS PrecioFinal
    FROM compra;
    */
    SELECT IdProducto, precio as PrecioVenta, ROUND(precio * ( (100 + porcent) /100 ), 2) AS PrecioFinal
    FROM compra;
END $$
DELIMITER ;

CALL MargenbrutoJ(30);
-- 4)
DROP PROCEDURE listaCategoria;

DELIMITER $$
CREATE PROCEDURE listaCategoria(IN categoria VARCHAR (25))
BEGIN
	SELECT 	v.Fecha,
			v.Fecha_Entrega,
			v.IdCliente,
			v.IdCanal,
			v.IdSucursal,
			tp.TipoProducto,
			p.Producto,
			v.Precio,
			v.Cantidad
	FROM venta v join producto p
			On (v.IdProducto = p.idProducto
				And v.Outlier = 1)
		Join tipo_producto tp
			On (p.IdTipoProducto = tp.IdTipoProducto
				And TipoProducto collate utf8mb4_spanish_ci LIKE Concat('%', categoria, '%'));
                -- And TipoProducto = categoria);
END $$
DELIMITER ;

CALL listaCategoria('i');

-- 5)
DROP PROCEDURE cargarFact_venta;

DELIMITER $$
CREATE PROCEDURE cargarFact_venta()
BEGIN
	TRUNCATE table fact_venta;

    INSERT INTO fact_venta (IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad)
    SELECT	IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad
    FROM 	venta
    WHERE  	Outlier = 1;
END $$
DELIMITER ;

CALL cargarFact_venta();

SHOW TRIGGERS;
-- DROP TRIGGER modelo_negocio.fact_venta_registros;
-- 6)

SELECT 	c.Rango_Etario, 
		sum(v.Precio*v.Cantidad) 	AS Total_Ventas
FROM fact_venta v
	INNER JOIN dim_cliente c
		ON (v.IdCliente = c.IdCliente
			and c.Rango_Etario collate utf8mb4_spanish_ci = '2_De 31 a 40 años')
GROUP BY c.Rango_Etario;
    
DROP PROCEDURE ventasGrupoEtario; 

DELIMITER $$
CREATE PROCEDURE ventasGrupoEtario(IN grupo VARCHAR(25))
BEGIN
	SELECT 	c.Rango_Etario, 
			sum(v.Precio*v.Cantidad) 	AS Total_Ventas
	FROM fact_venta v
		INNER JOIN dim_cliente c
			ON (v.IdCliente = c.IdCliente
				and c.Rango_Etario collate utf8mb4_spanish_ci like Concat('%', grupo, '%'))
	GROUP BY c.Rango_Etario;
END $$
DELIMITER ;

SELECT DISTINCT Rango_Etario FROM dim_cliente;

CALL ventasGrupoEtario('31%40');

-- 7)

SET @grupo = '2_De 31 a 40 años';

SELECT *
FROM dim_cliente
WHERE Rango_Etario collate utf8mb4_spanish_ci = @grupo
LIMIT 10;
-----------------------------
use modelo_negocio;
-- 1
SELECT DISTINCT Nombre_y_Apellido, IdProducto, Precio 
FROM fact_venta
LEFT JOIN dim_cliente
ON fact_venta.IdCliente = dim_cliente.IdCliente;

-- 2
-- select count(*) from (
SELECT c.IdCliente, c.Nombre_y_Apellido, SUM(ifnull(v.Cantidad,0)) AS Q_Productos_Adquiridos, SUM(v.Cantidad) as q2
FROM cliente c
LEFT JOIN venta v
	ON (v.IdCliente = c.IdCliente)
GROUP BY c.IdCliente, c.Nombre_y_Apellido
ORDER BY SUM(ifnull(v.Cantidad,0));
 -- ) as a;

select count(*) from cliente;
select Nombre_y_Apellido, count(*) from cliente group by Nombre_y_Apellido having count(*) > 1;
select ifnull(null, 0);
select * from cliente where nombre_y_apellido = 'Rodolfo Horacio Silveira';

-- 3
-- select count(*) from (
SELECT c.IdCliente, c.Nombre_y_Apellido, YEAR(v.Fecha), COUNT(v.IdVenta) AS Total_compras
FROM venta v
	/*INNER JOIN canal_venta cv
		ON (v.idCanal = cv.IdCanal
			And cv.Canal like '%OnLine%')*/
	INNER JOIN cliente c
		ON (c.IdCliente = v.IdCliente)
GROUP BY c.Nombre_y_Apellido, YEAR(v.Fecha)
ORDER BY YEAR(v.Fecha) DESC, c.IdCliente;
-- ) as c;
-- 10409 registros

SELECT c.IdCliente, c.Nombre_y_Apellido, YEAR(v.Fecha), COUNT(v.IdVenta) AS Total_compras
FROM venta v
	INNER JOIN cliente c
		ON (c.IdCliente = v.IdCliente)
	INNER JOIN canal_venta cv
		ON (v.idCanal = cv.IdCanal
			And cv.Canal like '%OnLine%')
GROUP BY c.Nombre_y_Apellido, YEAR(v.Fecha)
ORDER BY YEAR(v.Fecha) DESC, c.IdCliente;
select * from canal_venta;

-- 4
SELECT 	c.IdCliente, 
		c.Nombre_y_Apellido, 
		p.IdProducto, 
        p.Producto,
        SUM(v.Cantidad) 		AS Q_productos, 
        ROUND(AVG(v.Precio),2) 	AS precio_promedio 
FROM venta v
	INNER JOIN producto p
		ON (v.IdProducto = p.IdProducto)
	INNER JOIN cliente c
		ON (v.IdCliente = c.IdCliente)
GROUP BY c.IdCliente, 
		c.Nombre_y_Apellido, 
		p.IdProducto, 
        p.Producto;

-- 5
SELECT 	p.Provincia, 
		l.Localidad, 
        sum(v.Cantidad) 			as Q_Productos_Vendidos, 
        sum(v.Precio*v.Cantidad) 	AS Total_Ventas,
        count(v.IdVenta)			as Volumen_Ventas
FROM venta v 
-- LEFT JOIN sucursal cl ON (v.IdSucursal = cl.IdSucursal)
LEFT JOIN cliente cl ON (v.IdCliente = cl.IdCliente)
LEFT JOIN localidad l
	ON (l.IdLocalidad = cl.IdLocalidad)
LEFT JOIN provincia p
	ON (l.IdProvincia = p.IdProvincia)
WHERE v.Outlier = 1
-- AND l.Localidad = 'Malvinas Argentinas'
GROUP BY p.IdProvincia, p.Provincia, l.IdLocalidad, l.Localidad
ORDER BY p.Provincia, l.Localidad;

select * from venta where IdVenta = 47878;
select * from sucursal where idSucursal = 25;
select * from localidad where IdLocalidad = 346;
select * from provincia where IdProvincia = 2;

SELECT Localidad FROM localidad group by localidad having count(*) > 1;
select * from localidad where Localidad = 'San Roque';

-- 6
SELECT 	p.Provincia, 
        sum(v.Cantidad) 			as Q_Productos_Vendidos, 
        sum(v.Precio*v.Cantidad) 	AS Total_Ventas,
        count(v.IdVenta)			as Volumen_Ventas
FROM venta v 
-- LEFT JOIN sucursal cl ON (v.IdSucursal = cl.IdSucursal)
LEFT JOIN cliente cl ON (v.IdCliente = cl.IdCliente)
LEFT JOIN localidad l
	ON (l.IdLocalidad = cl.IdLocalidad)
LEFT JOIN provincia p
	ON (l.IdProvincia = p.IdProvincia)
WHERE v.Outlier = 1
GROUP BY p.IdProvincia, p.Provincia
HAVING sum(v.Precio*v.Cantidad) > 100000
ORDER BY p.Provincia;
/*
Buenos Aires	68048	92363138.430	33840
Córdoba	3457	4536321.210	1740
Entre Ríos	173	177748.980	88
Mendoza	9834	12867893.370	4942
Neuquén	1311	1714441.440	656
Santa Fe	2898	4671396.980	1464
Sin Dato	1137	1273153.010	578
Tucumán	3548	4995035.050	1761
*/

-- 7
SELECT 	c.Rango_Etario, 
		SUM(v.Cantidad) 					AS Q_productos, 
        ROUND(SUM(v.Precio*v.Cantidad),2) 	AS Total_Ventas
FROM venta v
	INNER JOIN cliente c
		ON (v.IdCliente = c.IdCliente
			and v.Outlier = 1)
GROUP BY c.Rango_Etario
ORDER BY c.Rango_Etario;

-- 8
SELECT	p.IdProvincia,
		p.Provincia,
		COUNT(cl.IdCliente)	as Q_Clientes
FROM 	provincia p 
	LEFT JOIN localidad l
		ON (p.IdProvincia = l.IdProvincia)
	LEFT JOIN cliente cl
		ON (l.IdLocalidad = cl.IdLocalidad)
GROUP BY p.IdProvincia, p.Provincia
ORDER BY p.Provincia;

select * from provincia;

select * from cliente
where idlocalidad in (select 	l.IdLocalidad
						from 	localidad l join provincia p
							on (l.IdProvincia = p.idProvincia and p.Provincia = 'Santa Fé'));

select 	l.IdLocalidad
from 	localidad l join provincia p
	on (l.IdProvincia = p.idProvincia and p.Provincia = 'Santa Fé');
    
ALTER VIEW v_Provincias_Q_Clientes AS
SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia;
    
SELECT * FROM v_Provincias_Q_Clientes;

SELECT * FROM 
(SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia) AS c;
    ----------------------------
    -- 1) 
SELECT 	co.TipoProducto,
		co.PromedioVentaConOutliers,
        so.PromedioVentaSinOutliers
FROM
	(	SELECT 	tp.TipoProducto, AVG(v.Precio * v.Cantidad) as PromedioVentaConOutliers
		FROM 	venta v 
		JOIN producto p
		ON (v.IdProducto = p.IdProducto)
		JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
		GROUP BY tp.TipoProducto
	) co
JOIN
	(	SELECT 	tp.TipoProducto, AVG(v.Precio * v.Cantidad) as PromedioVentaSinOutliers
		FROM 	venta v 
		JOIN producto p
		ON (v.IdProducto = p.IdProducto and v.Outlier = 1)
		JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
		GROUP BY tp.TipoProducto
	) so
ON co.TipoProducto = so.TipoProducto;

-- 2)
SELECT Precio * Cantidad AS Total_Ventas
FROM fact_venta
LEFT JOIN dim_prodcuto
	ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MAX(Fecha)
				FROM fact_venta );

SELECT Precio * Cantidad AS Total_Ventas
FROM fact_venta
LEFT JOIN dim_prodcuto
ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MIN(Fecha)
				FROM fact_venta );

-- 3) 
SELECT fact_venta.IdProducto, Producto, Precio * Cantidad AS Total_Ventas
FROM fact_venta
	LEFT JOIN dim_prodcuto
ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MAX(Fecha)
				FROM fact_venta )
GROUP BY fact_venta.IdProducto, Producto;

SELECT fact_venta.IdProducto, Producto, Precio * Cantidad AS Total_Ventas
FROM fact_venta
LEFT JOIN dim_prodcuto
ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MIN(Fecha)
				FROM fact_venta )
GROUP BY fact_venta.IdProducto, Producto;

-- 4)
SELECT Fecha, Precio * Cantidad AS Total_Ventas
FROM fact_venta
GROUP BY Fecha;

SELECT Fecha, MAX(Total_Ventas)
FROM (	SELECT Fecha, Precio * Cantidad AS Total_Ventas
		FROM fact_venta
		GROUP BY Fecha) AS ventas
GROUP BY Fecha;

-- 5)
SELECT	c1.IdProvincia,
		c1.Provincia,
        c1.Q_Clientes,
        c2.Q_Clientes,
        ROUND(c1.Q_Clientes / c2.Q_Clientes * 100, 2) AS Porcentaje        
FROM
	(SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(DISTINCT cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
		INNER JOIN venta v
			ON (cl.IdCliente = v.IdCliente
				AND Outlier = 1)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia) c1
JOIN
	(SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia) c2
ON	(c1.IdProvincia = c2.IdProvincia);

-- 6)
SELECT 	IdProducto, 
		ROUND(AVG(Diferencia_Ste_Venta),0) AS Promedio_Dias
FROM (
	SELECT	v.IdProducto,
			DATEDIFF(LEAD(v.Fecha) OVER(PARTITION BY v.IdCliente ORDER BY v.Fecha), v.Fecha) AS Diferencia_Ste_Venta
	FROM venta v) vta
GROUP BY IdProducto;

-- 7)
SELECT	IdVenta,
		Precio,
        ROW_NUMBER() OVER w AS Pos,
        COUNT(*) OVER () AS Total
FROM venta
WHERE YEAR(Fecha) = 2020
	WINDOW w AS (ORDER BY Precio);

SELECT IdProducto, AVG(Precio) AS Mediana_Producto, Cnt
FROM (
		SELECT 	IdProducto,
				Precio, 
				COUNT(*) OVER (PARTITION BY IdProducto) AS Cnt,
				ROW_NUMBER() OVER (PARTITION BY IdProducto ORDER BY Precio) AS RowNum
		FROM venta
	-- WHERE YEAR(Fecha) = 2020
	) v
WHERE 	(FLOOR(Cnt/2) = CEILING(Cnt/2) AND (RowNum = FLOOR(Cnt/2) OR RowNum = FLOOR(Cnt/2) + 1))
	OR
		(FLOOR(Cnt/2) <> CEILING(Cnt/2) AND RowNum = CEILING(Cnt/2))
GROUP BY IdProducto;

-- 8)
SELECT Rango_Etario, AVG(Edad) AS Mediana_Edad, Cnt
FROM (
		SELECT 	Rango_Etario,
				Edad, 
				COUNT(*) OVER (PARTITION BY Rango_Etario) AS Cnt,
				ROW_NUMBER() OVER (PARTITION BY Rango_Etario ORDER BY Edad) AS RowNum
		FROM cliente
	) c
WHERE 	(FLOOR(Cnt/2) = CEILING(Cnt/2) AND (RowNum = FLOOR(Cnt/2) OR RowNum = FLOOR(Cnt/2) + 1))
	OR
		(FLOOR(Cnt/2) <> CEILING(Cnt/2) AND RowNum = CEILING(Cnt/2))
GROUP BY Rango_Etario;
---------------------------
USE modelo_negocio;

DROP TABLE IF EXISTS `venta_novedades`;
CREATE TABLE IF NOT EXISTS `venta_novedades` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCanal`				INTEGER, 
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				VARCHAR(30),
  `Cantidad`			VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Venta_Actualizado.csv' 
INTO TABLE `venta_novedades` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

SELECT * FROM venta_novedades ORDER BY Fecha DESC;

DROP TABLE IF EXISTS cliente_novedades;
CREATE TABLE IF NOT EXISTS cliente_novedades (
	ID					INTEGER,
	Provincia			VARCHAR(50),
	Nombre_y_Apellido	VARCHAR(80),
	Domicilio			VARCHAR(150),
	Telefono			VARCHAR(30),
	Edad				VARCHAR(5),
	Localidad			VARCHAR(80),
	X					VARCHAR(30),
	Y					VARCHAR(30),
    Fecha_Alta			DATE NOT NULL,
    Usuario_Alta		VARCHAR(20),
    Fecha_Ultima_Modificacion		DATE NOT NULL,
    Usuario_Ultima_Modificacion		VARCHAR(20),
    Marca_Baja			TINYINT,
	col10				VARCHAR(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Clientes_Actualizado.csv'
INTO TABLE cliente_novedades
CHARACTER SET latin1
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

SELECT * FROM cliente_novedades Order by ID Desc;

/*Se procede primero, a actualizar el Maestro de Clientes, ya que, debido a que están creadas las restricciones,
no sería posible ingestar registros en la tabla venta que no estén presentes en la tabla cliente*/
        
ALTER TABLE `cliente_novedades` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Y`, 
						ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
                        
UPDATE cliente_novedades SET Y = '0' WHERE Y = '';
UPDATE cliente_novedades SET X = '0' WHERE X = '';

UPDATE `cliente_novedades` SET Latitud = REPLACE(Y,',','.');
UPDATE `cliente_novedades` SET Longitud = REPLACE(X,',','.');
-- SELECT * FROM `cliente_novedades`;
ALTER TABLE `cliente_novedades` DROP `Y`;
ALTER TABLE `cliente_novedades` DROP `X`;

ALTER TABLE `cliente_novedades` DROP `col10`;

UPDATE `cliente_novedades` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `cliente_novedades` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
UPDATE `cliente_novedades` SET Nombre_y_Apellido = 'Sin Dato' WHERE TRIM(Nombre_y_Apellido) = "" OR ISNULL(Nombre_y_Apellido);
UPDATE `cliente_novedades` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);

ALTER TABLE `cliente_novedades` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Localidad`;

UPDATE cliente_novedades c JOIN aux_localidad a
	ON (c.Provincia = a.Provincia_Original AND c.Localidad = a.Localidad_Original)
SET c.IdLocalidad = a.IdLocalidad;

/*Se chequea que no haya localidades nuevas no detectadas, de ser así, debe ser dada de alta en las tablas respectivas*/
SELECT * FROM cliente_novedades WHERE IdLocalidad = 0;

ALTER TABLE `cliente_novedades`
  DROP `Provincia`,
  DROP `Localidad`;
  
ALTER TABLE `cliente_novedades` ADD `Rango_Etario` VARCHAR(20) NOT NULL DEFAULT '-' AFTER `Edad`;

UPDATE cliente_novedades SET Rango_Etario = '1_Hasta 30 años' WHERE Edad <= 30;
UPDATE cliente_novedades SET Rango_Etario = '2_De 31 a 40 años' WHERE Edad <= 40 AND Rango_Etario = '-';
UPDATE cliente_novedades SET Rango_Etario = '3_De 41 a 50 años' WHERE Edad <= 50 AND Rango_Etario = '-';
UPDATE cliente_novedades SET Rango_Etario = '4_De 51 a 60 años' WHERE Edad <= 60 AND Rango_Etario = '-';
UPDATE cliente_novedades SET Rango_Etario = '5_Desde 60 años' WHERE Edad > 60 AND Rango_Etario = '-';

DROP TABLE IF EXISTS aux_cliente;
CREATE TABLE IF NOT EXISTS aux_cliente (
	IdCliente			INTEGER,
	Latitud				DOUBLE,
	Longitud			DOUBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO aux_cliente (IdCliente, Latitud, Longitud)
SELECT 	ID, Latitud, Longitud
FROM cliente_novedades WHERE Latitud < -55;

SELECT * FROM aux_cliente;

UPDATE cliente_novedades c JOIN aux_cliente ac
	ON (c.ID = ac.IdCliente)
SET c.Latitud = ac.Longitud, c.Longitud = ac.Latitud;

UPDATE `cliente_novedades` SET Latitud = Latitud * -1 WHERE Latitud > 0;
UPDATE `cliente_novedades` SET Longitud = Longitud * -1 WHERE Longitud > 0;

UPDATE cliente_novedades c JOIN localidad l
	ON (c.IdLocalidad = l.IdLocalidad)
SET c.Latitud = l.Latitud
WHERE c.Latitud = 0;

UPDATE cliente_novedades c JOIN localidad l
	ON (c.IdLocalidad = l.IdLocalidad)
SET c.Longitud = l.Longitud
WHERE c.Longitud = 0; 

/*Validación de Modificaciones:*/
/*(Se puede probar, realizar modificaciones en el archivo Cliente_Actualizado.csv para ver como impactan)*/
SELECT c.*, cn.* 
-- SELECT COUNT(*)
FROM cliente c, cliente_novedades cn
WHERE c.IdCliente = cn.ID
AND (c.Nombre_Y_Apellido <> cn.Nombre_Y_Apellido OR
	c.Domicilio <> cn.Domicilio OR
    c.Telefono <> cn.Telefono OR
    c.Edad <> cn.Edad OR
    c.Rango_Etario <> cn.Rango_Etario OR
    c.IdLocalidad <> cn.IdLocalidad OR
    c.Latitud <> cn.Latitud OR
    c.Longitud <> cn.Longitud OR
    c.Fecha_Ultima_Modificacion <> cn.Fecha_Ultima_Modificacion OR
    c.Usuario_Ultima_Modificacion <> cn.Usuario_Ultima_Modificacion OR
    c.Marca_Baja <> cn.Marca_Baja);

UPDATE cliente c, cliente_novedades cn
SET c.Nombre_Y_Apellido = cn.Nombre_Y_Apellido,
	c.Domicilio = cn.Domicilio,
    c.Telefono = cn.Telefono,
    c.Edad = cn.Edad,
    c.Rango_Etario = cn.Rango_Etario,
    c.IdLocalidad = cn.IdLocalidad,
    c.Latitud = cn.Latitud,
    c.Longitud = cn.Longitud,
    c.Fecha_Ultima_Modificacion = cn.Fecha_Ultima_Modificacion,
    c.Usuario_Ultima_Modificacion = cn.Usuario_Ultima_Modificacion,
    c.Marca_Baja = cn.Marca_Baja
WHERE c.IdCliente = cn.ID
AND (c.Nombre_Y_Apellido <> cn.Nombre_Y_Apellido OR
	c.Domicilio <> cn.Domicilio OR
    c.Telefono <> cn.Telefono OR
    c.Edad <> cn.Edad OR
    c.Rango_Etario <> cn.Rango_Etario OR
    c.IdLocalidad <> cn.IdLocalidad OR
    c.Latitud <> cn.Latitud OR
    c.Longitud <> cn.Longitud OR
    c.Fecha_Ultima_Modificacion <> cn.Fecha_Ultima_Modificacion OR
    c.Usuario_Ultima_Modificacion <> cn.Usuario_Ultima_Modificacion OR
    c.Marca_Baja <> cn.Marca_Baja);

DELETE FROM cliente_novedades cn WHERE cn.ID IN (SELECT c.IdCliente FROM cliente c);

/*Se cargan las novedades en la tabla de Clientes:*/
INSERT INTO cliente (IdCliente, 
					Nombre_Y_Apellido, 
                    Domicilio, 
                    Telefono, 
                    Edad, 
                    Rango_Etario, 
                    IdLocalidad, 
                    Latitud, 
                    Longitud,
					Fecha_Alta,
					Usuario_Alta,
					Fecha_Ultima_Modificacion,
					Usuario_Ultima_Modificacion,
					Marca_Baja)
SELECT	ID, 
		Nombre_Y_Apellido, 
		Domicilio, 
		Telefono, 
		Edad, 
		Rango_Etario, 
		IdLocalidad, 
		Latitud, 
		Longitud,
		Fecha_Alta,
		Usuario_Alta,
		Fecha_Ultima_Modificacion,
		Usuario_Ultima_Modificacion,
		Marca_Baja
FROM 	cliente_novedades;

/*Se procede con el procesado de los datos de la tabla venta_novedades que no hayan sido cargados con anterioridad:*/
DELETE FROM venta_novedades WHERE IdVenta IN (SELECT IdVenta FROM venta);

SELECT * FROM venta_novedades;

UPDATE `venta_novedades` set `Precio` = 0 WHERE `Precio` = '';
ALTER TABLE `venta_novedades` CHANGE `Precio` `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0';

UPDATE venta_novedades v JOIN producto p ON (v.IdProducto = p.IdProducto) 
SET v.Precio = p.Precio
WHERE v.Precio = 0;

UPDATE venta_novedades SET Cantidad = REPLACE(Cantidad, '\r', '');

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, 0, 1
FROM venta_novedades WHERE Cantidad = '' or Cantidad is null;

UPDATE venta_novedades SET Cantidad = '1' WHERE Cantidad = '' or Cantidad is null;
ALTER TABLE `venta_novedades` CHANGE `Cantidad` `Cantidad` INTEGER NOT NULL DEFAULT '0';

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT v.IdVenta, v.Fecha, v.Fecha_Entrega, v.IdCliente, v.IdSucursal, v.IdEmpleado, v.IdProducto, v.Precio, v.Cantidad, 2
FROM venta_novedades v 
JOIN (SELECT IdProducto, AVG(Cantidad) As Promedio, STDDEV(Cantidad) as Desv FROM venta_novedades GROUP BY IdProducto) v2
	on (v.IdProducto = v2.IdProducto)
WHERE v.Cantidad > (v2.Promedio + (3 * v2.Desv)) OR v.Cantidad < 0;

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT v.IdVenta, v.Fecha, v.Fecha_Entrega, v.IdCliente, v.IdSucursal, v.IdEmpleado, v.IdProducto, v.Precio, v.Cantidad, 3
FROM venta_novedades v 
JOIN (SELECT IdProducto, AVG(Precio) As Promedio, STDDEV(Precio) as Desv FROM venta_novedades GROUP BY IdProducto) v2
	on (v.IdProducto = v2.IdProducto)
WHERE v.Precio > (v2.Promedio + (3 * v2.Desv)) OR v.Precio < 0;

select * from aux_venta where Motivo = 2; -- outliers de cantidad
select * from aux_venta where Motivo = 3; -- outliers de precio

ALTER TABLE `venta_novedades` ADD `Outlier` TINYINT NOT NULL DEFAULT '1' AFTER `Cantidad`;

UPDATE venta_novedades v JOIN aux_venta a
	ON (v.IdVenta = a.IdVenta AND a.Motivo IN (2,3))
SET v.Outlier = 0;

UPDATE venta_novedades SET IdEmpleado = (IdSucursal * 1000000) + IdEmpleado;

/*Se cargan las novedades en la tabla de Ventas:*/
INSERT INTO venta (IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Outlier)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Outlier
FROM venta_novedades;
-----------------------