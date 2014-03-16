#!/bin/sh

#if you have an accurate changelog.Debian.gz, you can use the two following lines (editing the paths as needed)
#FHASH=$(zgrep "* firmware as of" usr/share/doc/raspberrypi-bootloader/changelog.Debian.gz | head -1 | awk '{ print $5 }')
#HASH=$(wget https://raw.github.com/raspberrypi/firmware/$FHASH/extra/git_hash -O -)
#save and edit it in the next section 
#echo $HASH >HASH.sav

#!/bin/sh
source ./setvars.sh

mkdir $BASEDIR
mkdir $BUILDOUT
mkdir $BUILDOUT/boot

cd $BASEDIR

git clone https://github.com/raspberrypi/tools.git              &
git clone https://github.com/msperl/spi-config                  &
git clone https://github.com/tz1/mcp2515async                   &
git clone https://github.com/notro/spi-bcm2708.git              &

git clone --depth 250 https://github.com/raspberrypi/linux.git
#which tft if any
git clone https://github.com/adafruit/adafruit-rpi-fbtft.git
#git clone https://github.com/notro/fbtft.git

#adafruit-fpi-fbtft
ln -sf $BASEDIR/adafruit-rpi-fbtft $KERNEL_SRC/drivers/video/fbtft
echo source \"drivers/video/fbtft/Kconfig\" >>$KERNEL_SRC/drivers/video/Kconfig
echo obj-y += fbtft/ >>$KERNEL_SRC/drivers/video/Makefile

if [ x != x$HASH ]; then
    cd $KERNEL_SRC
    git checkout $HASH
fi

cp $BASEDIR/../config .config
