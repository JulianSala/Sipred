#############################################################################
##
##  Copyright   : (C) 2012 Dismet S.A.S.
##              : Julian Salamanca Espinosa
##  e-mail      : julian.sse@gmail.com
##
#############################################################################
##
##  Sipred.pro is part of Sipred.
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

include(sipred.pri)

# Revisar la versión minima para compilar el programa
!minQtVersion(4, 8, 0) {
    message("No se puede compilar el proyecto con la versión de Qt $${QT_VERSION}.")
    error("Use minimamente la versión 4.8.0.")
}

TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS = \
    share \
    src

OTHER_FILES += \
    dist/copyright_template.txt \
    LICENCE.LGPL \
    sipred.sh
