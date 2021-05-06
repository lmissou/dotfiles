#!/bin/bash

# 窗口特效合成器
picom -b &
# 网络代理
clash &
# 通知管理
dunst &
# 输入法
fcitx5 &
# 调整声音托盘
pa-applet &
# 网络管理托盘
nm-applet &
# 蓝牙托盘
blueman-applet &
# 截图工具
flameshot &
# oneko
#oneko &

/bin/bash ~/scripts/wallpaper.sh &

