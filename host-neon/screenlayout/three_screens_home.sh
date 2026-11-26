#!/bin/bash

if ! EDIDS=$(xrandr_to_edid); then
    echo 'Cannot detect monitors with xrandr_to_edid.' >&2
    exit 1
fi

BIG_LEFT=$(awk '$2 == "DEL-39329-87GBP43" { print $1 }' <<< "$EDIDS")
BIG_RIGHT=$(awk '$2 == "DEL-26609-FB9YCH4" { print $1 }' <<< "$EDIDS")
if [[ ! $BIG_LEFT =~ ^[[:alnum:]_.-]+$ ]]; then
    echo 'Expected exactly one left monitor with EDID DEL-39329-87GBP43.' >&2
    exit 1
fi
if [[ ! $BIG_RIGHT =~ ^[[:alnum:]_.-]+$ ]]; then
    echo 'Expected exactly one right monitor with EDID DEL-26609-FB9YCH4.' >&2
    exit 1
fi
if [[ $BIG_LEFT == "$BIG_RIGHT" || $BIG_LEFT == eDP || $BIG_RIGHT == eDP ]]; then
    echo 'Expected three distinct outputs for the home layout.' >&2
    exit 1
fi

XRANDR=$(xrandr) || exit 1
OFF_OUTPUTS=()
while read -r OUTPUT STATE _; do
    if [[ ( $STATE == connected || $STATE == disconnected ) &&
          $OUTPUT != eDP && $OUTPUT != "$BIG_LEFT" && $OUTPUT != "$BIG_RIGHT" ]]; then
        OFF_OUTPUTS+=(--output "$OUTPUT" --off)
    fi
done <<< "$XRANDR"

if ! xrandr \
    --output eDP --mode 1920x1080 --pos 0x1440 --rotate normal \
    --output "$BIG_LEFT" --mode 2560x1440 --pos 0x0 --rotate normal \
    --output "$BIG_RIGHT" --primary --mode 2560x1440 --pos 2560x0 --rotate normal \
    "${OFF_OUTPUTS[@]}"; then
    echo 'Cannot apply the home layout. Check the connected outputs and their modes.' >&2
    exit 1
fi

sleep 5

STATUS=0
nitrogen --restore || STATUS=1
reset_workspaces || STATUS=1
exit "$STATUS"
