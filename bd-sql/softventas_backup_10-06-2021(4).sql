# +===================================================================
# | Generado el 10-06-2021 a las 10:03:48 PM 
# | Servidor: localhost
# | MySQL Version: 5.5.5-10.4.19-MariaDB
# | PHP Version: 7.3.28
# | Base de datos: 'softventas'
# | Tablas: abonoscreditoscompras;  abonoscreditosventas;  arqueocaja;  cajas;  clientes;  colores;  compras;  configuracion;  cotizaciones;  creditosxclientes;  departamentos;  detallecompras;  detallecotizaciones;  detallepedidos;  detallestraspasos;  detalleventas;  documentos;  familias;  impuestos;  kardex;  log;  marcas;  mediospagos;  modelos;  modelosxproductos;  movimientoscajas;  origenes;  pedidos;  presentaciones;  productos;  proveedores;  provincias;  subfamilias;  sucursales;  tiposcambio;  tiposmoneda;  traspasos;  usuarios;  ventas
# +-------------------------------------------------------------------
# Si tienen tablas con relacion y no estan en orden dara problemas al recuperar datos. Para evitarlo:
SET FOREIGN_KEY_CHECKS=0; 
SET time_zone = '+00:00';
SET sql_mode = ''; 


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

# | Vaciado de tabla 'abonoscreditoscompras'
# +-------------------------------------
DROP TABLE IF EXISTS `abonoscreditoscompras`;


