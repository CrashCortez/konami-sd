#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/atari800_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/atari800_unified_rompack.7z
mv atari800 /run/media/mmcblk0p1/Emulation/roms
rm "atari800_unified_rompack.7z"
cd ..
rm -R test



