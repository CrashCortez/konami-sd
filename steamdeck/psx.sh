#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/psx_unified_rompack_media_only.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/psx_unified_rompack_media_only.7z
sudo mv psx /run/media/mmcblk0p1/Emulation/roms
sudo rm "psx_unified_rompack_media_only.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



