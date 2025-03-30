#!/bin/bash

if [ -z $WALLPAPER_VIDEO ]; then
  hyprpaper &
else
  mpvpaper -o 'no-audio --loop-playlist shuffle' '*' "$WALLPAPER_VIDEO" &
fi
