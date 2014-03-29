#!/bin/sh
. ./setvars.sh
cd $BUILDOUT
#FATFS doesn'tn kow about perms
chmod 755 boot/*
sudo chown root:root boot lib -R
cp -a ../../control .
echo 2.0 >debian-binary
tar cvzf data.tar.gz boot lib
md5sum `find boot lib -type f` >control/md5sums
cd control
tar cvzf ../control.tar.gz *
cd ..
ar rv ../../newkernl.deb debian-binary control.tar.gz data.tar.gz
