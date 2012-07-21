
TEMPLATE = subdirs

!contains(CONFIG, ordered) {
    CONFIG += ordered
}

SUBDIRS  = \
    managers \
    app

OTHER_FILES += \
    include/libraryinfo.h \
    include/plugin.h \
    include/module.h \
    factories/pluginfactory.h \
    factories/modulefactory.h
