#Create View V4 as
SELECT 
concat_ws('-',`Laminas`.`grupo`, `Laminas`.`caracteristicas`, 
cast(`Laminas`.`consecutivo` as char)) 
as Codigo, 


if(`Laminas`.`id_esp_3` = 'C0001', '', concat_ws(' ',`Esp_3`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Formato



from Laminas

inner join Esp_3 on id_esp_c=id_esp_3
inner join Unidades on id_unidad=id_esp_c


order by `Laminas`.`grupo`, `Laminas`.`caracteristicas`, `Laminas`.`consecutivo`