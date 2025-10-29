#!/bin/sh

BIG_LEFT=$(xrandr_to_edid | grep "VSC-13627-V5E201962534" | cut -d ' ' -f 1)
BIG_RIGHT=$(xrandr_to_edid | grep "SAM-41841-HNMW900360" | cut -d ' ' -f 1)
OFF_OUTPUT=$(xrandr | grep -Eo "^[[:alnum:]-]*\s(dis)?connected" | grep -v eDP-1 | grep -v $BIG_LEFT | grep -v $BIG_RIGHT| cut -d " " -f 1 | xargs -I _ echo -n "--output _ --off ")

xrandr \
    --output eDP-1 --mode 2560x1440 --pos 5760x186 --rotate normal \
    --output $BIG_LEFT --mode 1920x1080 --pos 0x546 --rotate normal \
    --output $BIG_RIGHT --mode 3840x2160 --pos 1920x0 --rotate normal --primary

nitrogen --restore
~/.local/bin/reset_workspaces
