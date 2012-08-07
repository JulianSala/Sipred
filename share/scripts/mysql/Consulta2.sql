select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) 
as Codigo, 

if(`Materiales`.`id_esp_1` = 'A0001', '', concat_ws(' ',`Esp_1`.`especificacion`)) as Material

from Materiales, Esp_1 
where `Materiales`.`id_esp_1` = `Esp_1`.`id_esp_a`

order by grupo,caracteristicas, consecutivo