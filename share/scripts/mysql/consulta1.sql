select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) 
as Codigo, 
`Materiales`.`descripcion` as Descripcion,
if(`Materiales`.`unidad_compra` = 1, '', `unidades`.`simbolo`) as Unidad_Compra

from Materiales, Unidades where `Materiales`.`unidad_compra` = `unidades`.`id_unidad`

order by grupo,caracteristicas, consecutivo
limit 1, 100
