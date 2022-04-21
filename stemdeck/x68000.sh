#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/x68000_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/x68000_unified_rompack.7z
sudo mv x68000 /run/media/mmcblk0p1/Emulation/roms
sudo rm "x68000_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



