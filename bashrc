if [ -n "$DISPLAY" -a "$TERM" == "gnome-terminal" ]; then
    export TERM=gnome-256color
fi
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi
