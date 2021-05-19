#########################################################################
# File Name: build.sh
# Author: Richard
# mail: freedom_wings@foxmail.com
# Created Time: Sat 24 Apr 2021 09:00:26 PM PDT
#########################################################################
#!/bin/bash

ENV_DIR=./../env
. $ENV_DIR/env.sh

KERNEL_DIR=$BUILD_PWD
FIRMWARE_DIR=$KERNEL_DIR/../firmware/kernel
OUTPUT_DIR=$KERNEL_DIR/../output/kernel
ROOTFS_DIR=$BUILD_PWD/../rootfs_debug

echo $OUTPUT_DIR

cd $KERNEL_DIR


if [ $# -ne 0 ];then
	echo $1
	if [ $1 == "menuconfig" ];then
		LDFLAGS="" CC=$CC  make O=$OUTPUT_DIR  $1
	elif [ $1 == "saveconfig" ];then
		LDFLAGS="" CC=$CC  make O=$OUTPUT_DIR  savedefconfig
		cp $OUTPUT_DIR/defconfig  $KERNEL_DIR/arch/arm64/configs/cooker_imx8mm_defconfig

	fi
else

#make O=$OUTPUT_DIR myd_imx8mm_defconfig
make O=$OUTPUT_DIR cooker_imx8mm_defconfig

LDFLAGS="" CC=$CC  make O=$OUTPUT_DIR dtbs Image modules -j16
run_check $? $LINENO makekernel

mkdir -p $FIRMWARE_DIR/modules
#make O=$OUTPUT_DIR modules_install INSTALL_MOD_PATH=$FIRMWARE_DIR/modules
#make O=$OUTPUT_DIR modules_install INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=$FIRMWARE_DIR/modules/strip
make O=$OUTPUT_DIR modules_install INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=$ROOTFS_DIR

cp -ub $OUTPUT_DIR/arch/arm64/boot/Image  $FIRMWARE_DIR/
cp -ub $OUTPUT_DIR/arch/arm64/boot/dts/myir/myb*.dtb $FIRMWARE_DIR/

cp -ub $OUTPUT_DIR/arch/arm64/boot/Image  /tftp
cp -ub $OUTPUT_DIR/arch/arm64/boot/dts/myir/myb*.dtb /tftp

fi
