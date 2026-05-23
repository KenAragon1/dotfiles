#!/bin/sh

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

export XDG_CURRENT_DESKTOP=dwm

feh --bg-scale ~/wallpapers/creation_of_adam.jpg &
# dunst &
dwmblocks &
exec dwm 
