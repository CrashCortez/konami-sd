#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/sega32x_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/sega32x_unified_rompack.7z
mv sega32x /run/media/mmcblk0p1/Emulation/roms
rm "sega32x_unified_rompack.7z"
cd ..
rm -R test



