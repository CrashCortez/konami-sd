#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
curl -C -# https://archive.org/download/mb_unified_rompacks_202010/gamegear_unified_rompack.7z 
peazip -ext2here /run/media/mmcblk0p1/test/gamegear_unified_rompack.7z
sudo mv gamegear /run/media/mmcblk0p1/Emulation/roms
sudo rm "gamegear_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



