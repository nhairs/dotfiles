#!/bin/bash

BIG_LEFT=$(xrandr_to_edid | grep "DEL-39329-87GBP43" | cut -d ' ' -f 1)
BIG_RIGHT=$(xrandr_to_edid | grep "DEL-26609-FB9YCH4" | cut -d ' ' -f 1)
OFF_OUTPUT=$(xrandr | grep -Eo "^[[:alnum:]-]*\s(dis)?connected" | grep -v eDP-1 | grep -v $BIG_LEFT | grep -v $BIG_RIGHT| cut -d " " -f 1 | xargs -I _ echo -n "--output _ --off ")

xrandr \
    --output eDP --mode 1920x1080 --pos 0x1440 --rotate normal \
    --output $BIG_LEFT --mode 2560x1440 --pos 0x0 --rotate normal \
    --output $BIG_RIGHT --primary --mode 2560x1440 --pos 2560x0 --rotate normal \
    $OFF_OUTPUT

sleep 5

nitrogen --restore

reset_workspaces
