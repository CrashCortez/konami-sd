#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/sg-1000_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/sg-1000_unified_rompack.7z
mv sg-1000 /run/media/mmcblk0p1/Emulation/roms
rm "sg-1000_unified_rompack.7z"
cd ..
rm -R test



