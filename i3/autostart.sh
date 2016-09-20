#!/bin/env bash

i3_config_path="$HOME/.i3"
screen_sh="$i3_config_path/screen.sh"

if [ -e "$screen_sh" ]; then
    sh "$screen_sh"
fi

# wrapper
wallpaper="$i3_config_path/wallpaper.jpg"
if [ -e "$wallpaper" ]; then
    feh --bg-fill "$wallpaper"
fi

#
# fcitx
#
ps cax | grep fcitx > /dev/null
if [ $? -ne 0 ]; then
    fcitx &
fi

ps cax | grep compton > /dev/null
if [ $? -ne 0 ]; then
    compton -b
fi
