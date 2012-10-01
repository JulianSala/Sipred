################################################################################
##
##  Copyright   : (C) 2012 Dismet S.A.S.
##              : Edwin Libardo Vasquez
##  Supervised  : Julian Salamanca Espinosa
##  e-mail      : julian.sse@gmail.com
##              : edwincart@hotmail.com
##
################################################################################
##
##  SQL_price_table.sql is part of Sipred.
##
##    Sipred is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    Sipred is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with Sipred. If not, see <http://www.gnu.org/licenses/>.
##
################################################################################
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
