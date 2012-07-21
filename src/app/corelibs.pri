
!isEmpty(CORELIBS_PRI_INCLUDE):error("corelibs.pri ya ha sido incluido")
CORELIBS_PRI_INCLUDE = 1

LIBS *= \
    -L$${SIPRED_LIBRARY_PATH} -l$${qtLibraryTarget(pluginmanager)} \
    -L$${SIPRED_LIBRARY_PATH} -l$${qtLibraryTarget(modulemanager)} \
    -L$${SIPRED_LIBRARY_PATH} -l$${qtLibraryTarget(interfacemanager)} \
