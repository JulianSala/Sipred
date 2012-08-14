
TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS = \
    plugins \
    modules

OTHER_FILES += \
    default/default.qrc \
    default/ui/*.ui \
    default/icons/*.png \
    scripts/python/*.py
