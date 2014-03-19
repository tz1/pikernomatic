#!/bin/sh
#this gets the git checkout hash for the current firmware - which might or might not
#be something officially released
wget https://github.com/raspberrypi/firmware/raw/master/extra/git_hash

#Go to https://github.com/raspberrypi/firmware/commits/master/extra/git_hash and browse.
#if you use the raw button, you will get a full link to the file itself, or can just
#cut and paste the hash value itself.

#Note that the Jan 03 2014 checkin is the apt-get raspberrypi-firmware release for 3.10.25+
#which was released a few days later (and there is a Jan 7 checkin).
