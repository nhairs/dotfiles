#!/bin/bash
OFF_OUTPUTS=$(xrandr | grep -Eo "^[[:alnum:]-]*\s(dis)?connected" | grep -v eDP-1 | cut -d " " -f 1 | xargs -I _ echo -n "--output _ --off ")
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal $OFF_OUTPUTS

nitrogen --restore
