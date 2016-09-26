## i3 ##

Using [i3-gaps-next](https://github.com/Airblader/i3), a fork of [i3wm](http://www.i3wm.org/) with more features, as window manager and desktop.

### Dependency ###

    yaourt -S i3-gaps-next-git i3lock-color-git i3lock-fancy-git i3status i3-blocks-gaps-git conky compton-git pavucontrol xtitle rofi feh fcitx ttf-ubuntu-font-family ttf-font-awesome

### Generate screen layout ###

We use `arandr` to generate layout file

    yaourt -S arandr
    arandr # save new layout to ~/.i3/scree.sh

### FAQ ###

Q: How can I set a desktop wallpaper?

A: Link or copy image to `~/.i3/wallpaper.jpg`.

Q: multi-monitor support?

A: [Generate screen layout](#generate-screen-layout) and save layout file to `~/.i3/screen.sh`, then reload configuration or run `~/.i3/autostart.sh`.

