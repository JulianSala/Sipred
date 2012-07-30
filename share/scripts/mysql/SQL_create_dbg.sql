#
# Debug database and debug table for Sipred debug control.
# Run as:
# $ mysql < create_dbg.sql"
#
# Example test dbg:
# SET @l_proc_id := 'test_debug';
# CALL Debug.debug_on(@l_proc_id);
# CALL Debug.debug_insert(@l_proc_id,'Testing Debug');
# CALL Debug.debug_off(@l_proc_id);
#

DROP DATABASE IF EXISTS Debug;
CREATE DATABASE Debug;

DROP TABLE IF EXISTS Debug.debug;

CREATE TABLE  Debug.debug (
  proc_id VARCHAR(50) default NULL,
  debug_output TEXT,
  line_id INT(11) NOT NULL auto_increment,
  PRIMARY KEY  (line_id)
);

DELIMITER %%

DROP PROCEDURE IF EXISTS Debug.debug_insert %%
DROP PROCEDURE IF EXISTS Debug.debug_on %%
DROP PROCEDURE IF EXISTS Debug.debug_off %%

CREATE PROCEDURE Debug.debug_insert(IN p_procedure_id VARCHAR(50), IN p_debug_info TEXT)
BEGIN
  INSERT INTO Debug.debug(proc_id, debug_output)
  VALUES (p_procedure_id, p_debug_info);
END %%

CREATE PROCEDURE Debug.debug_on(IN p_procedure_id VARCHAR(50))
BEGIN
  CALL Debug.debug_insert(p_procedure_id, CONCAT('Debug started at: ', NOW()));
END %%

CREATE PROCEDURE Debug.debug_off(IN p_procedure_id VARCHAR(50))
BEGIN
  CALL Debug.debug_insert(p_procedure_id, CONCAT('Debug ended at: ', NOW()));
  SELECT debug_output FROM Debug.debug WHERE proc_id = p_procedure_id ORDER BY line_id;
  DELETE FROM Debug.debug WHERE proc_id = p_procedure_id;
END %%

DELIMITER ;
