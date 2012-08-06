##
# Create basic tables for be used for Master table of Sipred Sistem
#
# this script do not allow load data from external resources like
# csvs or text files
# Use this script without parameters:
#
# $ mysql <
##

# TODO: Create general scripts for create each table

USE Sipred;

SET @l_proc_id := 'Creating tables';
CALL Debug.debug_on(@l_proc_id);
CALL Debug.debug_insert(@l_proc_id, 'Creating table Unidades');

CREATE TABLE Unidades (id_unidad INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
descripcion VARCHAR(30) NOT NULL,
simbolo VARCHAR(16) NOT NULL,
PRIMARY KEY (id_unidad))
COMMENT = 'Designación de las unidades para las distintas tablas' ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_1');

CREATE TABLE Esp_1 (id_esp_a VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_a INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_a),
INDEX (id_unidad_a),

CONSTRAINT unidad_esp_1 FOREIGN KEY (id_unidad_a) REFERENCES Unidades (id_unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Material de fabricacion del producto.' ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_2');

CREATE TABLE Esp_2 (id_esp_b VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_b INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_b),
INDEX (id_unidad_b),

CONSTRAINT unidad_esp_2 FOREIGN KEY (id_unidad_b) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Tipo de material producto.' ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_3');

CREATE TABLE Esp_3 (id_esp_c VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_c INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_c),
INDEX (id_unidad_c),

CONSTRAINT unidad_esp_3 FOREIGN KEY (id_unidad_c) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Formato segun el producto.' ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_4');

CREATE TABLE Esp_4 (id_esp_d VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_d INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_d),
INDEX (id_unidad_d),

CONSTRAINT unidad_esp_4 FOREIGN KEY (id_unidad_d) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Diametro Nominal segun el tipo de producto.' ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_5');

CREATE TABLE Esp_5 (id_esp_e VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_e INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_e),
INDEX (id_unidad_e),

CONSTRAINT unidad_esp_5 FOREIGN KEY (id_unidad_e) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Espesor segun el tipo de producto.'ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_6');

CREATE TABLE Esp_6 (id_esp_f VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad_f INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_f),
INDEX (id_unidad_f),

CONSTRAINT unidad_esp_6 FOREIGN KEY (id_unidad_f) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Peso segun el tipo de producto.'ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_7');

CREATE TABLE Esp_7 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_7 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para Rpm segun el tipo de producto.'ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_8');

CREATE TABLE Esp_8 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_8 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Potencia segun el tipo de producto.'ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_9');

CREATE TABLE Esp_9 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_9 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Marca segun el tipo de producto.'ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_10');

CREATE TABLE Esp_10 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_10 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Referencia segun el tipo de producto.'ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_11');

CREATE TABLE Esp_11 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_11 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Color segun el tipo de producto.'ENGINE=InnoDB;


CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_12');

CREATE TABLE Esp_12 (id_esp VARCHAR(5) NOT NULL,
especificacion VARCHAR(45) NOT NULL,
id_unidad INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp),
INDEX (id_unidad),

CONSTRAINT unidad_esp_12 FOREIGN KEY (id_unidad) REFERENCES Unidades (id_Unidad)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Origen segun el tipo de producto.'ENGINE=InnoDB;

CALL Debug.debug_off(@l_proc_id);
