include(../../../sipred.pri)
include(../../../dependences.pri)

QT += core gui

TEMPLATE = lib
CONFIG += plugin uitools

TARGET = $$qtLibraryTarget(pluginviewer)
DESTDIR = $$SIPRED_PLUGIN_PATH/PluginViewer

SOURCES += \
    pluginviewer.cpp \
    pluginviewerfactory.cpp

HEADERS += \
    pluginviewer.h \
    pluginviewerfactory.h

#RESOURCES += \
#    pluginviewer.qrc

OTHER_FILES += \
    pluginviewer.qrc
