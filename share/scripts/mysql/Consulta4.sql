select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) 
as Codigo, 

if(`Materiales`.`id_esp_3` = 'C0001', '', concat_ws(' ',`Esp_3`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Formato

from Materiales
inner join Esp_3 on id_esp_c=id_esp_3
inner join Unidades on id_unidad_c = id_unidad


order by grupo,caracteristicas, consecutivo