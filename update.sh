#!/bin/sh
source ./setvars.sh
cd $BASEDIR
for i in linux spi-config mcp2515async spi-bcm2708 tools adafruit-rpi-fbtft; do
    git clean
    git checkout *
    git pull
done
