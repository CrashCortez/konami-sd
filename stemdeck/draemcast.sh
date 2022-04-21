#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/dreamcast_unified_rompack_media_only.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/dreamcast_unified_rompack_media_only.7z
sudo mv dreamcast /run/media/mmcblk0p1/Emulation/roms
sudo rm "dreamcast_unified_rompack_media_only.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



