#!/bin/sh
source ./setvars.sh
cd $BUILDOUT
cp -a ../../control .
echo 2.0 >debian-binary
tar cvzf data.tar.gz boot lib
md5sum `find boot lib -type f` >control/md5sums
tar cvzf control.tar.gz control
ar rv ../../newkernl.deb debian-binary control.tar.gz data.tar.gz
