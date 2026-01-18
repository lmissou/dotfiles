#!/usr/bin/env sh
# 切换窗口透明度(hyprland)

OPACITY=$(hyprctl getoption decoration:active_opacity | awk 'NR==1{print $2}')

if [[ "$OPACITY" = 1.000000 ]]; then
  hyprctl keyword decoration:active_opacity 0.75
  hyprctl notify 2 2000 "rgb(40a02b)" "Opacity [ON]"
else
  hyprctl keyword decoration:active_opacity 1
  hyprctl notify 2 2000 "rgb(40a02b)" "Opacity [OFF]"
fi
