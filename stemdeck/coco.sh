#!/bin/bash
cd
mkdir /run/media/mmcblk0p1/test
cd /run/media/mmcblk0p1/test
wget -c https://archive.org/download/mb_unified_rompacks_202010/coco_unified_rompack.7z -q --show-progress
7z x -y -aoa /run/media/mmcblk0p1/test/coco_unified_rompack.7z
sudo mv coco /run/media/mmcblk0p1/Emulation/roms
sudo rm "coco_unified_rompack.7z"
cd /run/media/mmcblk0p1/
sudo rm -R test



