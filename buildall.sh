#!/bin/sh
source setvars.sh

export ARCH=arm
export CROSS_COMPILE=$CCPREFIX
export INSTALL_MOD_PATH=$BUILDOUT

cd $KERNEL_SRC
make oldconfig
make -j 5
make modules_install
cp arch/arm/boot/Image $BUILDOUT/boot/newkernl.img

# Build the auxillary modules
make KDIR=$KERNEL_SRC -C $BASEDIR/mcp2515async install
make KDIR=$KERNEL_SRC -C $BASEDIR/spi-config install

make KDIR=$KERNEL_SRC -C $BASEDIR/spi-bcm2708 install
#replaces
rm $BUILDOUT/lib/modules/3.10.25+/kernel/drivers/spi/spi-bcm2708.ko
