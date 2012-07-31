
!isEmpty(RESOURCES_PRI_INCLUDE):error("Resources resources.pri already include.")
RESOURCES_PRI_INCLUDE = 1

DEFINES += \
    RESOURCES_PATH=\\\"$${SIPRED_DATA_PATH}\\\"
