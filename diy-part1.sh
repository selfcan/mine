#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i "/helloworld/d" "feeds.conf.default"
# Modify X86 Kernel 5.4
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile
# Modify X86 Kernel 5.19
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.0/g' target/linux/x86/Makefile

# Add a feed source
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
#echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> "feeds.conf.default"
#echo "src-git small https://github.com/kenzok8/small" >> "feeds.conf.default"
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo "src-git opentopd  https://github.com/sirpdboy/sirpdboy-package" >> "feeds.conf.default"

