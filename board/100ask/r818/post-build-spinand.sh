#!/bin/sh
BOARD_DIR="$(dirname $0)"


# For debug
echo "Target binary dir $BOARD_DIR"

cp $BOARD_DIR/env-spinand.cfg -rfvd  $BINARIES_DIR
cp $BOARD_DIR/boot_package.cfg -rfvd  $BINARIES_DIR
cp $BOARD_DIR/bootlogo.bmp.lzma -rfvd  $BINARIES_DIR
cp $BOARD_DIR/bootlogo.bmp -rfvd  $BINARIES_DIR
cp $BOARD_DIR/ramdisk.img -rfvd  $BINARIES_DIR
cp $BOARD_DIR/sys_partition.fex -rfvd  $BINARIES_DIR

# Copy some system bins.
cp $BOARD_DIR/../pack_img/* -rfvd  $BINARIES_DIR

#Copy tina pack tools
cp $BOARD_DIR/../tina-pack-tools/* -rfvd  $BINARIES_DIR


#cd buildroot/output/images/
cd $BINARIES_DIR

#build env.fex bootargs.
# mkenvimage -r -p 0x00 -s 0x20000 -o env.fex env-spinand.cfg

#build uboot optee files.
#$BINARIES_DIR/dragonsecboot  -pack boot_package.cfg

#buildroot kernel boot images.
mkbootimg --kernel  Image --ramdisk  ramdisk.img --board  r818-sc3917 --base  0x40000000 --kernel_offset  0x80000 --ramdisk_offset  0x02000000 -o  boot.img
