#!/bin/sh


cd  $BINARIES_DIR
echo "-----------------dragon image sunxi_gpt header pack--------------------------"
$BINARIES_DIR/programmer_img sys_partition.bin sunxi_mbr.fex sdcard.img  r818-sdcard_mbr.img  sunxi_gpt.fex

