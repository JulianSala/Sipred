
#Insertar datos en las tablas de la base de datos SIPRED


#Inserta y carga todos los datos de la tabla de Unidades
#LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Unidades.csv' REPLACE INTO TABLE Unidades
#FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' 
#IGNORE 1 LINES;


#Inserta y carga todos los datos de las tablas de Especificaciones:

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_1.csv' REPLACE INTO TABLE Esp_1 
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_2.csv' REPLACE INTO TABLE Esp_2
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_3.csv' REPLACE INTO TABLE Esp_3
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_4.csv' REPLACE INTO TABLE Esp_4
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_5.csv' REPLACE INTO TABLE Esp_5
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_6.csv' REPLACE INTO TABLE Esp_6
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_7.csv' REPLACE INTO TABLE Esp_7
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_8.csv' REPLACE INTO TABLE Esp_8
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_9.csv' REPLACE INTO TABLE Esp_9
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_10.csv' REPLACE INTO TABLE Esp_10
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_11.csv' REPLACE INTO TABLE Esp_11
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Esp_12.csv' REPLACE INTO TABLE Esp_12
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;



#Inserta y carga todos los datos de la tabla de Proveedores
LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Proveedores.csv' REPLACE INTO TABLE Proveedores
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;




#Inserta y carga todos los datos de la tabla Materiales

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Materiales.csv' REPLACE INTO TABLE Materiales
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES;




#Inserta y carga todos los datos de la tabla de Precios

#LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\ARCHIVOS CVS\\Precios.csv' REPLACE INTO TABLE Precios
#FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
#IGNORE 1 LINES

 
