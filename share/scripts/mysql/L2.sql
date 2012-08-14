CREATE view L2 as
SELECT 
concat_ws('-',`Laminas`.`grupo`,`Laminas`.`caracteristicas`,
cast(`Laminas`.`consecutivo` AS CHAR)) AS `Codigo`,

if(`Laminas`.`id_esp_5` = 'C0001', '', concat_ws(' ',`Esp_5`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Espesor


from Laminas
inner join Esp_5 on id_esp_e=id_esp_5
inner join Unidades on id_unidad=id_unidad_e


order by `Laminas`.`grupo`, `Laminas`.`caracteristicas`, `Laminas`.`consecutivo`