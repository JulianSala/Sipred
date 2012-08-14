select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) 
as Codigo, 

if(`Materiales`.`id_esp_5` = 'E0001', '', concat_ws(' ',`Esp_5`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Espesor

from Materiales, Esp_5, Unidades where `Esp_5`.`id_unidad_e` = `Unidades`.`id_unidad` and
`Esp_5`.`id_esp_e` = `Materiales`.`id_esp_5`

order by grupo,caracteristicas, consecutivo