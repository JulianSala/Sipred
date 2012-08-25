#############################################################################
##
##  Copyright   : (C) 2012 Dismet S.A.S.
##              : Edwin Libardo Vasquez
##  Supervised  : Julian Salamanca Espinosa
##  e-mail      : julian.sse@gmail.com
##              : edwincart@hotmail.com
##
#############################################################################
##
##  BP_init_tables.sql is part of Sipred.
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
#############################################################################

##
# Create basic tables for be used in budget tables of Sipred System
#
# this script do not allow load data from external resources like
# csvs or text files
# Use this script without parameters:
#
# $ mysql <
##


USE SipredBP;

SET @l_proc_id := 'Creating tables';
CALL Debug.debug_on(@l_proc_id);
CALL Debug.debug_insert(@l_proc_id, 'Creating table SalesRep');

################################################################################

CREATE TABLE SalesRep (id_sales VARCHAR (3) NOT NULL,
name VARCHAR(45) NOT NULL,
position VARCHAR(35) NOT NULL,
mail VARCHAR(45),
phone BIGINT,
PRIMARY KEY (id_sales))
COMMENT = 'Tabla para almacenar los nombre e identidades de los gestores 
comerciales' ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Priority');

CREATE TABLE Priority (id_priority VARCHAR(2) NOT NULL,
description VARCHAR(30) NOT NULL,
PRIMARY KEY (id_priority))
COMMENT = 'Tabla para almacenar los niveles de prioridad de los presupuestos'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table State');

CREATE TABLE States (id_state VARCHAR(2) NOT NULL,
description VARCHAR(30) NOT NULL,
PRIMARY KEY (id_state))
COMMENT = 'Tabla para almacenar los distintos estados de cada presupuesto'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Clients');

CREATE TABLE Clients (id_client INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
client_name VARCHAR(60) NOT NULL,
contact_name VARCHAR(45),
phone BIGINT,
mail VARCHAR(45),
city VARCHAR(30),
PRIMARY KEY (id_client))
COMMENT = 'Tabla para almacenas de manera general los clientes'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Planner');

CREATE TABLE Planner (id_planner INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
client INT(4) ZEROFILL NOT NULL COMMENT 'Client ID',
sales_rep VARCHAR (3) NOT NULL COMMENT 'Sales representative',
DC ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Documentation',
PR ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Budget',
PD ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Predesign',
FB ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Fabrication',
MT ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Commisioning',
OC ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Civil Works',
CE ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Electric Control',
description TEXT,
request_date DATETIME NOT NULL,
budget_priority VARCHAR(2) NOT NULL,
dificulty INT(2) NOT NULL,
progress INT(3) NOT NULL,
FL ENUM ('Y', 'N') DEFAULT 'N' NOT NULL COMMENT 'Limit date is required',
est_date DATETIME NULL COMMENT 'Estimated send date and time',
send_date DATETIME NULL COMMENT 'Send date and time',
comments TEXT,
revision ENUM ('R0', 'R1', 'R2', 'R3', 'R4', 'R5', 'R6', 'R7', 'R8', 'R9') DEFAULT 'R0' NOT NULL,
budget_state VARCHAR(2) NOT NULL,

PRIMARY KEY (id_planner),
INDEX (client),
INDEX (sales_rep),
INDEX (budget_priority),
INDEX (budget_state),

CONSTRAINT client FOREIGN KEY (client) REFERENCES Clients (id_client)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT sales_rep FOREIGN KEY (sales_rep) REFERENCES SalesRep (id_sales)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT budget_priority FOREIGN KEY (budget_priority) REFERENCES Priority (id_priority)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT budget_state FOREIGN KEY (budget_state) REFERENCES States (id_state)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Tabla maestra del Gestor de Proyectos'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Equipment');

CREATE TABLE Equipments (id_equipment INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
equipment_name VARCHAR(45) NOT NULL,
PRIMARY KEY (id_equipment))
COMMENT = 'Tabla para almacenar el listado de equipos comercializados'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Reference');

CREATE TABLE Reference (id_reference INT ZEROFILL AUTO_INCREMENT NOT NULL,
project INT(4) ZEROFILL NOT NULL,
equipment INT(4) NOT NULL,

PRIMARY KEY (id_reference),
INDEX (project),
INDEX (equipment),

CONSTRAINT project FOREIGN KEY (project) REFERENCES Planner (id_planner)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT equipment FOREIGN KEY (equipment) REFERENCES Equipments (id_equipment)
ON UPDATE CASCADE ON DELETE RESTRICT)
COMMENT = 'Almacenar los equipos relacionados con cada proyecto'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

CALL Debug.debug_insert(@l_proc_id, 'Creating table Modification');

CREATE TABLE Modifications (id_modification INT(3) ZEROFILL AUTO_INCREMENT NOT NULL,
description VARCHAR(45) NOT NULL,
PRIMARY KEY (id_modification))
COMMENT = 'Tabla para almacenar los posibles cambios registrables'
ENGINE=InnoDB;

SHOW WARNINGS;

################################################################################

# CALL Debug.debug_insert(@l_proc_id, 'Creating table Register');
# 
# CREATE TABLE Register (id_register INT ZEROFILL AUTO_INCREMENT NOT NULL,
# project_changed INT(4) ZEROFILL NOT NULL,
# step_before 
# )

# SHOW WARNINGS;

CALL Debug.debug_off(@l_proc_id);

