#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/amigacd /run/media/mmcblk0p132_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/amigacd /run/media/mmcblk0p132_unified_rompack.7z
mv amigacd /run/media/mmcblk0p132 /run/media/mmcblk0p1/Emulation/roms
rm "amigacd /run/media/mmcblk0p132_unified_rompack.7z"
cd ..
rm -R test



