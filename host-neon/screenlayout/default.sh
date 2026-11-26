#!/bin/bash
XRANDR=$(xrandr) || exit 1
OFF_OUTPUTS=()
while read -r OUTPUT STATE _; do
    if [[ ( $STATE == connected || $STATE == disconnected ) && $OUTPUT != eDP ]]; then
        OFF_OUTPUTS+=(--output "$OUTPUT" --off)
    fi
done <<< "$XRANDR"
if ! xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal "${OFF_OUTPUTS[@]}"; then
    echo 'Cannot apply the laptop layout. Check output eDP and mode 1920x1080.' >&2
    exit 1
fi

nitrogen --restore