# | Estructura de la tabla 'abonoscreditoscompras'
# +-------------------------------------
CREATE TABLE `abonoscreditoscompras` (
  `codabono` int(11) NOT NULL AUTO_INCREMENT,
  `codcompra` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montoabono` decimal(12,2) NOT NULL,
  `fechaabono` datetime NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codabono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'abonoscreditoscompras'
# +-------------------------------------

# | Vaciado de tabla 'abonoscreditosventas'
# +-------------------------------------
DROP TABLE IF EXISTS `abonoscreditosventas`;


# | Estructura de la tabla 'abonoscreditosventas'
# +-------------------------------------
CREATE TABLE `abonoscreditosventas` (
  `codabono` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montoabono` decimal(12,2) NOT NULL,
  `fechaabono` datetime NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codabono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'abonoscreditosventas'
# +-------------------------------------

# | Vaciado de tabla 'arqueocaja'
# +-------------------------------------
DROP TABLE IF EXISTS `arqueocaja`;


# | Estructura de la tabla 'arqueocaja'
# +-------------------------------------
CREATE TABLE `arqueocaja` (
  `codarqueo` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `montoinicial` decimal(12,2) NOT NULL,
  `ingresos` decimal(12,2) NOT NULL,
  `egresos` decimal(12,2) NOT NULL,
  `creditos` decimal(12,2) NOT NULL,
  `abonos` decimal(12,2) NOT NULL,
  `dineroefectivo` decimal(12,2) NOT NULL,
  `diferencia` decimal(12,2) NOT NULL,
  `comentarios` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaapertura` datetime NOT NULL,
  `fechacierre` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statusarqueo` int(2) NOT NULL,
  PRIMARY KEY (`codarqueo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'arqueocaja'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `arqueocaja` (`codarqueo`, `codcaja`, `montoinicial`, `ingresos`, `egresos`, `creditos`, `abonos`, `dineroefectivo`, `diferencia`, `comentarios`, `fechaapertura`, `fechacierre`, `statusarqueo`) VALUES 
      ('1', '1', '50.00', '26.40', '0.00', '0.00', '0.00', '0.00', '0.00', 'NINGUNO', '2020-07-17 01:56:53', '0000-00-00 00:00:00', '1'), 
      ('2', '3', '50.00', '26.40', '0.00', '0.00', '0.00', '0.00', '0.00', 'NINGUNO', '2021-06-10 01:25:12', '0000-00-00 00:00:00', '1');
COMMIT;

# | Vaciado de tabla 'cajas'
# +-------------------------------------
DROP TABLE IF EXISTS `cajas`;


# | Estructura de la tabla 'cajas'
# +-------------------------------------
CREATE TABLE `cajas` (
  `codcaja` int(11) NOT NULL AUTO_INCREMENT,
  `nrocaja` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomcaja` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codcaja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'cajas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `cajas` (`codcaja`, `nrocaja`, `nomcaja`, `codigo`) VALUES 
      ('1', '001', 'CAJA PRINCIPAL', '2'), 
      ('2', '002', 'CAJA #2', '3'), 
      ('3', '003', 'CAJA #3', '4');
COMMIT;

# | Vaciado de tabla 'clientes'
# +-------------------------------------
DROP TABLE IF EXISTS `clientes`;


# | Estructura de la tabla 'clientes'
# +-------------------------------------
CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documcliente` int(11) NOT NULL,
  `dnicliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomcliente` varchar(90) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfcliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `direccliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emailcliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipocliente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `limitecredito` float(12,2) NOT NULL,
  `fechaingreso` date NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1263 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'clientes'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `clientes` (`idcliente`, `codcliente`, `documcliente`, `dnicliente`, `nomcliente`, `tlfcliente`, `id_provincia`, `id_departamento`, `direccliente`, `emailcliente`, `tipocliente`, `limitecredito`, `fechaingreso`) VALUES 
      ('1', 'C1', '16', '0401302625', 'VERONICA YOLANDA CHACUA ESCOBAR ', '(0997) 792843', '1', '4', 'BARRIO MORAS CHORLAVI', 'VERONICACHACUA@GMAIL.COM', 'NATURAL', '0.00', '2019-05-19'), 
      ('2', 'C2', '16', '0450198890', 'ERIKA REYES REYES', '593 997834436', '1', '3', 'BARRIO LA TOLA ELOY ALFARO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('3', 'C3', '16', '1002985487', 'WILSON HERNAN PEREZ REAL', '593 962677823', '1', '2', 'CENTRO COLISEO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('4', 'C4', '16', '1001706124', 'JOEL LUIS PALACIOS CHIRAN', '593 994977561', '1', '2', 'LA DOLOROSA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('5', 'C5', '16', '7656787654', 'Carlos Calderon', '593 960579694', '0', '0', 'SAN ANTONIO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('7', 'C7', '16', '7656787654', 'Manrique suarez', '593 978734192', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('8', 'C8', '16', '1727965293', 'JENIFFER PAMELA POSSO ALTAMIRANO', '593 986973327', '1', '2', 'PARQUE EL ESTUDIANTE', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('9', 'C9', '16', '7656787655', 'Sandra Castillo Ibarra', '593 988532161', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('10', 'C10', '16', '7656787656', 'Potosi reyes', '593 962574372', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('11', 'C11', '16', '1002311791', 'Jose Arimatea Caranqui Cando', '593 988064726', '1', '8', 'FRENTE AL CONDOMINIO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('12', 'C12', '16', '7656787658', 'Blanca tixilima', '593 967514349', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('13', 'C13', '16', '7656787659', 'Josselin Armas', '593 985065655', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('14', 'C14', '16', '7656787660', 'Bellavista', '593 967138386', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('15', 'C15', '16', '7656787661', 'Flor Reina', '593 968910669', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('16', 'C16', '16', '7656787662', 'Juan Carlos Potosi', '593 997602604', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('17', 'C17', '16', '401322625', 'Vecina tienda', '968256055', '0', '0', 'ATUNTAQUI CENTRO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('18', 'C18', '16', '7656787664', 'Jeymmi Montes', '593 963343632', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('19', 'C19', '16', '7656787665', 'Simon Cisneros 3m', '593 993625641', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('20', 'C20', '16', '7656787666', 'Andrea Mesa', '593 968014295', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('21', 'C21', '16', '7656787667', 'fernando Pot', '593 981115976', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('22', 'C22', '16', '7656787668', 'Oswaldo Ramos', '593 986687114', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('23', 'C23', '16', '7656787669', 'Raul Juma', '593 981579733', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('24', 'C24', '16', '1002181509', 'BLANCA ELENA MORA FARINANGO', '593 991555359', '1', '8', 'FRENTE AL CONDOMINIO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('25', 'C25', '16', '7656787671', 'Andreina Armas', '593 994527494', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('26', 'C26', '16', '1004150817', 'Wilmer Armanado Padilla Sinchiguano', '(0000) 021', '1', '4', '10 DE AGOSTO CERCA A LA ANTENA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('27', 'C27', '16', '7656787673', 'Rosa Veronica Sanchez', '593 968841620', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('28', 'C28', '16', '7656787674', 'Silvia Arias', '593 986164299', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('29', 'C29', '16', '7656787675', 'Bryan Palacios', '593 980725819', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('30', 'C30', '16', '1003182431', 'CECILIA ELIZABETH RIVERA DURAN', '593 991304840', '1', '4', 'PANAMERICANA FRENTE A GASOLINERA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('31', 'C31', '16', '7656787677', 'Gustavo Abogado', '593 996706417', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('32', 'C32', '16', '09401192461', 'JAQUELINE ANDREA LINDAO CERVANTES', '593 991515114', '1', '8', 'PRINCIPAL PISCINA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('33', 'C33', '16', '0450062278', 'JENNY LIZBETH VALLEJO IRUA', '593 96824329', '1', '2', 'CERCA PRINCIPAL ', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('34', 'C34', '16', '1000701399', 'LUIS ALBERTO MAIGUA LEMA', '593 963218347', '1', '3', 'LA TOLA ', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('35', 'C35', '16', '1001189081', 'LUIS ATONIO GUAMAN RUIZ', '593 963218347', '1', '2', 'AV LEORO FRANCO Y SALINAS', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('36', 'C36', '16', '1003479662', 'ANGELICA GABRIELA REMACHE LATACUMBA', '593 961708025', '1', '3', 'CARRETERA ANTIGUA Y MIGUEL DE LA FUENTE', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('37', 'C37', '16', '1003217492', 'ROCIO ISABEL GUEVARA TIXILIMA', '593 986147452', '1', '3', 'CERRETERA ANTIGUA GERMAN MARTINEZ', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('38', 'C38', '16', '0968256055', 'VECI TIENDA', '(0968) 256055', '1', '2', 'OLMEDO 1535 ESPEJO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('39', 'C39', '16', '7656787685', 'SEGUNDO CHALCUALAN', '593 979582650', '1', '1', 'CANANVALLE PARQUE ', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('40', 'C40', '16', '7656787686', 'Pilar', '593 959043825', '1', '4', 'BARRIO LOS SOLES', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('41', 'C41', '16', '0400806469', 'LUIS MARCELO CELIN ROSERO', '593 980916544', '1', '4', 'BARRIO LOS SOLES', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('42', 'C42', '16', '7656787688', 'JEANETH ALEXANDRA VACA', '(0000) 037', '1', '4', 'BARRIO LOS SOLES', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('43', 'C43', '16', '7656787689', 'BAIRON QUIMBURCO', '593 959694712', '1', '4', 'BARRIO LOS SOLES', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('44', 'C44', '16', '1002848685', 'CARMEN LEON', '593 988951365', '1', '2', 'CALLE PICHINCHA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('45', 'C45', '16', '7656787691', 'VERONICA SUAREZ', '593 939250633', '1', '3', 'VENCEDORES BARRIO JERUSALEN', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('46', 'C46', '16', '7656787692', 'Andres Moreno', '593 990843320', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('48', 'C48', '16', '1002514956', 'JUAN CARLOS CACHIMUEL TUTILLO', '593 993926092', '1', '4', 'LUIS ENRIQUE CEVALLOS', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('49', 'C49', '16', '7656787695', 'Maira Moreno', '593 988200064', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('50', 'C50', '16', '1311560575', 'ELIANA ROSIBEL LOOR LUCAS', '593 981765374', '1', '8', 'VIA CHORLAVI ', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('51', 'C51', '16', '1002344461', 'RUTH ELENA QUEREMBAS NARVAEZ', '593 959820786', '1', '3', ' PANA E35 JUNTO LOS TRES GUABOS', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('52', 'C52', '16', '1002101671', 'Jaqueline Marisol Moreno Ibadango', '593 967016691', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('53', 'C53', '16', '0401753140', 'ANA LUCIA IPUJAN RUANO', '593 978781117', '1', '3', 'EL CRUCE ARRIBA DEL PARQUE', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('54', 'C54', '16', '7656787700', 'sergio guandina', '593 968075406', '0', '0', 'ATUNTAQUI PANA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('55', 'C55', '16', '1003681721', 'MARICELA JANETH CISNEROS VILLALVA', '593 959258743', '1', '1', 'J OSE CANAVALLE  IMBAYA', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10'), 
      ('56', 'C56', '16', '7656787702', 'Elizabeth Gerrero', '593 959538770', '1', '8', 'VIA CHORLAVI FRENTE CONDOMINIO', 'sin@GMAIL.COM', 'NATURAL', '0.00', '2021-06-10');
COMMIT;

# | Vaciado de tabla 'colores'
# +-------------------------------------
DROP TABLE IF EXISTS `colores`;


# | Estructura de la tabla 'colores'
# +-------------------------------------
CREATE TABLE `colores` (
  `codcolor` int(11) NOT NULL AUTO_INCREMENT,
  `nomcolor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codcolor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'colores'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `colores` (`codcolor`, `nomcolor`) VALUES 
      ('1', 'NEUTRO'), 
      ('2', 'AZUL'), 
      ('3', 'ROJO'), 
      ('4', 'AMARILLO'), 
      ('5', 'NEGRO'), 
      ('6', 'BLANCO');
COMMIT;

# | Vaciado de tabla 'compras'
# +-------------------------------------
DROP TABLE IF EXISTS `compras`;


# | Estructura de la tabla 'compras'
# +-------------------------------------
CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `codcompra` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasic` decimal(12,2) NOT NULL,
  `subtotalivanoc` decimal(12,2) NOT NULL,
  `ivac` decimal(12,2) NOT NULL,
  `totalivac` decimal(12,2) NOT NULL,
  `descuentoc` decimal(12,2) NOT NULL,
  `totaldescuentoc` decimal(12,2) NOT NULL,
  `totalpagoc` decimal(12,2) NOT NULL,
  `tipocompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formacompra` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechavencecredito` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechapagado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statuscompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaemision` date NOT NULL,
  `fecharecepcion` date NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'compras'
# +-------------------------------------

# | Vaciado de tabla 'configuracion'
# +-------------------------------------
DROP TABLE IF EXISTS `configuracion`;


# | Estructura de la tabla 'configuracion'
# +-------------------------------------
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `documsucursal` int(11) NOT NULL,
  `cuit` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfsucursal` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correosucursal` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `direcsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `documencargado` int(11) NOT NULL,
  `dniencargado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomencargado` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `codmoneda` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'configuracion'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `configuracion` (`id`, `documsucursal`, `cuit`, `nomsucursal`, `tlfsucursal`, `correosucursal`, `id_provincia`, `id_departamento`, `direcsucursal`, `documencargado`, `dniencargado`, `nomencargado`, `codmoneda`) VALUES 
      ('1', '1', '1715233597001', 'REDEXTEL ', '(0969) 498533', 'REDEXTEL@GMAIL.COM', '4', '2', 'OLMEDO 335 ESPEJO', '16', '18081685', 'SEBASTIAN CASTILLO ', '1');
COMMIT;

# | Vaciado de tabla 'cotizaciones'
# +-------------------------------------
DROP TABLE IF EXISTS `cotizaciones`;


# | Estructura de la tabla 'cotizaciones'
# +-------------------------------------
CREATE TABLE `cotizaciones` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codcotizacion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechacotizacion` datetime NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'cotizaciones'
# +-------------------------------------

# | Vaciado de tabla 'creditosxclientes'
# +-------------------------------------
DROP TABLE IF EXISTS `creditosxclientes`;


# | Estructura de la tabla 'creditosxclientes'
# +-------------------------------------
CREATE TABLE `creditosxclientes` (
  `codcredito` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montocredito` decimal(12,2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codcredito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'creditosxclientes'
# +-------------------------------------

# | Vaciado de tabla 'departamentos'
# +-------------------------------------
DROP TABLE IF EXISTS `departamentos`;


# | Estructura de la tabla 'departamentos'
# +-------------------------------------
CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_provincia` int(11) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2383 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'departamentos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `departamentos` (`id_departamento`, `departamento`, `id_provincia`) VALUES 
      ('1', 'IBARRA', '1'), 
      ('2', 'ATUNTAQUI', '1'), 
      ('3', 'NATABUELA', '1'), 
      ('4', 'SAN ANTONIO', '1'), 
      ('7', 'ARRECIFES', '1'), 
      ('8', 'CHORLAVI', '1');
COMMIT;

# | Vaciado de tabla 'detallecompras'
# +-------------------------------------
DROP TABLE IF EXISTS `detallecompras`;


# | Estructura de la tabla 'detallecompras'
# +-------------------------------------
CREATE TABLE `detallecompras` (
  `coddetallecompra` int(11) NOT NULL AUTO_INCREMENT,
  `codcompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `preciocomprac` decimal(12,2) NOT NULL,
  `precioxmenorc` decimal(12,2) NOT NULL,
  `precioxmayorc` decimal(12,2) NOT NULL,
  `precioxpublicoc` decimal(12,2) NOT NULL,
  `cantcompra` int(15) NOT NULL,
  `ivaproductoc` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproductoc` decimal(12,2) NOT NULL,
  `descfactura` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentoc` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `lotec` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaelaboracionc` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaoptimoc` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechamedioc` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaminimoc` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `stockoptimoc` int(5) NOT NULL,
  `stockmedioc` int(5) NOT NULL,
  `stockminimoc` int(5) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetallecompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detallecompras'
# +-------------------------------------

# | Vaciado de tabla 'detallecotizaciones'
# +-------------------------------------
DROP TABLE IF EXISTS `detallecotizaciones`;


# | Estructura de la tabla 'detallecotizaciones'
# +-------------------------------------
CREATE TABLE `detallecotizaciones` (
  `coddetallecotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codcotizacion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantcotizacion` int(15) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetallecotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detallecotizaciones'
# +-------------------------------------

# | Vaciado de tabla 'detallepedidos'
# +-------------------------------------
DROP TABLE IF EXISTS `detallepedidos`;


# | Estructura de la tabla 'detallepedidos'
# +-------------------------------------
CREATE TABLE `detallepedidos` (
  `coddetallepedido` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmarca` int(11) NOT NULL,
  `codmodelo` int(11) NOT NULL,
  `cantpedido` int(5) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetallepedido`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detallepedidos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `detallepedidos` (`coddetallepedido`, `codpedido`, `codproducto`, `producto`, `codmarca`, `codmodelo`, `cantpedido`, `codsucursal`) VALUES 
      ('1', '0001-000000001', 'MRP-DD100808', 'ACEITE DE CA?A DE TIMON', '1', '26', '41', '1'), 
      ('2', '0001-000000001', 'MRP-DD100811', 'AGUJA DE FLOTADOR', '6', '2', '12', '1'), 
      ('3', '0001-000000001', 'MRP-DD100813', 'AGUJA DE FLOTADOR', '6', '5', '83', '1'), 
      ('4', '0001-000000002', 'MRP-DD100808', 'ACEITE DE CA?A DE TIMON', '1', '26', '15', '1');
COMMIT;

# | Vaciado de tabla 'detallestraspasos'
# +-------------------------------------
DROP TABLE IF EXISTS `detallestraspasos`;


# | Estructura de la tabla 'detallestraspasos'
# +-------------------------------------
CREATE TABLE `detallestraspasos` (
  `coddetalletraspaso` int(11) NOT NULL AUTO_INCREMENT,
  `codtraspaso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaexpiracion` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(10) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  `codsucursal` int(1) NOT NULL,
  PRIMARY KEY (`coddetalletraspaso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detallestraspasos'
# +-------------------------------------

# | Vaciado de tabla 'detalleventas'
# +-------------------------------------
DROP TABLE IF EXISTS `detalleventas`;


# | Estructura de la tabla 'detalleventas'
# +-------------------------------------
CREATE TABLE `detalleventas` (
  `coddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantventa` int(15) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetalleventa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detalleventas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `detalleventas` (`coddetalleventa`, `codventa`, `codproducto`, `producto`, `cantventa`, `preciocompra`, `precioventa`, `ivaproducto`, `descproducto`, `valortotal`, `totaldescuentov`, `valorneto`, `valorneto2`, `codsucursal`) VALUES 
      ('1', '0001-000000001', 'PLAN-AN101190', 'PLAN 4 MEGAS', '1', '23.00', '24.30', 'SI', '0.00', '24.30', '0.00', '24.30', '23.00', '1'), 
      ('2', '0001-000000002', 'PLAN-AN101190', 'PLAN 4 MEGAS', '1', '23.00', '24.30', 'SI', '0.00', '24.30', '0.00', '24.30', '23.00', '1');
COMMIT;

# | Vaciado de tabla 'documentos'
# +-------------------------------------
DROP TABLE IF EXISTS `documentos`;


# | Estructura de la tabla 'documentos'
# +-------------------------------------
CREATE TABLE `documentos` (
  `coddocumento` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`coddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'documentos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `documentos` (`coddocumento`, `documento`, `descripcion`) VALUES 
      ('1', 'RUC', 'REGISTRO UNICO DE CONTRIBUYENTES'), 
      ('11', 'DNI', 'DOCUMENTO NACIONAL DE IDENTIDAD'), 
      ('15', 'TARJ. DE IDENTIDAD', 'TARJETA DE IDENTIDAD'), 
      ('16', 'CI', 'CEDULA DE IDENTIDAD'), 
      ('17', 'PASAPORTE', 'PASAPORTE');
COMMIT;

# | Vaciado de tabla 'familias'
# +-------------------------------------
DROP TABLE IF EXISTS `familias`;


# | Estructura de la tabla 'familias'
# +-------------------------------------
CREATE TABLE `familias` (
  `codfamilia` int(11) NOT NULL AUTO_INCREMENT,
  `nomfamilia` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codfamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'familias'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `familias` (`codfamilia`, `nomfamilia`) VALUES 
      ('1', 'PLANES RESIDENCIALES R-E'), 
      ('2', 'PLANES RESIDENCIALES F-O'), 
      ('3', 'PLAN COMERCIAL'), 
      ('4', 'VARIOS');
COMMIT;

# | Vaciado de tabla 'impuestos'
# +-------------------------------------
DROP TABLE IF EXISTS `impuestos`;


# | Estructura de la tabla 'impuestos'
# +-------------------------------------
CREATE TABLE `impuestos` (
  `codimpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nomimpuesto` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `valorimpuesto` decimal(12,2) NOT NULL,
  `statusimpuesto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaimpuesto` date NOT NULL,
  PRIMARY KEY (`codimpuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'impuestos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `impuestos` (`codimpuesto`, `nomimpuesto`, `valorimpuesto`, `statusimpuesto`, `fechaimpuesto`) VALUES 
      ('1', 'IGV', '18.00', 'INACTIVO', '2019-06-02'), 
      ('2', 'IVA', '12.00', 'ACTIVO', '2019-06-02'), 
      ('3', 'ITBMS', '7.00', 'INACTIVO', '2019-06-02');
COMMIT;

# | Vaciado de tabla 'kardex'
# +-------------------------------------
DROP TABLE IF EXISTS `kardex`;


# | Estructura de la tabla 'kardex'
# +-------------------------------------
CREATE TABLE `kardex` (
  `codkardex` int(11) NOT NULL AUTO_INCREMENT,
  `codproceso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `entradas` int(5) NOT NULL,
  `salidas` int(5) NOT NULL,
  `devolucion` int(5) NOT NULL,
  `stockactual` int(10) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `documento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codkardex`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'kardex'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `kardex` (`codkardex`, `codproceso`, `codresponsable`, `codproducto`, `movimiento`, `entradas`, `salidas`, `devolucion`, `stockactual`, `ivaproducto`, `descproducto`, `precio`, `documento`, `fechakardex`, `codsucursal`) VALUES 
      ('1', 'PLAN-AN101190', '0', 'PLAN-AN101190', 'ENTRADAS', '23', '0', '0', '23', '10', '0.00', '24.30', 'INVENTARIO INICIAL', '2020-07-14', '0'), 
      ('2', 'MRP-DD100997', '0', 'MRP-DD100997', 'ENTRADAS', '25', '0', '0', '25', '10', '0.00', '26.30', 'INVENTARIO INICIAL', '2020-07-14', '0'), 
      ('3', '0001-000000001', 'C1', 'PLAN-AN101190', 'SALIDAS', '0', '1', '0', '88', 'SI', '0.00', '24.30', 'VENTA: 0001-000000001', '2021-06-10', '1'), 
      ('4', '0001-000000002', 'C1', 'PLAN-AN101190', 'SALIDAS', '0', '1', '0', '87', 'SI', '0.00', '24.30', 'VENTA: 0001-000000002', '2021-06-10', '1');
COMMIT;

# | Vaciado de tabla 'log'
# +-------------------------------------
DROP TABLE IF EXISTS `log`;


# | Estructura de la tabla 'log'
# +-------------------------------------
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo` datetime DEFAULT NULL,
  `detalles` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `paginas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'log'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `log` (`id`, `ip`, `tiempo`, `detalles`, `paginas`, `usuario`) VALUES 
      ('1', '127.0.0.1', '2021-06-10 12:13:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('2', '127.0.0.1', '2021-06-10 12:14:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('3', '127.0.0.1', '2021-06-10 12:15:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SEBASTIANCASTILLO'), 
      ('4', '127.0.0.1', '2021-06-10 12:16:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'GABRIELACASTILLO'), 
      ('5', '127.0.0.1', '2021-06-10 12:17:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SOFIACASTILLO'), 
      ('6', '127.0.0.1', '2021-06-10 12:22:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('86', '127.0.0.1', '2021-06-10 01:38:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('87', '127.0.0.1', '2021-06-10 01:41:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('88', '127.0.0.1', '2021-06-10 02:21:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SOFIACASTILLO'), 
      ('89', '127.0.0.1', '2021-06-10 02:26:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('90', '127.0.0.1', '2021-06-10 02:27:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SEBASTIANCASTILLO'), 
      ('91', '127.0.0.1', '2021-06-10 02:46:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('92', '127.0.0.1', '2021-06-10 03:34:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SEBASTIANCASTILLO'), 
      ('93', '127.0.0.1', '2021-06-10 12:45:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('94', '127.0.0.1', '2021-06-10 01:09:39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('95', '127.0.0.1', '2021-06-10 03:03:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('96', '127.0.0.1', '2021-06-10 03:06:39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SOFIACASTILLO'), 
      ('97', '127.0.0.1', '2021-06-10 03:08:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('98', '127.0.0.1', '2021-06-10 05:05:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SOFIACASTILLO'), 
      ('99', '127.0.0.1', '2021-06-10 05:13:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'JHONATAN'), 
      ('100', '127.0.0.1', '2021-06-10 05:14:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('101', '127.0.0.1', '2021-06-10 05:39:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SOFIACASTILLO'), 
      ('102', '127.0.0.1', '2021-06-10 05:40:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('103', '127.0.0.1', '2021-06-10 06:41:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'SOFIACASTILLO'), 
      ('104', '127.0.0.1', '2021-06-10 07:42:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO'), 
      ('105', '127.0.0.1', '2021-06-10 10:03:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '/ventas/index.php', 'TARQUINOCASTILLO');
COMMIT;

# | Vaciado de tabla 'marcas'
# +-------------------------------------
DROP TABLE IF EXISTS `marcas`;


# | Estructura de la tabla 'marcas'
# +-------------------------------------
CREATE TABLE `marcas` (
  `codmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nommarca` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'marcas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `marcas` (`codmarca`, `nommarca`) VALUES 
      ('1', 'NETLIFE'), 
      ('2', 'CNT'), 
      ('3', 'NEDETEL'), 
      ('4', 'CELERITY'), 
      ('6', 'REDEXTEL');
COMMIT;

# | Vaciado de tabla 'mediospagos'
# +-------------------------------------
DROP TABLE IF EXISTS `mediospagos`;


# | Estructura de la tabla 'mediospagos'
# +-------------------------------------
CREATE TABLE `mediospagos` (
  `codmediopago` int(11) NOT NULL AUTO_INCREMENT,
  `mediopago` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmediopago`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'mediospagos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `mediospagos` (`codmediopago`, `mediopago`) VALUES 
      ('1', 'EFECTIVO'), 
      ('2', 'CHEQUE A FECHA'), 
      ('3', 'CHEQUE AL DIA'), 
      ('4', 'NOTA DE CREDITO'), 
      ('5', 'RED COMPRA'), 
      ('6', 'TRANSFERENCIA'), 
      ('7', 'TARJETA DE CREDITO'), 
      ('8', 'CUPON');
COMMIT;

# | Vaciado de tabla 'modelos'
# +-------------------------------------
DROP TABLE IF EXISTS `modelos`;


# | Estructura de la tabla 'modelos'
# +-------------------------------------
CREATE TABLE `modelos` (
  `codmodelo` int(11) NOT NULL AUTO_INCREMENT,
  `nommodelo` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmarca` int(11) NOT NULL,
  PRIMARY KEY (`codmodelo`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'modelos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `modelos` (`codmodelo`, `nommodelo`, `codmarca`) VALUES 
      ('1', 'REFL', '6'), 
      ('2', 'RE175', '6'), 
      ('3', 'RE175', '3');
COMMIT;

# | Vaciado de tabla 'modelosxproductos'
# +-------------------------------------
DROP TABLE IF EXISTS `modelosxproductos`;


# | Estructura de la tabla 'modelosxproductos'
# +-------------------------------------
CREATE TABLE `modelosxproductos` (
  `codasignacion` int(11) NOT NULL AUTO_INCREMENT,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmodelo` int(11) NOT NULL,
  PRIMARY KEY (`codasignacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'modelosxproductos'
# +-------------------------------------

# | Vaciado de tabla 'movimientoscajas'
# +-------------------------------------
DROP TABLE IF EXISTS `movimientoscajas`;


# | Estructura de la tabla 'movimientoscajas'
# +-------------------------------------
CREATE TABLE `movimientoscajas` (
  `codmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `tipomovimiento` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcionmovimiento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montomovimiento` decimal(12,2) NOT NULL,
  `codmediopago` int(11) NOT NULL,
  `fechamovimiento` datetime NOT NULL,
  PRIMARY KEY (`codmovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'movimientoscajas'
# +-------------------------------------

# | Vaciado de tabla 'origenes'
# +-------------------------------------
DROP TABLE IF EXISTS `origenes`;


# | Estructura de la tabla 'origenes'
# +-------------------------------------
CREATE TABLE `origenes` (
  `codorigen` int(11) NOT NULL AUTO_INCREMENT,
  `nomorigen` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codorigen`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'origenes'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `origenes` (`codorigen`, `nomorigen`) VALUES 
      ('1', 'MEGITAS'), 
      ('2', 'KMEGAS'), 
      ('3', 'CHINO'), 
      ('4', 'TAIWANES'), 
      ('5', 'AMERICANO'), 
      ('6', 'BRASILE?O'), 
      ('7', 'INDIO'), 
      ('8', 'CHILENO'), 
      ('9', 'FRANCES');
COMMIT;

# | Vaciado de tabla 'pedidos'
# +-------------------------------------
DROP TABLE IF EXISTS `pedidos`;


# | Estructura de la tabla 'pedidos'
# +-------------------------------------
CREATE TABLE `pedidos` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `observacionpedido` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechapedido` date NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'pedidos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `pedidos` (`idpedido`, `codpedido`, `codproveedor`, `observacionpedido`, `fechapedido`, `codigo`, `codsucursal`) VALUES 
      ('1', '0001-000000001', 'P1', 'NINGUNA', '2019-05-10', '2', '1'), 
      ('2', '0001-000000002', 'P2', 'NINGUNA', '2019-05-13', '2', '1'), 
      ('3', '0001-000000003', 'P4', 'NINGUNA', '2019-05-15', '2', '1'), 
      ('4', '0001-000000004', 'P1', 'NINGUNA', '2019-05-17', '2', '1'), 
      ('5', '0001-000000005', 'P3', 'NINGUNA', '2019-05-21', '2', '1');
COMMIT;

# | Vaciado de tabla 'presentaciones'
# +-------------------------------------
DROP TABLE IF EXISTS `presentaciones`;


# | Estructura de la tabla 'presentaciones'
# +-------------------------------------
CREATE TABLE `presentaciones` (
  `codpresentacion` int(11) NOT NULL AUTO_INCREMENT,
  `nompresentacion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codpresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'presentaciones'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `presentaciones` (`codpresentacion`, `nompresentacion`) VALUES 
      ('1', 'UNIDAD'), 
      ('2', 'PAQUETE'), 
      ('3', 'BOTELLA'), 
      ('4', 'GALON'), 
      ('5', 'LITRO'), 
      ('6', 'BOLSAS'), 
      ('7', 'CAJAS'), 
      ('8', 'FRASCOS'), 
      ('9', 'ROLLOS'), 
      ('10', 'KIT');
COMMIT;

# | Vaciado de tabla 'productos'
# +-------------------------------------
DROP TABLE IF EXISTS `productos`;


# | Estructura de la tabla 'productos'
# +-------------------------------------
CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fabricante` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codfamilia` int(11) NOT NULL,
  `codsubfamilia` int(11) NOT NULL,
  `codmarca` int(11) NOT NULL,
  `codmodelo` int(11) NOT NULL,
  `codpresentacion` int(11) NOT NULL,
  `codcolor` int(11) NOT NULL,
  `codorigen` int(11) NOT NULL,
  `year` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nroparte` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `lote` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `peso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioxmenor` decimal(12,2) NOT NULL,
  `precioxmayor` decimal(12,2) NOT NULL,
  `precioxpublico` decimal(12,2) NOT NULL,
  `existencia` int(5) NOT NULL,
  `stockoptimo` int(5) NOT NULL,
  `stockmedio` int(5) NOT NULL,
  `stockminimo` int(5) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `codigobarra` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaelaboracion` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaoptimo` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechamedio` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaminimo` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `stockteorico` int(10) NOT NULL,
  `motivoajuste` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'productos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `productos` (`idproducto`, `codproducto`, `producto`, `fabricante`, `codfamilia`, `codsubfamilia`, `codmarca`, `codmodelo`, `codpresentacion`, `codcolor`, `codorigen`, `year`, `nroparte`, `lote`, `peso`, `preciocompra`, `precioxmenor`, `precioxmayor`, `precioxpublico`, `existencia`, `stockoptimo`, `stockmedio`, `stockminimo`, `ivaproducto`, `descproducto`, `codigobarra`, `fechaelaboracion`, `fechaoptimo`, `fechamedio`, `fechaminimo`, `codproveedor`, `stockteorico`, `motivoajuste`, `codsucursal`) VALUES 
      ('1', 'PLAN-AN101190', 'PLAN R-E 4 MEGAS', '', '1', '0', '6', '0', '1', '0', '0', '', '', '', '', '14.00', '0.00', '0.00', '15.00', '87', '100', '60', '49', 'SI', '0.00', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'P1', '0', 'NINGUNO', '1'), 
      ('2', 'MRP-DD100997', 'PLAN R-E 5 MEGAS', '', '1', '0', '6', '7', '1', '0', '0', '', '', '', '', '0.00', '0.00', '0.00', '21.00', '192', '100', '60', '49', 'SI', '0.00', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'P1', '0', 'NINGUNO', '1'), 
      ('3', 'MRP-DD100999', 'PLAN F-O 20 MEGAS', '', '2', '0', '6', '7', '1', '0', '0', '', '', '167', '', '0.00', '0.00', '200.00', '25.00', '77', '100', '60', '49', 'SI', '7.00', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'P2', '0', 'NINGUNO', '1'), 
      ('4', 'MRP-DD101000', 'PLAN F-O 25 MEGAS ', '', '2', '0', '1', '26', '1', '0', '0', '', '', '', '', '0.00', '0.00', '0.00', '28.00', '39', '100', '60', '49', 'SI', '0.00', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'P1', '0', 'NINGUNO', '1');
COMMIT;

# | Vaciado de tabla 'proveedores'
# +-------------------------------------
DROP TABLE IF EXISTS `proveedores`;


# | Estructura de la tabla 'proveedores'
# +-------------------------------------
CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documproveedor` int(11) NOT NULL,
  `cuitproveedor` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomproveedor` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfproveedor` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `direcproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `vendedor` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfvendedor` varchar(20) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `fechaingreso` date NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'proveedores'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `proveedores` (`idproveedor`, `codproveedor`, `documproveedor`, `cuitproveedor`, `nomproveedor`, `tlfproveedor`, `id_provincia`, `id_departamento`, `direcproveedor`, `emailproveedor`, `vendedor`, `tlfvendedor`, `fechaingreso`) VALUES 
      ('1', 'P1', '1', '10451248495', 'NETLIFE', '(6039) 20000', '1', '1', 'IBARRA', 'NETLIFE@NETLIFE.COM', 'JULIAN RENGIFO', '(0995) 098394', '2019-02-13'), 
      ('2', 'P2', '1', '3488729001-J', 'CNT', '(2023) 70000', '1', '1', 'EL CENTRO', 'CNT@GMAIL.COM', 'LCDO. JORGE LUIS CAMACHO', '(2023) 70000', '2019-02-13');
COMMIT;

# | Vaciado de tabla 'provincias'
# +-------------------------------------
DROP TABLE IF EXISTS `provincias`;


# | Estructura de la tabla 'provincias'
# +-------------------------------------
CREATE TABLE `provincias` (
  `id_provincia` int(10) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'provincias'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `provincias` (`id_provincia`, `provincia`) VALUES 
      ('1', 'IMBABURA'), 
      ('2', 'CARCHI');
COMMIT;

# | Vaciado de tabla 'subfamilias'
# +-------------------------------------
DROP TABLE IF EXISTS `subfamilias`;


# | Estructura de la tabla 'subfamilias'
# +-------------------------------------
CREATE TABLE `subfamilias` (
  `codsubfamilia` int(11) NOT NULL AUTO_INCREMENT,
  `nomsubfamilia` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codfamilia` int(11) NOT NULL,
  PRIMARY KEY (`codsubfamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'subfamilias'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `subfamilias` (`codsubfamilia`, `nomsubfamilia`, `codfamilia`) VALUES 
      ('1', '4 MEGAS', '1'), 
      ('2', '5 MEGAS', '1'), 
      ('3', '6 MEGAS', '1'), 
      ('4', '3 MEGAS', '1'), 
      ('5', '20 MEGAS', '2'), 
      ('6', '25 MEGAS', '2'), 
      ('7', '35 MEGAS', '2');
COMMIT;

# | Vaciado de tabla 'sucursales'
# +-------------------------------------
DROP TABLE IF EXISTS `sucursales`;


# | Estructura de la tabla 'sucursales'
# +-------------------------------------
CREATE TABLE `sucursales` (
  `codsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `documsucursal` int(11) NOT NULL,
  `cuitsucursal` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `razonsocial` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `direcsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `correosucursal` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfsucursal` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nroactividadsucursal` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `iniciofactura` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaautorsucursal` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `llevacontabilidad` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documencargado` int(11) NOT NULL,
  `dniencargado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomencargado` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfencargado` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descsucursal` decimal(12,2) NOT NULL,
  `porcentaje` decimal(12,2) NOT NULL,
  `codmoneda` int(11) NOT NULL,
  PRIMARY KEY (`codsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'sucursales'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `sucursales` (`codsucursal`, `documsucursal`, `cuitsucursal`, `razonsocial`, `id_provincia`, `id_departamento`, `direcsucursal`, `correosucursal`, `tlfsucursal`, `nroactividadsucursal`, `iniciofactura`, `fechaautorsucursal`, `llevacontabilidad`, `documencargado`, `dniencargado`, `nomencargado`, `tlfencargado`, `descsucursal`, `porcentaje`, `codmoneda`) VALUES 
      ('1', '1', '1715233597001', 'REDEXTEL ATUNTAQUI', '13', '1421', 'OLMEDO 1535 ESPEJO', 'REDEXTEL@GMAIL.COM', '(3804) 63753', '0001', '000000001', '2017-08-31', 'SI', '11', '18081685', 'CRUZ TARQUINO CASTILLO QUIRANZA', '', '0.00', '10.00', '1'), 
      ('2', '1', '1050210309001', 'REDEXTEL  SAN ANTONIO', '1', '4', 'CALLE PRINCIPAL', 'REDEXTELSEBAS@GMAIL.COM', '(0414) 5879685', '002', '000000001', '2019-06-14', 'SI', '16', '1050210309', 'SEBASTIAN CASTILLO', '', '3.00', '10.00', '1'), 
      ('3', '1', '389965745', 'REPUESTOS Y ACCESORIOS ', '11', '1286', 'URCUQUI', 'R-A@GMAIL.COM', '(0426) 5874896', '003', '000000001', '2019-06-20', 'SI', '11', '24879658', 'RAFAEL DE JESUS RAMIREZ', '', '5.00', '0.00', '1');
COMMIT;

# | Vaciado de tabla 'tiposcambio'
# +-------------------------------------
DROP TABLE IF EXISTS `tiposcambio`;


# | Estructura de la tabla 'tiposcambio'
# +-------------------------------------
CREATE TABLE `tiposcambio` (
  `codcambio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcioncambio` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montocambio` decimal(12,3) NOT NULL,
  `codmoneda` int(11) NOT NULL,
  `fechacambio` date NOT NULL,
  PRIMARY KEY (`codcambio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'tiposcambio'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `tiposcambio` (`codcambio`, `descripcioncambio`, `montocambio`, `codmoneda`, `fechacambio`) VALUES 
      ('1', 'TIPO DE CAMBIO SUNAT', '3.278', '1', '2019-03-26'), 
      ('2', 'TIPO DE CAMBIO SUNAT', '3.780', '1', '2019-04-26'), 
      ('3', 'TIPO DE CAMBIO SUNAT', '4.230', '1', '2019-05-26'), 
      ('4', 'TIPO DE CAMBIO SUNAT', '6.852', '2', '2019-06-13');
COMMIT;

# | Vaciado de tabla 'tiposmoneda'
# +-------------------------------------
DROP TABLE IF EXISTS `tiposmoneda`;


# | Estructura de la tabla 'tiposmoneda'
# +-------------------------------------
CREATE TABLE `tiposmoneda` (
  `codmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `moneda` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `siglas` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `simbolo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'tiposmoneda'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `tiposmoneda` (`codmoneda`, `moneda`, `siglas`, `simbolo`) VALUES 
      ('1', 'US DOLLAR', 'USD', '$'), 
      ('2', 'EURO', 'EUR', '?'), 
      ('3', 'PESO CHILENO', 'CLP', '$'), 
      ('4', 'DOLAR CANADIENSE', 'CAD', '$'), 
      ('6', 'DOLAR BELIZE', 'BZD', 'B'), 
      ('7', 'SOLES', 'SOL', 'S/.');
COMMIT;

# | Vaciado de tabla 'traspasos'
# +-------------------------------------
DROP TABLE IF EXISTS `traspasos`;


# | Estructura de la tabla 'traspasos'
# +-------------------------------------
CREATE TABLE `traspasos` (
  `idtraspaso` int(11) NOT NULL AUTO_INCREMENT,
  `codtraspaso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `envia` int(11) NOT NULL,
  `recibe` int(11) NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `fechatraspaso` datetime NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idtraspaso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'traspasos'
# +-------------------------------------

# | Vaciado de tabla 'usuarios'
# +-------------------------------------
DROP TABLE IF EXISTS `usuarios`;


# | Estructura de la tabla 'usuarios'
# +-------------------------------------
CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nivel` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` int(2) NOT NULL,
  `comision` decimal(12,2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'usuarios'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `usuarios` (`codigo`, `dni`, `nombres`, `sexo`, `direccion`, `telefono`, `email`, `usuario`, `password`, `nivel`, `status`, `comision`, `codsucursal`) VALUES 
      ('1', '1715233597', 'CRUZ TARQUINO CASTILLO QUIRANZA', 'MASCULINO', 'ATUNTAQUI', '096 9498533', 'TARQUINO1111@GMAIL.COM', 'TARQUINOCASTILLO', '92c44db309b0a5ecf3eb4bc5dcee907230ca48f9', 'ADMINISTRADOR(A) GENERAL', '1', '0.00', '0'), 
      ('2', '1050210309', 'SEBASTIAN ALEJANDRO CASTILLO', 'MASCULINO', 'ATUNTAQUI IBARRA', '(0414) 7225970', 'SEBITASCASTILLO1111@GMAIL.COM', 'SEBASTIANCASTILLO', 'ee615840b91ace94075076fe696489d9b3b2bc99', 'ADMINISTRADOR(A) SUCURSAL', '1', '0.00', '1'), 
      ('3', '1004559777', 'GINA GABRIELA CASTILLO CABRERA', 'FEMENINO', 'SAN ANTONIO', '(0416) 3422924', 'GABRIELACASTILLO1111@GMAIL.COM', 'GABRIELACASTILLO', '41b132f815bc10f82b4b8638c536455b9e70247f', 'SECRETARIA', '1', '0.00', '1'), 
      ('4', '235698745', 'SOFIA VALENTINA CASTILLO CABRERA', 'FEMENINO', 'SAN ANTONIO ATUNTAQUI', '(0274) 9981185', 'SOFIACASTILLO1111@GMAIL.COM', 'SOFIACASTILLO', '100dc7055ff6fb5331d1879bc3dd408a8e841233', 'CAJERO(A)', '1', '0.00', '1'), 
      ('5', '235698744', 'JHONATAN CASTILLO', 'MASCULINO', 'SAN JOSE DE CHORLAVI', '(0414) 7225970', 'JHONATAN@GMAIL.COM', 'JHONATAN', 'e5f3b8c2b9db0d20d0893156b4746c626b4a91ce', 'ADMINISTRADOR(A) SUCURSAL', '1', '0.00', '2');
COMMIT;

# | Vaciado de tabla 'ventas'
# +-------------------------------------
DROP TABLE IF EXISTS `ventas`;


# | Estructura de la tabla 'ventas'
# +-------------------------------------
CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `tipodocumento` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codserie` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codautorizacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `creditopagado` decimal(12,2) NOT NULL,
  `tipopago` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formapago` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montopagado` decimal(12,2) NOT NULL,
  `montodevuelto` decimal(12,2) NOT NULL,
  `fechavencecredito` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechapagado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statusventa` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaventa` datetime NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'ventas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `ventas` (`idventa`, `tipodocumento`, `codcaja`, `codventa`, `codserie`, `codautorizacion`, `codcliente`, `subtotalivasi`, `subtotalivano`, `iva`, `totaliva`, `descuento`, `totaldescuento`, `totalpago`, `totalpago2`, `creditopagado`, `tipopago`, `formapago`, `montopagado`, `montodevuelto`, `fechavencecredito`, `fechapagado`, `statusventa`, `fechaventa`, `observaciones`, `codigo`, `codsucursal`) VALUES 
      ('1', 'TICKET', '3', '0001-000000001', '0001', '9215975725382644540869378324110393622244917279741', 'C1', '24.30', '0.00', '12.00', '2.92', '0.00', '0.82', '26.40', '23.00', '0.00', 'CONTADO', '1', '26.40', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '2021-06-10 02:25:22', '', '4', '1'), 
      ('2', 'FACTURA', '1', '0001-000000002', '0001', '8731412028713334695720951566551698718604632126686', 'C1', '24.30', '0.00', '12.00', '2.92', '0.00', '0.82', '26.40', '23.00', '0.00', 'CONTADO', '1', '26.40', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '2021-06-10 02:39:32', '', '2', '1');
COMMIT;


