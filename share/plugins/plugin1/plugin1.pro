include(../../../sipred.pri)
include(../../../dependences.pri)

QT += core gui

TEMPLATE = lib
CONFIG += plugin

TARGET = $$qtLibraryTarget(plugin)
DESTDIR = $$SIPRED_PLUGIN_PATH/Print

SOURCES += \
    print.cpp

HEADERS += \
    print.h \
