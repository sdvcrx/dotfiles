#!/bin/env bash

screen_sh="`pwd`/screen.sh"

if [ -f "$screen_sh" ]; then
    sh "$screen_sh"
fi

# wrapper
wallpaper="`pwd`/wallpaper.jpg"
if [ -f "$wallpaper" ]; then
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
