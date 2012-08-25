CREATE DATABASE SipredBP;
USE SipredBP;



# Creacion de Tabla Gestor Comerciales
CREATE TABLE Gestor_comercial (id_comercial VARCHAR (3) NOT NULL,
Nombre VARCHAR(45) NOT NULL,
Cargo VARCHAR(35) NOT NULL,

PRIMARY KEY (id_comercial)) ENGINE=InnoDB;




# Creacion de tabla de Prioridades
CREATE TABLE Prioridades (id_prioridades VARCHAR(2) NOT NULL,
Prioridad VARCHAR(30)  NOT NULL,

PRIMARY KEY (id_prioridades)) ENGINE=InnoDB;






# Creacion de tabla de Estado
CREATE TABLE Estado (id_estado VARCHAR (2) NOT NULL,
simbolo VARCHAR(25) NOT NULL,

PRIMARY KEY (id_estado)) ENGINE=InnoDB;






# Creacion de Tabla Cliente
CREATE TABLE Cliente (id_cliente INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,
Nombre_cliente VARCHAR (60) NOT NULL,
Contacto VARCHAR (45) NOT NULL,
Telefono BIGINT NOT NULL,
Mail VARCHAR (48),
Ciudad VARCHAR(45) NOT NULL,


PRIMARY KEY (id_cliente)) ENGINE=InnoDB;









# Creacion de Tabla de Gestor de Proyectos
CREATE TABLE Planeador (id_planeador INT(4) ZEROFILL AUTO_INCREMENT NOT NULL,
Clientes INT(4) ZEROFILL NOT NULL,
Gestor VARCHAR (3) NOT NULL,
DC ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
PR ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
PD ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
FB ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
MT ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
OC ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
CE ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
Descripcion VARCHAR(350) NOT NULL,
Fecha_Solicitud DATETIME NOT NULL,
Prioridad VARCHAR (2) NOT NULL,
Dificultad INT (2) NOT NULL,
Progreso INT(3) NOT NULL,
FL ENUM ('Y', 'N') DEFAULT 'N' NOT NULL,
Fecha_Estimada DATETIME NULL,
Fecha_Entrega DATETIME NOT NULL,
Observaciones VARCHAR (300) NULL,
Revision VARCHAR (10) NULL,
Estado VARCHAR(2) NOT NULL,
Referencia VARCHAR (14) NULL,


PRIMARY KEY (id_planeador),
INDEX (Gestor),
INDEX (Clientes),
INDEX (Prioridad),
INDEX (Estado),


CONSTRAINT GestorComercial FOREIGN KEY (Gestor) REFERENCES Gestor_comercial (id_comercial)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT empresas FOREIGN KEY (Clientes) REFERENCES Cliente (id_cliente)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT prioridades FOREIGN KEY (Prioridad) REFERENCES Prioridades (id_prioridades)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT estado FOREIGN KEY (Estado) REFERENCES Estado (id_estado)
ON UPDATE CASCADE ON DELETE RESTRICT)


COMMENT = 'Tabla maestra del Gestor de Proyectos.' ENGINE=InnoDB;



# Creacion de Tabla Equipos
CREATE TABLE Equipos (id_equipos INT(4) ZEROFILL NOT NULL,
Nombre_Equipo VARCHAR(45) NOT NULL,

PRIMARY KEY (id_equipos)) ENGINE=InnoDB;






# Creacion de Tabla Jerarquia
CREATE TABLE Jerarquia (id_jerarquia INT (4) ZEROFILL NOT NULL,
Je_num_proyecto INT (4) ZEROFILL AUTO_INCREMENT NOT NULL,
Proyecto_master INT (3) NULL,

PRIMARY KEY (id_jerarquia),
INDEX (Je_num_proyecto),


CONSTRAINT num_proyectos FOREIGN KEY (Je_num_proyecto) REFERENCES Planeador (id_planeador)
ON UPDATE CASCADE ON DELETE RESTRICT)

ENGINE=InnoDB;







# Creacion de tabla de Referencias
CREATE TABLE Referencias (id_referencia INT (4) ZEROFILL NOT NULL,
equipo INT (4) ZEROFILL NOT NULL,

INDEX (equipo),
INDEX (id_referencia),

CONSTRAINT equipos FOREIGN KEY (equipo) REFERENCES Equipos (id_equipos)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT ref FOREIGN KEY (id_referencia) REFERENCES Planeador (id_planeador)
ON UPDATE CASCADE ON DELETE RESTRICT)

ENGINE=InnoDB;







# Creacion de tabla de Modificaciones
CREATE TABLE Modificaciones (id_modificacion INT ZEROFILL NOT NULL,
proyecto INT (4) ZEROFILL NOT NULL,
Fecha_Cambio DATETIME,
Cambio_Realizado TEXT,

INDEX (proyecto),

CONSTRAINT cambio FOREIGN KEY (proyecto) REFERENCES Planeador (id_planeador)
ON UPDATE CASCADE ON DELETE RESTRICT) ENGINE=InnoDB;

