#!/bin/zsh

source /usr/share/zsh/scripts/zplug/init.zsh

zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "romkatv/powerlevel10k", as:theme, use:config/p10k-robbyrussell.zsh

zplug "agkozak/zsh-z"

zplug "zdharma/fast-syntax-highlighting"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# custom
source $HOME/.zsh_custom
