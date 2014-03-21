#!/bin/sh
source ./setvars.sh

mkdir $BASEDIR
mkdir $BUILDOUT
mkdir $BUILDOUT/boot

cd $BASEDIR

git clone https://github.com/raspberrypi/tools.git              &
git clone https://github.com/msperl/spi-config                  &
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

git clone --depth 250 https://github.com/raspberrypi/linux.git

