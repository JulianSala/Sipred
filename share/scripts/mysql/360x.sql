DELIMITER %%

DROP PROCEDURE IF EXISTS Prueba%%

CREATE PROCEDURE Prueba ()

BEGIN
DECLARE total INT;
DECLARE contador  INT DEFAULT 2;
DECLARE contador1 INT DEFAULT 0;
DECLARE nombre_grupo VARCHAR (3);
DECLARE maximo_valor VARCHAR (25);
DECLARE minimo_valor VARCHAR (25);
DECLARE no_aplic VARCHAR (40);
DECLARE no_aplic1 VARCHAR (40);
DECLARE no_aplic2 VARCHAR (40);


 
 DECLARE cursor1 CURSOR FOR
    SELECT no_aplic 
    FROM D1;
    
DECLARE CONTINUE HANDLER FOR NOT FOUND SET contador1 = 1;







#DROP TABLE IF EXISTS Grupos;
#CREATE TABLE Grupos SELECT DISTINCT(grupo) FROM Materiales;


#Select COUNT(*) from Grupos INTO total;

#WHILE contador <= total DO
 
    
    SELECT * FROM Grupos LIMIT contador,1 INTO nombre_grupo;
    
    
    DROP TABLE IF EXISTS D1;
    CREATE TABLE D1 SELECT * FROM Materiales where grupo=nombre_grupo;
    
        #WHILE contador1 <= 12 DO
        
        SET contador1=(contador1 + 1);
        SET no_aplic=(CONCAT('id_esp_',contador1));
        
        OPEN cursor1;
        
      c1_loop: LOOP
      
      FETCH cursor1 INTO no_aplic2;
      
      IF (contador1=1) THEN
      LEAVE c1_loop;
      
      END IF;
      END LOOP c1_loop;
      END %%
      
      
    Delimiter ;

        #SET no_aplic=(CONCAT('id_esp_',contador1));
            
    
    #SELECT MAX(no_aplic) AS Maximo FROM D1 INTO maximo_valor;
    #SELECT MIN(no_aplic) AS Minimo FROM D1 INTO minimo_valor;
    
    #select minimo_valor, maximo_valor, no_aplic;
    
    
    #IF (minimo_valor = maximo_valor) THEN

    
      # ALTER TABLE D1 DROP COLUMN no_aplic; # En id_esp_1 debe ir un contador para borrar columnas

       # END IF;
    
       # UNTIL contador1 <= 12
        
       # END REPEAT;
    

            #END WHILE;
            
    #DROP TABLE IF EXISTS N1;
    #CREATE TABLE N1 AS
    #SELECT concat_ws('-',`Materiales`.`grupo`,`Materiales`.`caracteristicas`,
    #cast(`Materiales`.`consecutivo` AS CHAR)) AS `Codigo`


    #if(`Materiales`.`id_esp_1` = maximo_valor, '', concat_ws(' ',`Esp_1`.`especificacion`)) as Material
    
    #FROM Materiales
    #inner join Esp_1 on id_esp_mat=id_esp_1 
    #WHERE grupo = nombre_grupo;

    
    
#END WHILE;

#END%%