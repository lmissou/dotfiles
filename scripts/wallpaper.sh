#!/bin/bash

if [ -z $WALLPAPER_VIDEO ]; then
  hyprpaper &
else
  mpvpaper -o 'no-audio shuffle --loop-playlist --hwdec=nvdec' '*' "$WALLPAPER_VIDEO" &
fi
