#!/bin/sh
source ./setvars.sh
cd $BASEDIR
for i in linux spi-config mcp2515async spi-bcm2708 tools adafruit-rpi-fbtft; do
    cd $i
#    git clean -X
    git checkout *
    git pull
    cd $BASEDIR
done
