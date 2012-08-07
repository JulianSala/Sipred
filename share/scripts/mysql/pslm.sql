select concat_ws('-',`Materiales`.`grupo`, `Materiales`.`caracteristicas`, cast(`Materiales`.`consecutivo` as char)) as Codigo, 

`Materiales`.`descripcion` as Descripcion,

if(`Materiales`.`unidad_compra` = 1, '', `unidades`.`simbolo`) as Unidad_Compra,
if(`Materiales`.`id_esp_1` = 'A0001', '', `Esp_1`.`especificacion`) as Material,
if(`Materiales`.`id_esp_3` = 'C0001', '', concat_ws(' ',`Esp_3`.`especificacion`, if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Formato,
if(`Materiales`.`id_esp_5` = 'E0001', '', concat_ws(' ',`Esp_5`.`especificacion`, if(`Unidades`.`id_unidad`=1,'',`Unidades`.`simbolo`))) as Espesor


from Materiales, Esp_1, Esp_3, Esp_5, Unidades 
where grupo='ANG' and `Materiales`.`unidad_compra` = `unidades`.`id_unidad` and
`Esp_1`.`id_esp_a` = `Materiales`.`id_esp_1` and
`Esp_3`.`id_esp_c` = `Materiales`.`id_esp_3` and
`Esp_5`.`id_esp_e` = `Materiales`.`id_esp_5` and
`Esp_3`.`id_unidad_c` =`Unidades`.`id_unidad` and
`Esp_5`.`id_unidad_e` =`Unidades`.`id_unidad` 


order by grupo,caracteristicas, consecutivo