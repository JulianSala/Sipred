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
# Create master table for materials, this table must allocate
# the list of all materials.
# This script need run after:
# init_tables.sql
#
# Use this script like:
# $ mysql < init_master_table.sql
#
#
# TODO:
# Inprove check funtions and automatization in names an creator
# function.
#

USE Sipred;

SET @l_proc_id := 'Creating master table.';
CALL Debug.debug_on(@l_proc_id);

CALL Debug.debug_insert(@l_proc_id,'Creating master table.');

SET @_master_table_exists_ := (SELECT IF(EXISTS(SELECT TABLE_NAME FROM
                               INFORMATION_SCHEMA.TABLES
                               WHERE TABLE_SCHEMA = 'Sipred'
                               AND TABLE_NAME = 'Materiales'), 'yes', 'no'));

CALL Debug.debug_insert(@l_proc_id, CONCAT('Materiales table already exist: ',
                        @_master_table_exists_));

CREATE TABLE IF NOT EXISTS Materiales (grupo VARCHAR(3) NOT NULL,
caracteristicas VARCHAR(6) NOT NULL,
consecutivo INT(3) ZEROFILL NOT NULL DEFAULT 001 ,
descripcion VARCHAR(45) NOT NULL,
unidad_compra INT (4) ZEROFILL NOT NULL,
col_esp_1 VARCHAR(5) NOT NULL,
col_esp_2 VARCHAR(5) NOT NULL,
col_esp_3 VARCHAR(5) NOT NULL,
col_esp_4 VARCHAR(5) NOT NULL,
col_esp_5 VARCHAR(5) NOT NULL,
col_esp_6 VARCHAR(5) NOT NULL,
col_esp_7 VARCHAR(5) NOT NULL,
col_esp_8 VARCHAR(5) NOT NULL,
col_esp_9 VARCHAR(5) NOT NULL,
col_esp_10 VARCHAR(5) NOT NULL,
col_esp_11 VARCHAR(5) NOT NULL,
col_esp_12 VARCHAR(5) NOT NULL,

PRIMARY KEY (grupo, caracteristicas, consecutivo),
INDEX Id_material (grupo, caracteristicas, consecutivo),
INDEX (col_esp_1),
INDEX (col_esp_2),
INDEX (col_esp_3),
INDEX (col_esp_4),
INDEX (col_esp_5),
INDEX (col_esp_6),
INDEX (col_esp_7),
INDEX (col_esp_8),
INDEX (col_esp_9),
INDEX (col_esp_10),
INDEX (col_esp_11),
INDEX (col_esp_12),

CONSTRAINT esp_1 FOREIGN KEY (col_esp_1) REFERENCES Esp_1 (id_esp_1)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_2 FOREIGN KEY (col_esp_2) REFERENCES Esp_2 (id_esp_2)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_3 FOREIGN KEY (col_esp_3) REFERENCES Esp_3 (id_esp_3)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_4 FOREIGN KEY (col_esp_4) REFERENCES Esp_4 (id_esp_4)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_5 FOREIGN KEY (col_esp_5) REFERENCES Esp_5 (id_esp_5)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_6 FOREIGN KEY (col_esp_6) REFERENCES Esp_6 (id_esp_6)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_7 FOREIGN KEY (col_esp_7) REFERENCES Esp_7 (id_esp_7)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_8 FOREIGN KEY (col_esp_8) REFERENCES Esp_8 (id_esp_8)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_9 FOREIGN KEY (col_esp_9) REFERENCES Esp_9 (id_esp_9)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_10 FOREIGN KEY (col_esp_10) REFERENCES Esp_10 (id_esp_10)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_11 FOREIGN KEY (col_esp_11) REFERENCES Esp_11 (id_esp_11)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT esp_12 FOREIGN KEY (col_esp_12) REFERENCES Esp_12 (id_esp_12)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Tabla generica de referencia para todos los materiales.' 
ENGINE=InnoDB;

CALL Debug.debug_insert(@l_proc_id, 'Master table it is ready.');

SHOW WARNINGS;

CALL Debug.debug_off(@l_proc_id);
