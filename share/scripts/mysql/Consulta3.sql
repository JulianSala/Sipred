select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) 
as Codigo, 

if(`Materiales`.`id_esp_2` = 'B0001', '', concat_ws(' ',`Esp_2`.`especificacion`)) as Tipo

from Materiales, Esp_2 
where `Materiales`.`id_esp_2` = `Esp_2`.`id_esp_b`

order by grupo,caracteristicas, consecutivo