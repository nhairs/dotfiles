#!/bin/sh
xrandr --output eDP-1 --mode 2560x1440 --pos 5760x186 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output DVI-I-4-4 --off --output DVI-I-3-3 --off --output DVI-I-2-2 --mode 1920x1080 --pos 0x546 --rotate normal --output DVI-I-1-1 --primary --mode 3840x2160 --pos 1920x0 --rotate normal

nitrogen --restore
~/.local/bin/reset_workspaces
