#!/bin/sh
. ./setvars.sh

cd $BASEDIR

if [ x != x$NOTROFBTFT ]; then
    ln -sf $BASEDIR/fbtft $KERNEL_SRC/drivers/video/fbtft
    echo source \"drivers/video/fbtft/Kconfig\" >>$KERNEL_SRC/drivers/video/Kconfig
    echo obj-y += fbtft/ >>$KERNEL_SRC/drivers/video/Makefile
fi

cd $KERNEL_SRC
if [ x != x$HASH ]; then
    cd $KERNEL_SRC
    git checkout $HASH
fi

cp $BASEDIR/../config .config

if [ x != x$FIXSTMPETS ]; then
    patch -p1 <../../050-stmpe-ts-Various-fixes.patch
fi

if [ x != x$MOREGPIO ]; then
    patch -p1 <../../moregpioirq.patch
fi

if [ x != x$VERNAME ]; then
    sed -e "s/EXTRAVERSION =/& $VERNAME/" <Makefile >Makefile.fix
    mv Makefile Makefile.orig
    mv Makefile.fix Makefile
fi
