#!/bin/sh
source ./setvars.sh
cd $BASEDIR
for i in linux spi-config mcp2515async spi-bcm2708 tools adafruit-rpi-fbtft; do
    cd $i
#    git clean -X
#restore files (undo mods to prevent pull complaints)
    git checkout *
    git pull
    cd $BASEDIR
done

#adafruit-fpi-fbtft
ln -sf $BASEDIR/adafruit-rpi-fbtft $KERNEL_SRC/drivers/video/fbtft
echo source \"drivers/video/fbtft/Kconfig\" >>$KERNEL_SRC/drivers/video/Kconfig
echo obj-y += fbtft/ >>$KERNEL_SRC/drivers/video/Makefile
patch -p1 <../../moregpioirq.patch
