#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
curl -C -# https://archive.org/download/mb_unified_rompacks_202010/plus4_unified_rompack.7z 
peazip -ext2here /run/media/mmcblk0p1/test/plus4_unified_rompack.7z
sudo mv plus4 /run/media/mmcblk0p1/Emulation/roms
sudo rm "plus4_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test


