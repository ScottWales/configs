if [ -n "$DISPLAY" -a "$TERM" == "gnome-terminal" ]; then
    export TERM=gnome-256color
fi
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi
if [ -n "$PS1" ]; then
    qjobs=0
    rjobs=0
    if [ -n "$(which qstat)" ]; then
        PROMPT_COMMAND='qjobs=$(qstat -u $USER | grep -c $USER);\
                        rjobs=$(qstat -u $USER | grep -c -e "\<$USER\>.*\<R\>");'
    fi
    PS1="\u\[\e[1;31m\]@\h\[\e[m\] \$((\$qjobs - \$rjobs)) \[\e[0;32m\]\$rjobs\[\e[0m\] \[\033[0;34m\]\W\[\033[m\] \[\033[1;37m\]$\[\033[m\] "
fi

# General preferences
export EDITOR=vim
export GEDITOR=gvim

configpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
eval $(dircolors $configpath/dircolors)
