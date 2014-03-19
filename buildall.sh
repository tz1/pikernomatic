#!/bin/sh
source ./setvars.sh

export ARCH=arm
export CROSS_COMPILE=$CCPREFIX
export INSTALL_MOD_PATH=$BUILDOUT

cd $KERNEL_SRC

make oldconfig
make -j 5
make modules_install
cp arch/arm/boot/zImage $BUILDOUT/boot/newkernl$VERNAME.img
gzip -9f <System.map >$BUILDOUT/boot/newkernl$VERNAME.System.map.gz

# Build the auxillary modules
if [ x != x$CAN ] ; then
    make KDIR=$KERNEL_SRC -C $BASEDIR/mcp2515async all install
fi

make KDIR=$KERNEL_SRC -C $BASEDIR/spi-config all install

if [ x != x$DMASPI ] ; then
#replace
    find $BUILDOUT/lib/modules -name spi-bcm2708.ko -exec rm {} \;
    make KDIR=$KERNEL_SRC -C $BASEDIR/spi-bcm2708 all install
fi
