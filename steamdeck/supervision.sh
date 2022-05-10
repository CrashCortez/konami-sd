#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/supervision_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/supervision_unified_rompack.7z
mv supervision /run/media/mmcblk0p1/Emulation/roms
rm "supervision_unified_rompack.7z"
cd ..
rm -R test



