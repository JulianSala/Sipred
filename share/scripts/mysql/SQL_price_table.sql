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

##
# Create price table for be used in budget of Sipred System
#
# this script do not allow load data from external resources like
# csvs or text files
# Use this script without parameters:
#
# $ mysql <
##

USE Sipred;

SET @l_proc_id := 'Creating tables';
CALL Debug.debug_on(@l_proc_id);
CALL Debug.debug_insert(@l_proc_id, 'Creating table Providers');

################################################################################

CREATE TABLE Providers (id_provider INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
provider_name VARCHAR(45) NOT NULL,
contact_name VARCHAR(45),
mail VARCHAR(45),
phone BIGINT,
PRIMARY KEY (id_provider))
COMMENT = 'Tabla para almacenar los datos de proveedores.'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Prices');

CREATE TABLE Prices (id_price INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
material_group VARCHAR(3) NOT NULL COMMENT 'Corresponding material group',
material_car VARCHAR(6) NOT NULL COMMENT 'Corresponding material caracteristics code',
material_count INT(3) ZEROFILL NOT NULL,
price DOUBLE (10,3),
unit_price INT(4) ZEROFILL NOT NULL,
commits TEXT,
provider INT(4) ZEROFILL NOT NULL,

PRIMARY KEY (id_price),
INDEX (material_group, material_car, material_count),
INDEX (unit_price),
INDEX (provider),

CONSTRAINT material FOREIGN KEY (material_group, material_car, material_count) REFERENCES Materiales (grupo, caracteristicas, consecutivo)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT unit FOREIGN KEY (unit_price) REFERENCES Unidades (id_und)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT provider FOREIGN KEY (provider) REFERENCES Providers (id_provider)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Tabla general de Precios de todos los materiales existentes.' 
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_off(@l_proc_id);
