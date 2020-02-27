## i3 ##

Using [i3-gaps-next](https://github.com/Airblader/i3), a fork of [i3wm](http://www.i3wm.org/) with more features, as window manager and desktop.

### Dependency ###

```bash
yay -S i3-gaps-next-git i3lock-color-git i3lock-fancier-rapid i3status i3-blocks-gaps-git picom-git pavucontrol-qt xtitle rofi feh

# fonts
yay -S ttf-ubuntu-font-family otf-font-awesome ttf-ubuntu-mono-derivative-powerline-git

# tool
yay -S pcmanfm-qt-git flameshot fcitx fcitx-rime
```

### Generate screen layout ###

We use `arandr` to generate layout file

    yay -S arandr
    arandr # save new layout to ~/.i3/scree.sh

### FAQ ###

Q: How can I set a desktop wallpaper?

A: Link or copy image to `~/.i3/wallpaper.jpg`.

Q: multi-monitor support?

A: [Generate screen layout](#generate-screen-layout) and save layout file to `~/.i3/screen.sh`, then reload configuration or run `~/.i3/autostart.sh`.

