
TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS += \
    module \
    plugin \
#    interface

plugin.file = plugin/plugin_mngr.pro
module.file = module/module_mngr.pro
#interface.file = interface/interface_mngr.pro
