CREATE DATABASE Sipred;
USE Sipred;



# Creacion de tabla de unidades
CREATE TABLE Unidades (id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,
descripcion VARCHAR(30) NOT NULL,
simbolo VARCHAR (16) NOT NULL,
PRIMARY KEY (id_unidad)) ENGINE=InnoDB;





# Creacion de especificaciones.
CREATE TABLE Esp_1 (id_esp_mat VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_mat INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_mat),
INDEX (id_unidad_mat),

CONSTRAINT unidad_esp_1 FOREIGN KEY (id_unidad_mat) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Material de fabricacion del producto.' ENGINE=InnoDB;

CREATE TABLE Esp_2 (id_esp_tip VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_tip INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_tip),
INDEX (id_unidad_tip),

CONSTRAINT unidad_esp_2 FOREIGN KEY (id_unidad_tip) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Tipo de material producto.' ENGINE=InnoDB;

CREATE TABLE Esp_3 (id_esp_for VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_for INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_for),
INDEX (id_unidad_for),

CONSTRAINT unidad_esp_3 FOREIGN KEY (id_unidad_for) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Formato segun el producto.' ENGINE=InnoDB;

CREATE TABLE Esp_4 (id_esp_dia VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_dia INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_dia),
INDEX (id_unidad_dia),

CONSTRAINT unidad_esp_4 FOREIGN KEY (id_unidad_dia) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Diametro Nominal segun el tipo de producto.' ENGINE=InnoDB;

CREATE TABLE Esp_5 (id_esp_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_esp INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_esp),
INDEX (id_unidad_esp),

CONSTRAINT unidad_esp_5 FOREIGN KEY (id_unidad_esp) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Espesor segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_6 (id_esp_pes VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_pes INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_pes),
INDEX (id_unidad_pes),

CONSTRAINT unidad_esp_6 FOREIGN KEY (id_unidad_pes) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Peso segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_7 (id_esp_rpm VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_rpm INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_rpm),
INDEX (id_unidad_rpm),

CONSTRAINT unidad_esp_7 FOREIGN KEY (id_unidad_rpm) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para Rpm segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_8 (id_esp_pot VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_pot INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_pot),
INDEX (id_unidad_pot),

CONSTRAINT unidad_esp_8 FOREIGN KEY (id_unidad_pot) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Potencia segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_9 (id_esp_mar VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_mar INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_mar),
INDEX (id_unidad_mar),

CONSTRAINT unidad_esp_9 FOREIGN KEY (id_unidad_mar) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Marca segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_10 (id_esp_ref VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_ref INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_ref),
INDEX (id_unidad_ref),

CONSTRAINT unidad_esp_10 FOREIGN KEY (id_unidad_ref) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Referencia segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_11 (id_esp_col VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_col INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_col),
INDEX (id_unidad_col),

CONSTRAINT unidad_esp_11 FOREIGN KEY (id_unidad_col) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Color segun el tipo de producto.'ENGINE=InnoDB;

CREATE TABLE Esp_12 (id_esp_ori VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_ori INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_ori),
INDEX (id_unidad_ori),

CONSTRAINT unidad_esp_12 FOREIGN KEY (id_unidad_ori) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Origen segun el tipo de producto.'ENGINE=InnoDB;





