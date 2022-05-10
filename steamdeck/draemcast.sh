#!/bin/bash
cd /run/media/mmcblk0p1
mkdir test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/dreamcast_unified_rompack_media_only.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/dreamcast_unified_rompack_media_only.7z
mv dreamcast /run/media/mmcblk0p1/Emulation/roms
rm "dreamcast_unified_rompack_media_only.7z"
cd ..
rm -R test



