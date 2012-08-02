
include(../../../sipred.pri)
include(../../../dependences.pri)

QT += sql gui

TEMPLATE = lib
CONFIG += plugin uitools

TARGET = $$qtLibraryTarget(sqlmodule)
DESTDIR = $$SIPRED_MODULE_PATH/SqlModule

SOURCES += \
    src/sqlmodule.cpp \
    src/sqlmodulefactory.cpp

HEADERS += \
    include/sqlmodule.h \
    include/sqlmodulefactory.h

OTHER_FILES += \
    sqlmodule.qrc \

