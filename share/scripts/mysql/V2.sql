Create View V2 as
SELECT 
concat_ws('-',`Laminas`.`grupo`, `Laminas`.`caracteristicas`, 
cast(`Laminas`.`consecutivo` as char)) 
as Codigo, 


if(`Laminas`.`id_esp_5` = 'E0001', '', concat_ws(' ',`Esp_5`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Diametro


from Laminas

inner join Esp_5 on id_esp_e=id_esp_5
inner join Unidades on id_unidad=id_unidad_e




order by `Laminas`.`grupo`, `Laminas`.`caracteristicas`, `Laminas`.`consecutivo`