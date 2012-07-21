include(../../sipred.pri)
include(../../dependences.pri)
include(corelibs.pri)

!contains(CONFIG, uitools) {
    message("Cargando modulo uitools")
    CONFIG += uitools
}

TEMPLATE = app
TARGET = $$SIPRED_TARGET
DESTDIR = $$SIPRED_APP_PATH

SOURCES += \
    main.cpp \
    core.cpp

HEADERS += \
    core.h

