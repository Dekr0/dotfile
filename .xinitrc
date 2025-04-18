#!/bin/bash

xset +fp /home/dekr0/.local/share/fonts
xset fp rehash

# Note that all .sh scripts and commands should write before "exec dwm". 
# Also, remember to put "&" at the end of each commands / .sh scripts

$ZDOTDIR/bar.sh &

xrandr --output DP-2 --primary --mode 1920x1080 --rate 144.0 --output HDMI-1 --mode 1920x1080 --left-of DP-2

hsetroot -solid black

# Note that "exec dwm" should be place at the end of .xinitrc
exec dwm
