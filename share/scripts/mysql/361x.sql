#call test();
#select column_name from columns where table_schema='Sipred' and table_name='Materiales';

DROP TABLE IF EXISTS D3;  
CREATE TABLE D3 SELECT COLUMN_NAME
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA  LIKE 'Sipred'
    AND TABLE_NAME = 'Materiales';
    #limit 5,1;
    
    
    
SET @B:=(SELECT * from d3 limit 5,1) ;

DROP TABLE IF EXISTS d2;   
CREATE TABLE d2 select @B
from Materiales where grupo='LAM';

Select MAX(CAST(@B AS Unsigned))AS MAXIMO from d3;




    
    