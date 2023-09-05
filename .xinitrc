#!/bin/bash

xset +fp /home/dekr0/.local/share/fonts
xset fp rehash

# Note that all .sh scripts and commands should write before "exec dwm". Also, remember to put "&" at the end of each commands / .sh scripts

/home/dekr0/repo/mine/suckless/dwm-bar/dwm_bar.sh > /dev/null &

# xrandr --output DP-1 --primary --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --left-of DP-1

picom -b &
hsetroot -solid black
nitrogen --restore &
flameshot &
wmname LG3D

# Note that "exec dwm" should be place at the end of .xinitrc
exec dwm

