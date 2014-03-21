pikernomatic
============

Series of scripts (and maybe makefiles, etc) to make it easy to build kernels for the raspi

QUICKSTART:  Builds for current raspian distribution kernel (some kernel symbols may change).
Adds spi-dma, CAN for mcp2515, and Adafruilt PiTFT (stmpe-ts built but doesn't work, nor the reset)
Just do ./setupget.sh and wait for the downloads to complete (several in parallel).
Then do ./buildall.sh and check the raspibuild/buildout directory for the replacements.

getsource.sh creates the build directory and fetches the archives
Meant to be executed only once.  Note the --depth has been reduced to 50 since the raspicam is recent.
To build for much older binaries, this might need to be increased.

setupget.sh patches the fetched source (also needed after an update)

update.sh will clean and reset the build trees then fetch any updates to the archives.
(Note, this fails with fbtft, you need to "rm *.o" or manually reverse the symlink so it
is at the root of the build pointing into linux/drivers/video/fbtft).

buildall.sh will compile the kernel, modules, and extra modules (spi-dma, CAN, etc.).

setvars.sh is called to set the paths, compilers, etc. and is called from other scripts
IT MUST BE EDITED IF YOU WISH TO SELECT A DIFFERENT KERNEL.
If HASH is omitted, setupget will fetch the latest kernel.
Instructions for finding the correct hash are in comments at the top of this file.

gethash.sh has instructions to help find the release and will get the current binary firmware
which might NOT be an official release or update.

config is set for turning everything on or off.

a patch file is included which expands the number of interrupts.

Currently builds a set with small font console display (vga8x8), Adafruit PiTFT, and CAN support.

NOTE: it might not work with all combinations, especially earlier (pre 2014) kernels.

For notro's fbtft for Adafruit's PiTFT, replace frequency with speed, i.e. in /etc/options/fbtft.conf add:
options fbtft_device name=pitft rotate=90 speed=32000000 fps=24


TODO: 
deb packaging or other to make install easier
add new kernel as default to /boot/config.txt
add in /etc/modprobe.d or other config to go with teh modules
