#!/bin/sh
# chmod +x

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/home/dismet/Dismet/Programming/Sipred/Sipred-Release/lib"
export LD_LIBRARY_PATH
exec "./sipred"
