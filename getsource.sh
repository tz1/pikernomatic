#!/bin/sh
. ./setvars.sh

mkdir $BASEDIR
mkdir $BUILDOUT
mkdir $BUILDOUT/boot

wget https://raw.githubusercontent.com/notro/rpi-build/master/patches/builtin/050-stmpe-ts-Various-fixes.patch
cd $BASEDIR

git clone --depth 1 https://github.com/raspberrypi/tools.git              &
git clone https://github.com/msperl/spi-config                  &
git clone https://github.com/tz1/gpio-pps                       &
if [ x != x$CAN ]; then
    git clone https://github.com/tz1/mcp2515async               &
fi
if [ x != x$DMASPI ]; then
    git clone https://github.com/notro/spi-bcm2708.git          &
fi
if [ x != x$NOTROFBTFT ]; then
    git clone https://github.com/notro/fbtft.git
fi
if [ x != x$NOTROFBTFTTOOLS ]; then
    git clone https://github.com/notro/fbtft_tools.git
fi

git clone --depth 100 https://github.com/raspberrypi/linux.git
#wait until all the above are completed
wait
