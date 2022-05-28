#!/bin/bash
killall -q volumeicon &
while pgrep -u $UID -x volumeicon >/dev/null; do sleep 1; done
setxkbmap -layout "us,ru" -option "grp:caps_toggle" &
nitrogen --restore &
volumeicon &
picom -b &
nm-applet &
xrandr --output HDMI1 --auto &
xfce4-power-manager &
~/.config/qtile/launch.sh &

