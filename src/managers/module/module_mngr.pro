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
    sequencer.h

SOURCES += \
    modulemngr.cpp \
    moduleinfo.cpp \
    sequencer.cpp

DEFINES += \
    MODULEMNGRLIB_LIBRARY
