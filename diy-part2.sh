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
sed -i 's/192.168.1.1/192.168.50.101/g' package/base-files/files/bin/config_generate
# 修改内核版本
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile
sed -i 's/KERNEL_TESTING_PATCHVER:=5.15/KERNEL_TESTING_PATCHVER:=5.4/g' target/linux/x86/Makefile
add koolproxyR 
git clone https://github.com/Beginner-Go/luci-app-koolproxyR.git package/luci-app-koolproxyR
add luci-app-adbyby-plus
#git clone https://github.com/tcsr200722/app-adbyby.git package/luci-app-adbyby-plus
add luci-app-ikoolproxy
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
add luci-app-filebrowser
git clone https://github.com/tcsr200722/luci-app-filebrowser.git package/luci-app-filebrowser
add luci-app-dockerman
#git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
#git clone https://github.com/lisaac/luci-lib-docker.git package/luci-lib-docker
add luci-app-argon-config
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
add openwrt-upx
#git clone https://github.com/kuoruan/openwrt-upx.git package/openwrt-upx
add luci-app-dnsfilter
git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
add luci-app-adblock-plus
git clone https://github.com/tcsr200722/luci-app-adblock-plus.git package/luci-app-adblock-plus
add luci-app-jd-dailybonus
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
add luci-app-speedtest-web
git clone https://github.com/tcsr200722/luci-app-speedtest-web.git package/luci-app-speedtest-web
add NetSpeedTest
#git clone https://github.com/sirpdboy/NetSpeedTest package/luci-app-NetSpeedTest
add luci-app-easymesh
git clone https://github.com/tcsr200722/luci-app-easymesh.git package/luci-app-easymesh
add luci-app-diskman
mkdir -p package/luci-app-diskman && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
add luci-app-advanced
#git clone https://github.com/tcsr200722/luci-app-advanced.git package/luci-app-advanced
add luci-app-oaf
git clone https://github.com/tcsr200722/OpenAppFilter.git package/luci-app-oaf
add luci-app-dockerman
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
add luci-app-gowebdav
git clone https://github.com/immortalwrt/openwrt-gowebdav.git package/luci-app-gowebdav
add luci-app-aliyundrive-webdav
#git clone https://github.com/tcsr200722/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav
add luci-app-jellyfin
git clone https://github.com/tcsr200722/luci-app-jellyfin.git package/luci-app-jellyfin
add luci-app-podminidlna
git clone https://github.com/lisaac/luci-app-podminidlna.git package/luci-app-podminidlna
add luci-app-podsamba
git clone https://github.com/lisaac/luci-app-podsamba.git package/luci-app-podsamba
add luci-app-alist
git clone https://github.com/sbwml/openwrt-alist.git package/luci-app-alist
add go-aliyun-webdav
git clone https://github.com/jerrykuku/go-aliyundrive-webdav.git
git clone https://github.com/jerrykuku/luci-app-go-aliyundrive-webdav.git package/luci-app-go-aliyundrive-webdav
add luci-app-argon-config
git clone https://github.com/selfcan/luci-app-argon-config.git  package/luci-app-argon-config
add luci-app-aliyundrive-fuse
git clone https://github.com/messense/aliyundrive-fuse.git package/luci-app-aliyundrive-fuse
./scripts/feeds update -a
./scripts/feeds install -a
