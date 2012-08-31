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
##  BP_load_data.sql is part of Sipred.
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

USE Sipred;

LOAD DATA LOCAL INFILE '%1' REPLACE INTO TABLE %2 
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
