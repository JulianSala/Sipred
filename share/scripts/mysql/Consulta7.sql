select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) 
as Codigo, 

if(`Materiales`.`id_esp_6` = 'F0001', '', concat_ws(' ',`Esp_6`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Peso

from Materiales, Esp_6, Unidades where `Esp_6`.`id_unidad_f` = `Unidades`.`id_unidad` and
`Esp_6`.`id_esp_f` = `Materiales`.`id_esp_6`

order by grupo,caracteristicas, consecutivo