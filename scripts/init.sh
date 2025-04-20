#!/bin/bash

##### create symbolink for config files
DOT_PATH=$PWD
CONFIG_PATH=${XDG_CONFIG_HOME:-$HOME/tmp}
read -r -p "Are You Sure? [Y/n] " input
case $input in
  [yY][eE][sS]|[yY])
    ;;
  *)
    exit 0
    ;;
esac
for file in `ls $DOT_PATH/config`
do
  if [[ -d "$CONFIG_PATH/$file" || -f "$CONFIG_PATH/$file" ]]; then
    rm -rf $CONFIG_PATH/$file
  fi
  ln -s "$DOT_PATH/config/$file" "$CONFIG_PATH/"
done


##### setup somethings
# use english name for user dirs
LANG=en_US.UTF-8 xdg-user-dirs-update

# install systemd services
systemctl --user enable hyprpolkitagent.service
systemctl --user enable hypridle.service
systemctl --user enable waybar.service
systemctl --user enable swaync.service

