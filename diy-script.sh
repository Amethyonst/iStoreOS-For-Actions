#!/bin/bash

# 修改默认IP
# sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 更改默认 Shell 为 zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# TTYD 免登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 添加额外插件
# git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/kenzok8/small-package

# 移除要替换的包
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat-nft,fullconenat,ibnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb,luci-app-bandwidthd,luci-app-dogcom,luci-app-fullconenat,luci-app-ssr-plus,amule,natflow,nps,UnblockNeteaseMusic-Go,luci-app-gowebdav,luci-app-nginx-pingos,luci-app-npc,luci-app-unblockmusic,natter,luci-app-natter,luci-app-bypass,libnftnl,luci-app-ota}


./scripts/feeds update -a
./scripts/feeds install -a
