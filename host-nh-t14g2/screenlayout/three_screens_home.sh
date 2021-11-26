#!/bin/sh
# adaptor randomly changes what ports are connected
if xrandr | grep -q "DisplayPort-2 connected" ; then
    xrandr --output eDP --primary --mode 1920x1080 --pos 0x1440 --rotate normal \
        --output HDMI-A-0 --off \
        --output DisplayPort-0 --off \
        --output DisplayPort-1 --off \
        --output DisplayPort-4 --off \
        --output DisplayPort-5 --off \
        --output DisplayPort-2 --mode 2560x1440 --pos 0x0 --rotate normal \
        --output DisplayPort-3 --mode 2560x1440 --pos 2560x0 --rotate normal \
        --output DisplayPort-6 --off
else
    xrandr --output eDP --primary --mode 1920x1080 --pos 0x1440 --rotate normal \
        --output HDMI-A-0 --off \
        --output DisplayPort-0 --off \
        --output DisplayPort-1 --off \
        --output DisplayPort-2 --off \
        --output DisplayPort-3 --off \
        --output DisplayPort-4 --mode 2560x1440 --pos 0x0 --rotate normal \
        --output DisplayPort-5 --mode 2560x1440 --pos 2560x0 --rotate normal \
        --output DisplayPort-6 --off
fi
nitrogen --restore

reset_workspaces home
