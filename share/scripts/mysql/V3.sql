#Create View V3 as
SELECT 
concat_ws('-',`Laminas`.`grupo`, `Laminas`.`caracteristicas`, 
cast(`Laminas`.`consecutivo` as char)) 
as Codigo, 


if(`Laminas`.`id_esp_6` = 'F0001', '', concat_ws(' ',`Esp_6`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Peso,
if(`Laminas`.`id_esp_12` = 'L0001', concat_ws(' ',`Esp_12`.`especificacion`),'') as Fabricacion

from Laminas

inner join Esp_6 on id_esp_f=id_esp_6
inner join Esp_12 on id_esp_l=id_esp_12
inner join Unidades on id_unidad=id_unidad_f




order by `Laminas`.`grupo`, `Laminas`.`caracteristicas`, `Laminas`.`consecutivo`