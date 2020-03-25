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
pgrep fcitx > /dev/null
if [ $? -ne 0 ]; then
    fcitx5 &
fi

#
# picom
#
pgrep picom > /dev/null
if [ $? -ne 0 ]; then
    picom -b
fi

#
# yakuake
#
pgrep yakuake > /dev/null
if [ $? -ne 0 ]; then
    yakuake &
fi

