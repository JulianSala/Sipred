
include(../../../sipred.pri)
include(../../../dependences.pri)

QT += core gui sql

TEMPLATE = lib
CONFIG += plugin uitools

TARGET = $$qtLibraryTarget(librarymodule)
DESTDIR = $$SIPRED_MODULE_PATH/LibraryModule

SOURCES += \
    src/librarymodule.cpp \
    src/librarymodulefactory.cpp

HEADERS += \
    include/librarymodule.h \
    include/librarymodulefactory.h

OTHER_FILES += \

