include(../../../sipred.pri)
include(../../../dependences.pri)

TEMPLATE = lib

contains(CONFIG, plugin) {
    CONFIG -= plugin
}

DESTDIR = $$SIPRED_LIBRARY_PATH
TARGET = $$qtLibraryTarget(modulemanager)

HEADERS += \
    modulemngr_global.h \
    modulemngr_p.h \
    moduleinfo.h \
    modulemngr.h \

SOURCES += \
    modulemngr.cpp \
    moduleinfo.cpp

DEFINES += \
    MODULEMNGRLIB_LIBRARY
