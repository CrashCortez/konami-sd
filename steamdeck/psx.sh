#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/psx_unified_rompack_media_only.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/psx_unified_rompack_media_only.7z
mv psx /run/media/mmcblk0p1/Emulation/roms
rm "psx_unified_rompack_media_only.7z"
cd ..
rm -R test



