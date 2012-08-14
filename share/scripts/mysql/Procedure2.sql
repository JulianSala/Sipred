delimiter %%

DROP PROCEDURE IF EXISTS test%%

create procedure test()
begin

 declare a varchar(20);
 declare b varchar(20);
 set a = concat('id_esp', '_1');

 select a from Materiales where grupo = "LAM";
 #select max(esp) from t; 
 #drop table t;

end%%

delimiter ;