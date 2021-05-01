#!/bin/bash

rm /tmp/wallpaper
mkfifo /tmp/wallpaper; xwinwrap -fs -nf -fdt -ov -- mplayer -shuffle -slave -input file=/tmp/wallpaper -loop 0 -wid WID -nolirc -nosound "/data/Video/视频壁纸/Wallpaper.mp4"
