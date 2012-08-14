
# Creacion de tabla de laminas
CREATE TABLE Laminas (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todas las Laminas.' ENGINE=InnoDB;


# Creacion de tabla de perfiles
CREATE TABLE Perfiles (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todas las Perfiles.' ENGINE=InnoDB;



# Creacion de tabla de Tornilleria
CREATE TABLE Tornilleria (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todas las Tornilleria.' ENGINE=InnoDB;


# Creacion de tabla de Aceros
CREATE TABLE Aceros (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todos los Aceros.' ENGINE=InnoDB;


# Creacion de tabla de pines
CREATE TABLE Pines (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todos los Pines.' ENGINE=InnoDB;



# Creacion de tabla de rodamientos
CREATE TABLE Rodamientos (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todas las Rodamientos.' ENGINE=InnoDB;

# Creacion de tabla de Acabados
CREATE TABLE Acabados (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todos los Acabados.' ENGINE=InnoDB;


# Creacion de tabla de Cauchos
CREATE TABLE Cauchos (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todos los Cauchos.' ENGINE=InnoDB;


# Creacion de tabla de Accesorios de equipos
CREATE TABLE Accesorios_Equipos (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todos los accesorios de Equipos.' ENGINE=InnoDB;



# Creacion de tabla de elementos de transmision de Potencia
CREATE TABLE Trans_Potencia (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todos los elementos de transmision de potencia.' ENGINE=InnoDB;



# Creacion de tabla de elementos de Amarre
CREATE TABLE Elem_Amarre (grupo VARCHAR(3) NOT NULL,
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
id_esp_12 VARCHAR(5) NOT NULL)

COMMENT = 'Tabla generica de referencia para todos los elementos de Amarre.' ENGINE=InnoDB;
