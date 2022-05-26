#!/bin/bash
setxkbmap -layout "us,ru" -option "grp:caps_toggle" &
nitrogen --restore &
picom -b &
nm-applet &
warpd &
xrandr --output HDMI1 --auto &
exec --no-startup-id xfce4-power-manager &
/home/mod/.config/polybar/launch.sh

