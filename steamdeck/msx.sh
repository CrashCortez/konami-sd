#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
curl -c https://archive.org/download/mb_unified_rompacks_202010/msx_unified_rompack.7z -q --show-progress
peazip -ext2here /run/media/mmcblk0p1/test/msx_unified_rompack.7z
sudo mv msx /run/media/mmcblk0p1/Emulation/roms
sudo rm "msx_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test


