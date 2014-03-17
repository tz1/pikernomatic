#!/bin/sh
source ./setvars.sh

export ARCH=arm
export CROSS_COMPILE=$CCPREFIX
export INSTALL_MOD_PATH=$BUILDOUT

cd $KERNEL_SRC
make oldconfig
make -j 5
make modules_install
cp arch/arm/boot/Image $BUILDOUT/boot/newkernl.img
cp System.map $BUILDOUT/boot/newkernl.System.map

# Build the auxillary modules
if [ x != x$CAN ] ; then
    make KDIR=$KERNEL_SRC -C $BASEDIR/mcp2515async install
fi
make KDIR=$KERNEL_SRC -C $BASEDIR/spi-config install
if [ x != x$DMASPI ] ; then
#replace
    find $BUILDOUT/lib/modules -name spi-bcm2708.ko -exec rm {} \;
    make KDIR=$KERNEL_SRC -C $BASEDIR/spi-bcm2708 install
fi
