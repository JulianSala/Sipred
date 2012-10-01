################################################################################
##
##  Copyright   : (C) 2012 Dismet S.A.S.
##              : Edwin Libardo Vasquez
##  Supervised  : Julian Salamanca Espinosa
##  e-mail      : julian.sse@gmail.com
##              : edwincart@hotmail.com
##
################################################################################
##
##  SQL_price_table.sql is part of Sipred.
##
##    Sipred is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    Sipred is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with Sipred. If not, see <http://www.gnu.org/licenses/>.
##
################################################################################
#
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

################################################################################

CREATE TABLE Unidades (id_und INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
descripcion VARCHAR(30) NOT NULL,
simbolo VARCHAR(16) NOT NULL,
PRIMARY KEY (id_und))
COMMENT = 'Designación de las unidades para las distintas tablas' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_1');

CREATE TABLE Esp_1 (id_esp_1 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_1 INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_1),
INDEX (id_und_1),

CONSTRAINT und_esp_1 FOREIGN KEY (id_und_1) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Material de fabricacion del producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_2');

CREATE TABLE Esp_2 (id_esp_2 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_2 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_2),
INDEX (id_und_2),

CONSTRAINT und_esp_2 FOREIGN KEY (id_und_2) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Tipo de material producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_3');

CREATE TABLE Esp_3 (id_esp_3 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_3 INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_3),
INDEX (id_und_3),

CONSTRAINT und_esp_3 FOREIGN KEY (id_und_3) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Formato segun el producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################Debug.debug_on

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_4');

CREATE TABLE Esp_4 (id_esp_4 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_4 INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_4),
INDEX (id_und_4),

CONSTRAINT und_esp_4 FOREIGN KEY (id_und_4) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Diametro Nominal segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_5');

CREATE TABLE Esp_5 (id_esp_5 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_5 INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_5),
INDEX (id_und_5),

CONSTRAINT und_esp_5 FOREIGN KEY (id_und_5) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Espesor segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_6');

CREATE TABLE Esp_6 (id_esp_6 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_6 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_6),
INDEX (id_und_6),

CONSTRAINT und_esp_6 FOREIGN KEY (id_und_6) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Peso segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_7');

CREATE TABLE Esp_7 (id_esp_7 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_7 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_7),
INDEX (id_und_7),

CONSTRAINT und_esp_7 FOREIGN KEY (id_und_7) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para Rpm segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_8');

CREATE TABLE Esp_8 (id_esp_8 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_8 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_8),
INDEX (id_und_8),

CONSTRAINT und_esp_8 FOREIGN KEY (id_und_8) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Potencia segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_9');

CREATE TABLE Esp_9 (id_esp_9 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_9 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_9),
INDEX (id_und_9),

CONSTRAINT und_esp_9 FOREIGN KEY (id_und_9) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Marca segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_10');

CREATE TABLE Esp_10 (id_esp_10 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_10 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_10),
INDEX (id_und_10),

CONSTRAINT und_esp_10 FOREIGN KEY (id_und_10) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para la Referencia segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_11');

CREATE TABLE Esp_11 (id_esp_11 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_11 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_11),
INDEX (id_und_11),

CONSTRAINT und_esp_11 FOREIGN KEY (id_und_11) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Color segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Esp_12');

CREATE TABLE Esp_12 (id_esp_12 VARCHAR(5) NOT NULL,
esp VARCHAR(45) NOT NULL,
id_und_12 INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,

PRIMARY KEY (id_esp_12),
INDEX (id_und_12),

CONSTRAINT und_esp_12 FOREIGN KEY (id_und_12) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Designacion para el Origen segun el tipo de producto.' ENGINE=InnoDB;

SHOW WARNINGS;

CALL Debug.debug_off(@l_proc_id);

################################################################################
