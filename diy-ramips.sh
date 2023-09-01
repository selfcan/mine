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
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.4/g' ./target/linux/ramips/mt7621/Makefile
# Modify X86 Kernel 5.19
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' target/linux/ramips/mt7621/Makefile

# Add a feed source
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
#echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> "feeds.conf.default"
#echo "src-git small https://github.com/kenzok8/small" >> "feeds.conf.default"
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo "src-git opentopd  https://github.com/sirpdboy/sirpdboy-package" >> "feeds.conf.default"
#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 固件架构
#cat >> .config <<EOF
#CONFIG_TARGET_ramips=y
#CONFIG_TARGET_ramips_mt7620=y
#CONFIG_TARGET_ramips_mt7620_DEVICE_hiwifi_hc5861=y
#EOF

# 取消默认启用的软件
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-accesscontrol=n
CONFIG_PACKAGE_luci-app-vlmcsd=n
CONFIG_PACKAGE_luci-app-unblockmusic=n
CONFIG_PACKAGE_luci-app-ssr-plus=n
CONFIG_DEFAULT_luci-app-ssr-plus=n
CONFIG_PACKAGE_luci-app-vsftpd=n
EOF

# 5. Protocols
cat >> .config <<EOF
CONFIG_PACKAGE_luci-proto-relay=y
EOF

# USB Support
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb2=y
EOF

# LuCI
cat >> .config <<EOF
CONFIG_LUCI_LANG_zh-cn=y
EOF

# 使固件支持tf卡扩展
cat >> .config <<EOF
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_kmod-nls-cp437=y
CONFIG_PACKAGE_kmod-nls-iso8859-1=y
CONFIG_PACKAGE_kmod-nls-utf8=y
CONFIG_PACKAGE_kmod-sdhci=y
CONFIG_DEFAULT_kmod-sdhci-mt7620=y
CONFIG_PACKAGE_kmod-sit=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
EOF

# Disc
cat >> .config <<EOF
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_parted=y
CONFIG_PACKAGE_cfdisk=y
CONFIG_PACKAGE_blockdev=m
CONFIG_PACKAGE_fdisk=m
CONFIG_PACKAGE_cgdisk=m
CONFIG_PACKAGE_findfs=m
CONFIG_PACKAGE_fixparts=m
CONFIG_PACKAGE_gdisk=m
CONFIG_PACKAGE_hd-idle=m
CONFIG_PACKAGE_hdparm=m
CONFIG_PACKAGE_partx-utils=m
EOF

# Filesystem
cat >> .config <<EOF
CONFIG_PACKAGE_exfat-fsck=y
CONFIG_PACKAGE_exfat-mkfs=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_sysfsutils=y
EOF

#启用软件
#cat >> .config <<EOF
#CONFIG_PACKAGE_luci-app-vssr=m
#CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=m
#CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=m
#CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=m
#CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=m
#CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Libev_Server=m
#EOF

#启用主题
#cat >> .config <<EOF
#EOF