# Creacion de tabla de materiales
CREATE TABLE Materiales (grupo VARCHAR(3) NOT NULL,
caracteristicas VARCHAR(6) NOT NULL,
consecutivo INT(3) ZEROFILL NOT NULL DEFAULT 001 ,
descripcion VARCHAR(45) NOT NULL,
unidad_compra INT (4) ZEROFILL NOT NULL,
id_esp_1 VARCHAR(5) NOT NULL,
id_und_1 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_2 VARCHAR(5) NOT NULL,
id_und_2 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_3 VARCHAR(5) NOT NULL,
id_und_3 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_4 VARCHAR(5) NOT NULL,
id_und_4 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_5 VARCHAR(5) NOT NULL,
id_und_5 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_6 VARCHAR(5) NOT NULL,
id_und_6 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_7 VARCHAR(5) NOT NULL,
id_und_7 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_8 VARCHAR(5) NOT NULL,
id_und_8 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_9 VARCHAR(5) NOT NULL,
id_und_9 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_10 VARCHAR(5) NOT NULL,
id_und_10 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_11 VARCHAR(5) NOT NULL,
id_und_11 INT (4) ZEROFILL NOT NULL DEFAULT 001,
id_esp_12 VARCHAR(5) NOT NULL,
id_und_12 INT (4) ZEROFILL NOT NULL DEFAULT 001,

PRIMARY KEY (grupo, caracteristicas, consecutivo),
INDEX Id_material (grupo, caracteristicas, consecutivo),
INDEX (id_esp_1),
INDEX (id_und_1),
INDEX (id_esp_2),
INDEX (id_und_2),
INDEX (id_esp_3),
INDEX (id_und_3),
INDEX (id_esp_4),
INDEX (id_und_4),
INDEX (id_esp_5),
INDEX (id_und_5),
INDEX (id_esp_6),
INDEX (id_und_6),
INDEX (id_esp_7),
INDEX (id_und_7),
INDEX (id_esp_8),
INDEX (id_und_8),
INDEX (id_esp_9),
INDEX (id_und_9),
INDEX (id_esp_10),
INDEX (id_und_10),
INDEX (id_esp_11),
INDEX (id_und_11),
INDEX (id_esp_12),
INDEX (id_und_12),

CONSTRAINT esp_1 FOREIGN KEY (id_esp_1) REFERENCES Esp_1 (id_esp_mat)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_1 FOREIGN KEY (id_und_1) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_2 FOREIGN KEY (id_esp_2) REFERENCES Esp_2 (id_esp_tip)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_2 FOREIGN KEY (id_und_2) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_3 FOREIGN KEY (id_esp_3) REFERENCES Esp_3 (id_esp_for)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_3 FOREIGN KEY (id_und_3) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_4 FOREIGN KEY (id_esp_4) REFERENCES Esp_4 (id_esp_dia)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_4 FOREIGN KEY (id_und_4) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_5 FOREIGN KEY (id_esp_5) REFERENCES Esp_5 (id_esp_esp)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_5 FOREIGN KEY (id_und_5) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_6 FOREIGN KEY (id_esp_6) REFERENCES Esp_6 (id_esp_pes)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_6 FOREIGN KEY (id_und_6) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_7 FOREIGN KEY (id_esp_7) REFERENCES Esp_7 (id_esp_rpm)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_7 FOREIGN KEY (id_und_7) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_8 FOREIGN KEY (id_esp_8) REFERENCES Esp_8 (id_esp_pot)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_8 FOREIGN KEY (id_und_8) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_9 FOREIGN KEY (id_esp_9) REFERENCES Esp_9 (id_esp_mar)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_9 FOREIGN KEY (id_und_9) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_10 FOREIGN KEY (id_esp_10) REFERENCES Esp_10 (id_esp_ref)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_10 FOREIGN KEY (id_und_10) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_11 FOREIGN KEY (id_esp_11) REFERENCES Esp_11 (id_esp_col)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_11 FOREIGN KEY (id_und_11) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_12 FOREIGN KEY (id_esp_12) REFERENCES Esp_12 (id_esp_ori)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_12 FOREIGN KEY (id_und_12) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)

COMMENT = 'Tabla generica de referencia para todos los materiales prima.' ENGINE=InnoDB;







# Creacion de tabla de proveedores
CREATE TABLE Proveedores (id_proveedores VARCHAR(6) NOT NULL,
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
id_unidad_pre INT (4) ZEROFILL NOT NULL,
comentarios VARCHAR(240) NULL,
id_proveedores_pre VARCHAR(6) NOT NULL,


PRIMARY KEY (id_precio),
INDEX (grupo_m, caracteristicas_m, consecutivo_m),
INDEX (id_unidad_pre),
INDEX (id_proveedores_pre),

CONSTRAINT material FOREIGN KEY (grupo_m, caracteristicas_m, consecutivo_m) REFERENCES Materiales (grupo, caracteristicas, consecutivo)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unidad_pre FOREIGN KEY (id_unidad_pre) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT proveedores FOREIGN KEY (id_proveedores_pre) REFERENCES Proveedores (id_proveedores)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Tabla general de Precios de todos los materiales existentes.' ENGINE=InnoDB;
