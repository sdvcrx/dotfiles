# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# theme
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE='true'

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting systemd sudo)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# .bashrc
export CLICOLOR="true"
export EDITOR="/usr/bin/vim -p -X" visudo
export GIT_EDITOR="vim"

# keybind

bindkey "^p" up-line-or-search
bindkey "^n" down-line-or-search

# zsh
setopt hist_ignore_all_dups
setopt hist_ignore_space
unsetopt share_history

# java font
export JAVA_FONTS=/usr/share/fonts/TTF

#======== Function =============#
function git-ignore-io() {
    curl https://www.gitignore.io/api/$@ ;
}

function psgrep(){
    ps axu | ag $1
}

# virtualenvwrapper
function loadv() {
    export WORKON_HOME=$HOME/.virtualenvs
    source virtualenvwrapper.sh
    alias v='workon'
    alias v.deactivate='deactivate'
    alias v.mk='mkvirtualenv --no-site-packages'
    alias v.mk_withsitepackages='mkvirtualenv'
    alias v.rm='rmvirtualenv'
    alias v.switch='workon'
    alias v.add2virtualenv='add2virtualenv'
    alias v.cdsitepackages='cdsitepackages'
    alias v.cd='cdvirtualenv'
    alias v.lssitepackages='lssitepackages'
    workon $1
}


#======== Alias =============#
alias ll='ls -hl --color=auto'
alias ls='ls --color=auto'
alias l='ls --color=auto'

alias grep='grep -i --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias yaupg='yaourt -Syua'
alias yi='yaourt -S'
alias ys='yaourt -Ss'

# cpuinfo
alias cpuinfo='watch grep \"cpu MHz\" /proc/cpuinfo'

# most man
export MANPAGER="/usr/bin/most -s"

# ag(the_silver_searcher)
alias ag='ag -i --color-match "1;32"'

# vbox
alias vboxload='sudo modprobe vboxdrv vboxpci vboxnetflt vboxnetadp'

# alias zeal='QT_HARFBUZZ=old zeal'
alias turnoffnv='sudo su -c "tee /proc/acpi/bbswitch <<<OFF"'
alias mutt='TERM=screen-256color mutt'
alias px='proxychains4'

# tmux and 256color
alias tmux="tmux -2"
if [ "$COLORTERM" = "lilyterm" ]; then
    export DISABLE_AUTO_TITLE=true
    export TERM=screen-256color
fi

if [[ $TERM == xterm-termite  ]]; then
    export TERM=xterm-256color
fi

# fasd
eval "$(fasd --init auto)"
alias vi='f -e vim'
unset GREP_OPTIONS

# nodejs
# phantomjs
export PHANTOMJS_CDNURL=http://cnpmjs.org/downloads

# i3
export TERMINAL=konsole

# ssh agent
eval "$(envoy -p)"

# fzf
fe() {
  IFS='
'
  local declare files=($(fzf --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && nvim "${files[@]}"
  unset IFS
}
