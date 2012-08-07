
include(../../../sipred.pri)
include(../../../dependences.pri)

QT += core gui

TEMPLATE = lib
CONFIG += plugin uitools

TARGET = $$qtLibraryTarget(configmodule)
DESTDIR = $$SIPRED_MODULE_PATH/ConfigModule

SOURCES += \
    src/configmodule.cpp \
    src/configmodulefactory.cpp

HEADERS += \
    include/configmodule.h \
    include/configmodulefactory.h

OTHER_FILES += \
    configmodule.qrc
