#!/usr/bin/python2.7
#
# Locate all files matching supplied filename pattern in and below
# supplied root directory.
#

import os, fnmatch

def locate(pattern, root=os.curdir):
  for path, dirs, files in os.walk(os.path.abspath(root)):
    for filename in fnmatch.filter(files, pattern):
      yield os.path.join(path, filename)
