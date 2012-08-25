

#Inserta y carga todos los datos de la Tabla de Equipos:

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\SIPRED BUDGET PLANER\\ARCHIVOS CSV\\Equipos.csv' REPLACE INTO TABLE Equipos 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;




#Inserta y carga todos los datos de la Tabla Estado:

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\SIPRED BUDGET PLANER\\ARCHIVOS CSV\\Estado.csv' REPLACE INTO TABLE Estado 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;






#Inserta y carga todos los datos de la Tabla Gestores:

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\SIPRED BUDGET PLANER\\ARCHIVOS CSV\\Gestores.csv' 
REPLACE INTO TABLE Gestor_comercial
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;





#Inserta y carga todos los datos de la Tabla Prioridades:

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\SIPRED BUDGET PLANER\\ARCHIVOS CSV\\Prioridades.csv' 
REPLACE INTO TABLE Prioridades
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;





#Inserta y carga todos los datos de la Tabla Planeador:

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\SIPRED BUDGET PLANER\\ARCHIVOS CSV\\Planeador.csv' 
REPLACE INTO TABLE Planeador
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;





#Inserta y carga todos los datos de la Tabla Referencias:

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\dismet\\Desktop\\PROYECTO SIPRED\\SIPRED BUDGET PLANER\\ARCHIVOS CSV\\Referencias.csv' 
REPLACE INTO TABLE Referencias
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;