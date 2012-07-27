
!isEmpty(RESOURCES_PRI_INCLUDE):error("Resources resources.pri already include.")
RESOURCES_PRI_INCLUDE = 1

CONFIG += resources

QMAKE_RESOURCE_FLAGS += -no-compress -binary
