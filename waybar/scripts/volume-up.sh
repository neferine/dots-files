#!/usr/bin/env bash
CURRENT=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '\d+%' | head -1 | tr -d '%')
if [ -n "$CURRENT" ] && [ "$CURRENT" -lt 100 ]; then
    NEW=$(( CURRENT + 5 ))
    [ "$NEW" -gt 100 ] && NEW=100
    pactl set-sink-volume @DEFAULT_SINK@ "${NEW}%"
fi
