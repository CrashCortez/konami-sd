#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/tg16_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/tg16_unified_rompack.7z
mv tg16 /run/media/mmcblk0p1/Emulation/roms
rm "tg16_unified_rompack.7z"
cd ..
rm -R test



