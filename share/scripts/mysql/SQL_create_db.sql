#
# This script create intial Datase for Sipred master table.
# use without argument.
#
# $ mysql -u root -p < create_db.sql
#

# Setup debuger option
SET @l_proc_id := 'Create main Sipred db';
CALL Debug.debug_on(@l_proc_id);

SET @_sipred_exists_ := (SELECT IF(EXISTS (SELECT SCHEMA_NAME FROM
                        INFORMATION_SCHEMA.SCHEMATA
                        WHERE SCHEMA_NAME = 'Sipred'), 'Yes','No'));

CALL Debug.debug_insert(@l_proc_id, CONCAT('Sipred db exists: ',
                                            @_sipred_exists_));

DROP DATABASE IF EXISTS Sipred;

CREATE DATABASE Sipred;

# End debug option
CALL Debug.debug_insert(@l_proc_id, 'Sipred database have been created.');
CALL Debug.debug_off(@l_proc_id);
