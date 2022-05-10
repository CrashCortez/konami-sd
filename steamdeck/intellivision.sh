#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/intellivision_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/intellivision_unified_rompack.7z
mv intellivision /run/media/mmcblk0p1/Emulation/roms
rm "intellivision_unified_rompack.7z"
cd ..
rm -R test



