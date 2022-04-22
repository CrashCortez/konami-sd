#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
curl -c https://archive.org/download/mb_unified_rompacks_202010/virtualboy_unified_rompack.7z -q --show-progress
peazip -ext2here /run/media/mmcblk0p1/test/virtualboy_unified_rompack.7z
sudo mv virtualboy /run/media/mmcblk0p1/Emulation/roms
sudo rm "virtualboy_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



