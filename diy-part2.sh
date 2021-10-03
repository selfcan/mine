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
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate
add koolproxyR 
git clone https://github.com/Beginner-Go/luci-app-koolproxyR.git package/luci-app-koolproxyR
add luci-app-adbyby-plus
#git clone https://github.com/tcsr200722/app-adbyby.git package/luci-app-adbyby-plus
add luci-app-godproxy
git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
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
#git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
add luci-app-adblock-plus
git clone https://github.com/tcsr200722/luci-app-adblock-plus.git package/luci-app-adblock-plus
add luci-app-jd-dailybonus
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
add NetSpeedTest
#git clone https://github.com/sirpdboy/NetSpeedTest package/luci-app-NetSpeedTest
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
./scripts/feeds update -a
./scripts/feeds install -a
