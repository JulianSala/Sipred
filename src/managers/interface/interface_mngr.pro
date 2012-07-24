include(../../../sipred.pri)
include(../../../dependences.pri)

TEMPLATE = lib

contains(CONFIG, plugin) {
    CONFIG -= plugin
}

!contains(CONFIG, uitools) {
    CONFIG += uitools
}

DESTDIR = $$SIPRED_LIBRARY_PATH
TARGET = $$qtLibraryTarget(interfacemanager)

HEADERS += \
    interfacemngr_global.h \
    interfacemngr_p.h \
    interfacemngr.h

SOURCES += \
    interfacemngr.cpp

DEFINES += \
    INTERFACEMNGRLIB_LIBRARY \
