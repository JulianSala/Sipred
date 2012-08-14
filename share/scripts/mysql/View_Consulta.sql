
SELECT 
concat_ws('-',`materiales`.`grupo`,`materiales`.`caracteristicas`,
cast(`materiales`.`consecutivo` AS CHAR)) AS `Codigo`,

`materiales`.`descripcion` AS `Descripcion`,

if(`Materiales`.`id_esp_1` = 'A0001', '', concat_ws(' ',`Esp_1`.`especificacion`)) as Material,
if(`Materiales`.`id_esp_2` = 'B0001', '', concat_ws(' ',`Esp_2`.`especificacion`)) as Tipo,
if(`Materiales`.`id_esp_3` = 'C0001', '', concat_ws(' ',`Esp_3`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Formato,
if(`Materiales`.`id_esp_4` = 'D0001', '', concat_ws(' ',`Esp_4`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Diametro

from materiales
inner join Esp_1 on id_esp_a=id_esp_1
inner join Esp_2 on id_esp_b=id_esp_2
inner join Esp_3 on id_esp_c=id_esp_3
inner join Esp_4 on id_esp_d=id_esp_4
inner join Unidades on id_unidad=id_unidad_c


where  `Esp_4`.`id_unidad_d` = `Unidades`.`id_unidad`



order by `materiales`.`grupo`, `materiales`.`caracteristicas`, `materiales`.`consecutivo`
