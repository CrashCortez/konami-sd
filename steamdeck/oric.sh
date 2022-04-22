#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
curl -c https://archive.org/download/mb_unified_rompacks_202010/oric_unified_rompack.7z -q --show-progress
peazip -ext2here /run/media/mmcblk0p1/test/oric_unified_rompack.7z
sudo mv oric /run/media/mmcblk0p1/Emulation/roms
sudo rm "oric_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



