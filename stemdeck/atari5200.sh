#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/atari5200_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/atari5200_unified_rompack.7z
sudo mv atari5200 /run/media/mmcblk0p1/Emulation/roms
sudo rm "atari5200_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



