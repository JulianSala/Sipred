CREATE view L1 as
SELECT 
concat_ws('-',`Laminas`.`grupo`,`Laminas`.`caracteristicas`,
cast(`Laminas`.`consecutivo` AS CHAR)) AS `Codigo`,

`Laminas`.`descripcion` AS `Descripcion`,

if(`Laminas`.`id_esp_1` = 'A0001', '', concat_ws(' ',`Esp_1`.`especificacion`)) as Material,
if(`Laminas`.`id_esp_2` = 'B0001', '', concat_ws(' ',`Esp_2`.`especificacion`)) as Tipo,
if(`Laminas`.`id_esp_3` = 'C0001', '', concat_ws(' ',`Esp_3`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Formato


from Laminas
inner join Esp_1 on id_esp_a=id_esp_1
inner join Esp_2 on id_esp_b=id_esp_2
inner join Esp_3 on id_esp_c=id_esp_3
inner join Unidades on id_unidad=id_unidad_c


order by `Laminas`.`grupo`, `Laminas`.`caracteristicas`, `Laminas`.`consecutivo`



