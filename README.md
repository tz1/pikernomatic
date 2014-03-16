pikernomatic
============

Series of scripts (and maybe makefiles, etc) to make it easy to build kernels for the raspi

setupget.sh creates the build directory and fetches the archives, and does a bit of setup.  
Meant to be executed only once.

update.sh will fetch any updates to the archives.

buildall.sh will compile the kernel, modules, and extra modules (spi-dma, CAN, etc.).

setvars.sh is called to set the paths, compilers, etc. and is called from other scripts
IT MUST BE EDITED IF YOU WISH TO SELECT A DIFFERENT KERNEL.
If HASH is omitted, setupget will fetch the latest kernel.
Instructions for finding the correct hash are commented out at the top of this file.

config is set for turning everything on or off.

Currently builds a set with small font console display (vga8x8), Adafruit PiTFT, and CAN support.

NOTE: it might not work with all combinations, especially earlier (pre 2014) kernels.

TODO: deb packaging
