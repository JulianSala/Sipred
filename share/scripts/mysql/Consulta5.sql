select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) 
as Codigo, 

if(`Materiales`.`id_esp_4` = 'D0001', '', concat_ws(' ',`Esp_4`.`especificacion`,
if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Diametro

from Materiales, Esp_4, Unidades where `Esp_4`.`id_unidad_d` = `Unidades`.`id_unidad` and
`Esp_4`.`id_esp_d` = `Materiales`.`id_esp_4`

order by grupo,caracteristicas, consecutivo