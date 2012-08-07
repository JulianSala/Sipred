CREATE DATABASE Sipred; #DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
USE Sipred;



# Creacion de tabla de unidades
CREATE TABLE Unidades (id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,
descripcion VARCHAR(30) NOT NULL,
simbolo VARCHAR (16) NOT NULL,
PRIMARY KEY (id_unidad)) ENGINE=InnoDB;

# Creacion de especificaciones.
CREATE TABLE Esp_1 (id_esp_a VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_a INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_a),
INDEX (id_unidad_a),

CONSTRAINT unidad_esp_1 FOREIGN KEY (id_unidad_a) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Material de fabricacion del producto.' ENGINE=InnoDB;

CREATE TABLE Esp_2 (id_esp_b VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_b INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_b),
INDEX (id_unidad_b),

CONSTRAINT unidad_esp_2 FOREIGN KEY (id_unidad_b) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Tipo de material producto.' ENGINE=InnoDB;

CREATE TABLE Esp_3 (id_esp_c VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_c INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_c),
INDEX (id_unidad_c),

CONSTRAINT unidad_esp_3 FOREIGN KEY (id_unidad_c) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Formato segun el producto.' ENGINE=InnoDB;

CREATE TABLE Esp_4 (id_esp_d VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_d INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_d),
INDEX (id_unidad_d),

CONSTRAINT unidad_esp_4 FOREIGN KEY (id_unidad_d) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Diametro Nominal segun el tipo de producto.' ENGINE=InnoDB;

CREATE TABLE Esp_5 (id_esp_e VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_e INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_e),
INDEX (id_unidad_e),

CONSTRAINT unidad_esp_5 FOREIGN KEY (id_unidad_e) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Espesor segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_6 (id_esp_f VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_f INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_f),
INDEX (id_unidad_f),

CONSTRAINT unidad_esp_6 FOREIGN KEY (id_unidad_f) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Peso segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_7 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_7 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para Rpm segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_8 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_8 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Potencia segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_9 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_9 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Marca segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_10 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_10 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Referencia segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_11 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_11 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Color segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_12 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_12 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Origen segun el tipo de producto.'ENGINE=InnoDB;



# Creacion de tabla de materiales
CREATE TABLE Materiales (grupo VARCHAR(3) NOT NULL,
caracteristicas VARCHAR(6) NOT NULL,
consecutivo INT(3) ZEROFILL NOT NULL DEFAULT 001 ,
descripcion VARCHAR(45) NOT NULL,
unidad_compra INT (4) ZEROFILL NOT NULL,
id_esp_1 VARCHAR(5) NOT NULL,
id_esp_2 VARCHAR(5) NOT NULL,
id_esp_3 VARCHAR(5) NOT NULL,
id_esp_4 VARCHAR(5) NOT NULL,
id_esp_5 VARCHAR(5) NOT NULL,
id_esp_6 VARCHAR(5) NOT NULL,
id_esp_7 VARCHAR(5) NOT NULL,
id_esp_8 VARCHAR(5) NOT NULL,
id_esp_9 VARCHAR(5) NOT NULL,
id_esp_10 VARCHAR(5) NOT NULL,
id_esp_11 VARCHAR(5) NOT NULL,
id_esp_12 VARCHAR(5) NOT NULL,

PRIMARY KEY (grupo, caracteristicas, consecutivo),
INDEX Id_material (grupo, caracteristicas, consecutivo),
INDEX (id_esp_1),
INDEX (id_esp_2),
INDEX (id_esp_3),
INDEX (id_esp_4),
INDEX (id_esp_5),
INDEX (id_esp_6),
INDEX (id_esp_7),
INDEX (id_esp_8),
INDEX (id_esp_9),
INDEX (id_esp_10),
INDEX (id_esp_11),
INDEX (id_esp_12),

CONSTRAINT esp_1 FOREIGN KEY (id_esp_1) REFERENCES Esp_1 (id_esp_a)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_2 FOREIGN KEY (id_esp_2) REFERENCES Esp_2 (id_esp_b)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_3 FOREIGN KEY (id_esp_3) REFERENCES Esp_3 (id_esp_c)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_4 FOREIGN KEY (id_esp_4) REFERENCES Esp_4 (id_esp_d)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_5 FOREIGN KEY (id_esp_5) REFERENCES Esp_5 (id_esp_e)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_6 FOREIGN KEY (id_esp_6) REFERENCES Esp_6 (id_esp_f)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_7 FOREIGN KEY (id_esp_7) REFERENCES Esp_7 (id_esp)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_8 FOREIGN KEY (id_esp_8) REFERENCES Esp_8 (id_esp)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_9 FOREIGN KEY (id_esp_9) REFERENCES Esp_9 (id_esp)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_10 FOREIGN KEY (id_esp_10) REFERENCES Esp_10 (id_esp)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_11 FOREIGN KEY (id_esp_11) REFERENCES Esp_11 (id_esp)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_12 FOREIGN KEY (id_esp_12) REFERENCES Esp_12 (id_esp)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Tabla generica de referencia para todos los materiales prima.' ENGINE=InnoDB;

#UPDATE Materiales SET id_material=CONCAT(grupo,'-',caracteristicas,'-',consecutivo) ;

# Creacion de tabla de proveedores
CREATE TABLE Proveedores (id_proveedores VARCHAR(5) NOT NULL,
razon_social VARCHAR(30)  NOT NULL,
Numero_Nit BIGINT NOT NULL,
ciudad VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
direccion VARCHAR(45),
telefono BIGINT NOT NULL,
contacto VARCHAR (45) NOT NULL,
email VARCHAR (48),
PRIMARY KEY (id_proveedores)) ENGINE=InnoDB;


# Creacion de tabla de precios
CREATE TABLE Precios (id_precio INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,
grupo_m VARCHAR(3) NOT NULL,
caracteristicas_m VARCHAR(6) NOT NULL,
consecutivo_m INT(3) ZEROFILL NOT NULL,
precio INT(16) NULL,
id_unidad INT (4) ZEROFILL NOT NULL,
comentarios VARCHAR(240) NULL,
id_proveedores VARCHAR(5) NOT NULL,


PRIMARY KEY (id_precio),
INDEX (grupo_m, caracteristicas_m, consecutivo_m),
INDEX (id_unidad),
INDEX (id_proveedores),

CONSTRAINT material FOREIGN KEY (grupo_m, caracteristicas_m, consecutivo_m) REFERENCES Materiales (grupo, caracteristicas, consecutivo)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_precio FOREIGN KEY (id_unidad) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT proveedores FOREIGN KEY (id_proveedores) REFERENCES Proveedores (id_proveedores)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Tabla general de Precios de todos los materiales existentes.' ENGINE=InnoDB;
