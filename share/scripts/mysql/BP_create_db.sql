#############################################################################
##
##  Copyright   : (C) 2012 Dismet S.A.S.
##              : Edwin Libardo Vasquez
##  Supervised  : Julian Salamanca Espinosa
##  e-mail      : julian.sse@gmail.com
##              : edwincart@hotmail.com
##
#############################################################################
##
##  BP_create_db.sql is part of Sipred.
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
#############################################################################

#
# This script create intial Datase for Sipred Budget Planner.
# use without argument.
#
# $ mysql -u root -p < create_db.sql
#

SET @l_proc_id := 'Create main Budget Planner db';
CALL Debug.debug_on(@l_proc_id);

SET @_sipred_exists_ := (SELECT IF(EXISTS (SELECT SCHEMA_NAME FROM
                        INFORMATION_SCHEMA.SCHEMATA
                        WHERE SCHEMA_NAME = 'SipredBP'), 'Yes','No'));

CALL Debug.debug_insert(@l_proc_id, CONCAT('SipredBP db exists: ',
                                            @_sipred_exists_));

DROP DATABASE IF EXISTS SipredBP;

CREATE DATABASE SipredBP;

# End debug option
CALL Debug.debug_insert(@l_proc_id, 'SipredBP database have been created.');
CALL Debug.debug_off(@l_proc_id);
