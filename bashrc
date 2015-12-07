if [ -n "$DISPLAY" -a "$TERM" == "gnome-terminal" ]; then
    export TERM=gnome-256color
fi
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi
if [ -n "$PS1" ]; then
    PS1="\u\[\e[1;31m\]@\h\[\e[m\] \[\033[0;34m\]\W\[\033[m\] \[\033[1;37m\]$\[\033[m\] "
fi

# General preferences
export EDITOR=vim
export GEDITOR=gvim

if [[ "$(uname)" == "Linux" ]]; then
    configpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    eval $(dircolors $configpath/dircolors)
fi
