#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/gbh_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/gbh_unified_rompack.7z
sudo mv gbh /run/media/mmcblk0p1/Emulation/roms
sudo rm "gbh_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



