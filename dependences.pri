
!isEmpty(DEPENDENCES_PRI_INCLUDE):error("dependences.pri ya ha sido incluido")
DEPENDENCES_PRI_INCLUDE = 1

INCLUDEPATH += \
    $${SIPRED_SOURCE_TREE}/src/include \
    $${SIPRED_SOURCE_TREE}/src/factories \
    $${SIPRED_SOURCE_TREE}/src/managers/module \
    $${SIPRED_SOURCE_TREE}/src/managers/plugin \
    $${SIPRED_SOURCE_TREE}/src/managers/interface
