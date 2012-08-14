DELIMITER %%

DROP PROCEDURE IF EXISTS Prueba%%

CREATE PROCEDURE Prueba ()

BEGIN


DROP TABLE IF EXISTS Grupos;
CREATE TABLE Grupos SELECT DISTINCT(grupo) FROM Materiales;


END%%


Delimiter %%

Select * from grupos





DELIMITER $$
 
 DROP PROCEDURE IF EXISTS Prueba2$$
 
CREATE PROCEDURE Prueba2(i INT, f INT)
 
 BEGIN

 DECLARE a, b double DEFAULT 0.0;
 DECLARE c DOUBLE;
 SET c = i;
 
 DROP TABLE IF EXISTS Tab;
 CREATE TABLE Tab(x int, y double);
 
 WHILE c <= f DO
  SET a = (c*c) - 1;
  SET b = (c*c*c) - c;
  INSERT INTO Tab (x,y) VALUES (c, a/b);
  SET c = c + 1;
 END WHILE;
 
 SELECT * FROM Tab WHERE y>0.2;
 
 #DECLARE  id_esp_3 VARCHAR(5)
 #DECLARE  grupo CURSOR FOR

 #SELECT  grupo FROM Materiales;

 #DECLARE  CONTINUE HANDLER FOR NOT FOUND

  

 END$$

 DELIMITER ;

 