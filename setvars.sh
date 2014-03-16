#!/bin/sh
export BASEDIR=`pwd`/raspibuild
export CCDIR=$BASEDIR/tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin
export CCPREFIX=$CCDIR/arm-bcm2708-linux-gnueabi-
export KERNEL_SRC=$BASEDIR/linux
export BUILDOUT=$BASEDIR/buildoutput
# for a specific kernel
export HASH=16eb921a96db3dc3555a65b53b99c15753e6b770
