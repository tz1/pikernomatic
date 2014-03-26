#!/bin/sh
#set the name of the build directory and where you want the output files to go
export BASEDIR=`pwd`/raspibuild
export BUILDOUT=$BASEDIR/buildoutput

# For a specific kernel instead of the latest build 

#if you have an accurate changelog.Debian.gz, you can use the two following lines (editing the paths as needed)
#FHASH=$(zgrep "* firmware as of" usr/share/doc/raspberrypi-bootloader/changelog.Debian.gz | head -1 | awk '{ print $5 }')
#HASH=$(wget https://raw.github.com/raspberrypi/firmware/$FHASH/extra/git_hash -O -)

#hash from the 3.10.25+ stock raspian kernel update of mid January 2014
#export HASH=16eb921a96db3dc3555a65b53b99c15753e6b770
#hash from the 3.10.33+ rpi-update for camera as of March 18, 2014
export HASH=3bff11d4d4b8dc28cb9ce81449c989466ba27198

# spi LCD support, and extras for PiTFT, maybe others (touchscreen, keys, backlight)
# Note internally only the module for the PiTFT is created, but the config can be edited to add more
export NOTROFBTFT=y
export NOTROFBTFTTOOLS=y

# can protocol support
export CAN=y

# use experimental DMA spi driver
export DMASPI=y

# increase the number of gpios and irqs allocated (for PiTFT touchscreen)
export MOREGPIO=y

# fix stmpe touchscreen lockups (PiTFT)
export FIXSTMPETS=y

# optional tag (to leave the original/stock modules directory alone)
#export VERNAME=-tz1

#don't change these - they point to the cross tools and kernel location
export CCDIR=$BASEDIR/tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin
export CCPREFIX=$CCDIR/arm-bcm2708-linux-gnueabi-
export KERNEL_SRC=$BASEDIR/linux
