# dotfiles #

I am using [rcm](https://github.com/thoughtbot/rcm) to manage dotfiles.

## Install ##

    yaourt -S rcm-git
    git clone git@github.com:sdvcrx/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rcup -v

## Usage ##

Add a dotfile by symlinking

    mkrc -v files

Add a dotfile by copying

    mkrc -v -C files

More usages: https://thoughtbot.github.io/rcm/rcm.7.html

## packages ##

- zsh
- zplug
- fzf
- ripgrep
- fd
- proxychains-ng
- yay
- neovim
