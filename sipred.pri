#############################################################################
##
##  Copyright   : (C) 2012 Dismet S.A.S.
##              : Julian Salamanca Espinosa
##  e-mail      : julian.sse@gmail.com
##
#############################################################################
##
##  Sipred.pri is part of Sipred.
##
##    Sipred is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    Foobar is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
##
#############################################################################

# Verify if Sipred.pri was included before in the same file

!isEmpty(SIPRED_PRI_INCLUDE):error("Sipred.pri ya ha sido incluido")
SIPRED_PRI_INCLUDE = 1

# The funtion cleanPath() replace double backslash "\\" by slash "/"
# mostly used for windows
defineReplace(cleanPath) {
    win32:1 ~= s|\\\\|/|g
    contains(1, ^/.*):pfx = /
    else:pfx =
    segs = $$split(1, /)
    out =
    for(seg, segs) {
        equals(seg, ..):out = $$member(out, 0, -2)
        else:!equals(seg, .):out += $$seg
    }
    return($$join(out, /, $$pfx))
}

# The function minQtVersion() verify the actual version of Qt

defineTest(minQtVersion) {
    maj = $$1
    min = $$2
    patch = $$3

    isEqual(QT_MAJOR_VERSION, $$maj) {
        isEqual(QT_MINOR_VERSION, $$min) {
            isEqual(QT_PATCH_VERSION, $$patch) {
                return(true)
            }

            greaterThan(QT_PATCH_VERSION, $$patch) {
                return(true)
            }
        }

        greaterThan(QT_MINOR_VERSION, $$min) {
            return(true)
        }
    }

    greaterThan(QT_MAJOR_VERSION, $$maj) {
        return(true)
    }

    return(false)
}

# Set global variables for Sipred application

SIPRED_SOURCE_TREE = $$PWD

isEmpty(SIPRED_BUILD_TREE) {
    sub_dir = $$_PRO_FILE_PWD_          # Pro file dir ej. /home/user/Sipred/src/app
    sub_dir ~= s,^$$re_escape($$PWD),,  # ej. /src/app
    SIPRED_BUILD_TREE = $$cleanPath($$OUT_PWD)
    SIPRED_BUILD_TREE ~= s,$$re_escape($$sub_dir)$,,
}

SIPRED_APP_PATH = $$SIPRED_BUILD_TREE/bin
SIPRED_VERSION = 1.0
SIPRED_TARGET = "sipred"
SIPRED_LIBRARY_PATH = $$SIPRED_BUILD_TREE/lib
SIPRED_PLUGIN_PATH = $$SIPRED_LIBRARY_PATH/plugins
SIPRED_MODULE_PATH = $$SIPRED_LIBRARY_PATH/modules
SIPRED_DATA_PATH = $$SIPRED_BUILD_TREE/share
SIPRED_BIN_PATH = $$SIPRED_APP_PATH

UI_DIR = $${SIPRED_BUILD_TREE}/.uic
RCC_DIR = $${SIPRED_BUILD_TREE}/.rcc
MOC_DIR = $${SIPRED_BUILD_TREE}/.moc
CONFIG(debug, debug|release):OBJECTS_DIR = $${SIPRED_BUILD_TREE}/.obj/debug
CONFIG(release, debug|release):OBJECTS_DIR = $${SIPRED_BUILD_TREE}/.obj/release
