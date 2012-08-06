
DELIMITER %%

CREATE PROCEDURE Drop_Table(IN _table_name_ VARCHAR)
BEGIN
  DECLARE l_proc_id VARCHAR(50);
  SET @l_proc_id := CONCAT('Drop table ', _table_name_);
  CALL Debug.debug_on(@l_proc_id);

  DECLARE prep_drop TEXT;

  SET @prep_drop := 'DROP DATABASE IF EXISTS'

  CALL Debug.debug_off(@l_proc_id);

END


DELIMITER ;
