#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/ti99_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/ti99_unified_rompack.7z
mv ti99 /run/media/mmcblk0p1/Emulation/roms
rm "ti99_unified_rompack.7z"
cd ..
rm -R test



