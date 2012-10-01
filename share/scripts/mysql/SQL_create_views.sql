


USE Sipred;

################################################################################

DROP VIEW IF EXISTS view_material;

CREATE VIEW view_material AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_1.esp AS Material
#,  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_1 ON Esp_1.id_esp_1 = col_esp_1
#  INNER JOIN Unidades ON Unidades.id_und = Esp_1.id_und_1

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_type;

CREATE VIEW view_type AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_2.esp AS Tipo
#,  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_2 ON Esp_2.id_esp_2 = col_esp_2
#  INNER JOIN Unidades ON Unidades.id_und = Esp_2.id_und_2

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_format;

CREATE VIEW view_format AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_3.esp AS Formato,
  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_3 ON Esp_3.id_esp_3 = col_esp_3
  INNER JOIN Unidades ON Unidades.id_und = Esp_3.id_und_3

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_diameter;

CREATE VIEW view_diameter AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_4.esp AS Diametro,
  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_4 ON Esp_4.id_esp_4 = col_esp_4
  INNER JOIN Unidades ON Unidades.id_und = Esp_4.id_und_4

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_thickness;

CREATE VIEW view_thickness AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_5.esp AS Espesor,
  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_5 ON Esp_5.id_esp_5 = col_esp_5
  INNER JOIN Unidades ON Unidades.id_und = Esp_5.id_und_5

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_weight;

CREATE VIEW view_weight AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_6.esp AS Peso,
  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_6 ON Esp_6.id_esp_6 = col_esp_6
  INNER JOIN Unidades ON Unidades.id_und = Esp_6.id_und_6

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_rpm;

CREATE VIEW view_rpm AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_7.esp AS RPM
#,  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_7 ON Esp_7.id_esp_7 = col_esp_7
#  INNER JOIN Unidades ON Unidades.id_und = Esp_7.id_und_7

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_power;

CREATE VIEW view_power AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_8.esp AS Potencia,
  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_8 ON Esp_8.id_esp_8 = col_esp_8
  INNER JOIN Unidades ON Unidades.id_und = Esp_8.id_und_8

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_manufacturer;

CREATE VIEW view_manufacturer AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_9.esp AS Fabricante
#,  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_9 ON Esp_9.id_esp_9 = col_esp_9
#  INNER JOIN Unidades ON Unidades.id_und = Esp_9.id_und_9

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_reference;

CREATE VIEW view_reference AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_10.esp AS Referencia
#,  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_10 ON Esp_10.id_esp_10 = col_esp_10
#  INNER JOIN Unidades ON Unidades.id_und = Esp_10.id_und_10

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_color;

CREATE VIEW view_color AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_11.esp AS Color
#,  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_11 ON Esp_11.id_esp_11 = col_esp_11
#  INNER JOIN Unidades ON Unidades.id_und = Esp_11.id_und_11

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################

DROP VIEW IF EXISTS view_origin;

CREATE VIEW view_origin AS
  SELECT CONCAT_WS('-', grupo, caracteristicas, CAST(consecutivo AS CHAR)) AS Codigo,
  Esp_12.esp AS Origen
#,  IF(Unidades.id_und = 1, 'N/A', Unidades.simbolo) AS Unidad

  FROM Materiales
  INNER JOIN Esp_12 ON Esp_12.id_esp_12 = col_esp_12
#  INNER JOIN Unidades ON Unidades.id_und = Esp_12.id_und_12

  ORDER BY grupo,caracteristicas, consecutivo;

################################################################################
