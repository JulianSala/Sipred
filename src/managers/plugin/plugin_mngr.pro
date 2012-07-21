include(../../../sipred.pri)
include(../../../dependences.pri)

TEMPLATE = lib

contains(CONFIG, plugin) {
    CONFIG -= plugin
}

DESTDIR = $$SIPRED_LIBRARY_PATH
TARGET = $$qtLibraryTarget(pluginmanager)

HEADERS += \
    pluginmngr_global.h \
    pluginmngr_p.h \
    plugininfo.h \
    pluginmngr.h

SOURCES += \
    plugininfo.cpp \
    pluginmngr.cpp

DEFINES += \
    PLUGINMNGRLIB_LIBRARY \
