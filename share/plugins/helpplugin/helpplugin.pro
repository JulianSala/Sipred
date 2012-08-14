
include(../../../sipred.pri)
include(../../../dependences.pri)

QT += core gui

TEMPLATE = lib
CONFIG += plugin uitools

TARGET = $$qtLibraryTarget(helpplugin)
DESTDIR = $$SIPRED_PLUGIN_PATH/Help


SOURCES += \
    help.cpp \
    helppluginfactory.cpp

HEADERS += \
    help.h \
    helppluginfactory.h

OTHER_FILES += \
    helpplugin.qrc
