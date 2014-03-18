#!/bin/sh
source ./setvars.sh
cd $BASEDIR
for i in linux spi-config mcp2515async spi-bcm2708 tools adafruit-rpi-fbtft fbtft; do
    if [ -d $i ]; then
        cd $i
#    git clean -X
#restore files (undo mods to prevent pull complaints)
        make clean
        git checkout *
        git pull
        cd $BASEDIR
    fi
done

