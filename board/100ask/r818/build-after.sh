#!/bin/sh
BOARD_DIR="$(dirname $0)"

# For debug
echo "Target binary dir $BOARD_DIR"

# Copy Files to BINARY
cp $BOARD_DIR/../dragon/* -rfvd  $BINARIES_DIR

cd  $BINARIES_DIR
rm boot.fex
rm rootfs.fex
wait

ln -s boot.img boot.fex
ln -s rootfs.ext4 rootfs.fex
#ln -s rootfs.squashfs rootfs.fex

echo "-----------------make sys_partition.fex--------------"
busybox unix2dos sys_partition.fex

$BINARIES_DIR/script sys_partition.fex

echo "-----------------update_mbr--------------------------"
$BINARIES_DIR/update_mbr  sys_partition.bin 4

echo "-----------------dragon pack--------------------------"
$BINARIES_DIR/dragon  image.cfg sys_partition.fex

