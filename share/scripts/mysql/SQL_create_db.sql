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
