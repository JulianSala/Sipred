
include(../../../sipred.pri)
include(../../../dependences.pri)

QT += sql gui

TEMPLATE = lib
CONFIG += plugin uitools

TARGET = $$qtLibraryTarget(sqlmodule)
DESTDIR = $$SIPRED_MODULE_PATH/SqlModule

SOURCES += \
    src/sqlmodule.cpp

HEADERS += \
    include/sqlmodule.h

OTHER_FILES
