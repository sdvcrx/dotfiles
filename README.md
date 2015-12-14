# dotfiles #

I am using `rcm`(rc file management) to manage dotfiles.

## Install ##

    yaourt -S rcm-git
    git clone git@github.com:banbanchs/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rcup -v

## Usage ##

Add a dotfile by symlinking

    mkrc -v files

Add a dotfile by copying

    mkrc -v -C files

