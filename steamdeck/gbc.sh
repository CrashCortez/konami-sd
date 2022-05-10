#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/gbc_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/gbc_unified_rompack.7z
mv gbc /run/media/mmcblk0p1/Emulation/roms
rm "gbc_unified_rompack.7z"
cd ..
rm -R test



