Create View V1 as
SELECT 
concat_ws('-',`Laminas`.`grupo`, `Laminas`.`caracteristicas`, 
cast(`Laminas`.`consecutivo` as char)) 
as Codigo, 

`Laminas`.`descripcion` AS `Descripcion`,

if(`Laminas`.`Unidad_Compra`=1,'',`Unidades`.`simbolo`) as Unidad_Compra,
if(`Laminas`.`id_esp_1` = 'A0001', '', concat_ws(' ',`Esp_1`.`especificacion`)) as Material,
if(`Laminas`.`id_esp_2` = 'B0001', '', concat_ws(' ',`Esp_2`.`especificacion`)) as Tipo



from Laminas
inner join Esp_1 on id_esp_a=id_esp_1 
inner join Esp_2 on id_esp_b=id_esp_2

inner join Unidades on Unidad_Compra=id_Unidad



order by `Laminas`.`grupo`, `Laminas`.`caracteristicas`, `Laminas`.`consecutivo`