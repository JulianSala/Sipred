#!/usr/bin/python2.7
#
# Compile all resources from sourcetree using Sipred configuration
# $ rcc -binary -no-compress <resourcefile.qrc> -o <resourcefile.rcc>
#

import inspect
from subprocess import call
from locate import *

for qrc in locate('*.qrc'):
  print 'Compiling resource file at:'
  print qrc
  rcc = qrc.replace('.qrc', '.rcc')
  call(['rcc', '-binary', '-no-compress', qrc , '-o', rcc])
