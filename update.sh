#!/bin/sh
source ./setvars.sh

export ARCH=arm
export CROSS_COMPILE=$CCPREFIX
export INSTALL_MOD_PATH=$BUILDOUT

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
rm -rf $BUILDOUT/*
