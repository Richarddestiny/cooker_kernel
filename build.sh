#########################################################################
# File Name: build.sh
# Author: Richard
# mail: freedom_wings@foxmail.com
# Created Time: Sat 24 Apr 2021 09:00:26 PM PDT
#########################################################################
#!/bin/bash

ENV_DIR=/home/richard/work/cooker/software/linux/env
. $ENV_DIR/env.sh

KERNEL_DIR=$BUILD_PWD
FIRMWARE_DIR=$KERNEL_DIR/../firmware/kernel
OUTPUT_DIR=$KERNEL_DIR/../output/kernel

echo $OUTPUT_DIR

cd $KERNEL_DIR
make O=$OUTPUT_DIR myd_imx8mm_defconfig

LDFLAGS="" CC=$CC  make O=$OUTPUT_DIR dtbs Image modules -j8
run_check $? $LINENO makekernel

mkdir -p $FIRMWARE_DIR/modules
make O=$OUTPUT_DIR modules_install INSTALL_MOD_PATH=$FIRMWARE_DIR/modules
make O=$OUTPUT_DIR modules_install INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=$FIRMWARE_DIR/modules/strip
cp -ub $OUTPUT_DIR/arch/arm64/boot/Image  $FIRMWARE_DIR/
cp -ub $OUTPUT_DIR/arch/arm64/boot/dts/myir/myb*.dtb $FIRMWARE_DIR/
