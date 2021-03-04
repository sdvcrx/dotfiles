# PATH
export GOPATH=$HOME/.go
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOSUMDB=https://sum.golang.org

export EDITOR="/usr/bin/nvim -p -X" visudo
export GIT_EDITOR="vim"

# man pager
# export MANPAGER="nvim -c 'set ft=man' -"
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging auto'"

# export GEM_PATH=$HOME/.gem/ruby/2.6.0
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/bin/:$GOPATH/bin:$HOME/.emacs.d/bin

# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
# export TZ=:/etc/localtime
