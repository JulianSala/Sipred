

USE Sipred;

DELIMITER %%

################################################################################

DROP PROCEDURE IF EXISTS Drop_Table;

CREATE PROCEDURE Drop_Table(IN _table_name_ VARCHAR(50))
BEGIN
  DECLARE SQLDrop_Table TEXT;
  SET @SQLDrop = CONCAT('DROP TABLE IF EXISTS ', _table_name_);
  
  PREPARE stmt FROM @SQLDrop;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
  
  SHOW WARNINGS;
END %%

################################################################################

DROP PROCEDURE IF EXISTS Load_data;

CREATE PROCEDURE Load_data(IN _file_path_ TEXT, IN _table_name_ TEXT)
BEGIN
  DECLARE SQLLoad TEXT;
  SET @SQLLoad = CONCAT('LOAD DATA LOCA INFILE \"', _file_path_, '" REPLACE INTO TABLE ', _table_name_,
                        'FIELDS TERMINATED BY "," LINES TERMINATED BY "\r\n" IGNORE 1 LINES');
  
  PREPARE stmt FROM @SQLLoad;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  SHOW WARNINGS;
END %%

################################################################################

#DROP PROCEDURE IF EXISTS set_price;

################################################################################

DROP PROCEDURE IF EXISTS get_material;

CREATE PROCEDURE get_material(IN _group_ VARCHAR(3), 
	                     IN _caracteristics_ VARCHAR(6), 
	                     IN _count_ INT(3))
BEGIN
  DECLARE SQLQuery TEXT;
  SET @SQLQuery = CONCAT('SELECT col_esp_1 AS Material', 
                         ' FROM Materiales WHERE grupo = \"', _group_,
                         '\" AND caracteristicas = \"', _caracteristics_, 
                         '\" AND consecutivo = ', _count_);

  PREPARE stmt FROM @SQLQuery;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END %%

################################################################################

DROP PROCEDURE IF EXISTS get_type;

CREATE PROCEDURE get_type(IN _group_ VARCHAR(3), 
	                  IN _caracteristics_ VARCHAR(6), 
	                  IN _count_ INT(3))
BEGIN
  DECLARE SQLQuery TEXT;
  SET @SQLQuery = CONCAT('SELECT col_esp_2 AS Tipo FROM Materiales WHERE grupo = \"', _group_,
                         '\" AND caracteristicas = \"', _caracteristics_, 
                         '\" AND consecutivo = ', _count_);

  PREPARE stmt FROM @SQLQuery;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END %%

################################################################################

DROP PROCEDURE IF EXISTS get_format;

CREATE PROCEDURE get_format(IN _group_ VARCHAR(3), 
	                    IN _caracteristics_ VARCHAR(6), 
	                    IN _count_ INT(3))
BEGIN
  DECLARE SQLQuery TEXT;
  SET @SQLQuery = CONCAT('SELECT col_esp_3 AS Formato FROM Materiales', 
                         ' WHERE grupo = \"', _group_,
                         '\" AND caracteristicas = \"', _caracteristics_, 
                         '\" AND consecutivo = ', _count_);

  PREPARE stmt FROM @SQLQuery;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END %%

################################################################################

DROP PROCEDURE IF EXISTS set_price;

CREATE PROCEDURE set_price(IN _group_ VARCHAR(3), 
	                   IN _caracteristics_ VARCHAR(6), 
	                   IN _count_ INT(3),
	                   IN _mat_price_ DOUBLE(15,2))
BEGIN
  DECLARE SQLQuery TEXT;
  SET @SQLQuery = CONCAT('UPDATE Prices SET price = ', _mat_price_,
                         ' WHERE material_group = \"', _group_,
                         '\" AND material_car = \"', _caracteristics_, 
                         '\" AND material_count = ', _count_);

  PREPARE stmt FROM @SQLQuery;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END %%

DELIMITER ;
