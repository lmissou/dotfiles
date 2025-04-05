#!/bin/bash

# create symbolink for config files

DOT_PATH=$PWD
CONFIG_PATH=$XDG_CONFIG_HOME
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  CONFIG_PATH="$HOME/.config"
fi

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
  if [[ -d "$CONFIG_PATH/$file" ]]; then
    rm -rf $CONFIG_PATH/$file
  fi
  ln -s "$DOT_PATH/config/$file" "$CONFIG_PATH/"
done

