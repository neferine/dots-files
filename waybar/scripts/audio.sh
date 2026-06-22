#!/usr/bin/env bash

SINK=$(pactl get-default-sink 2>/dev/null)
VOL=$(pactl get-sink-volume "$SINK" 2>/dev/null | grep -oP '\d+%' | head -1)
MUTED=$(pactl get-sink-mute "$SINK" 2>/dev/null)

if [ "$MUTED" = "yes" ]; then
    if echo "$SINK" | grep -q "bluez"; then
        printf "\uf293 MUTED"
    else
        printf "\uf026 MUTED"
    fi
else
    if echo "$SINK" | grep -q "bluez"; then
        printf "\uf293 %s" "$VOL"
    else
        if [ "${VOL%\%}" -lt 33 ]; then
            printf "\uf026 %s" "$VOL"
        elif [ "${VOL%\%}" -lt 66 ]; then
            printf "\uf027 %s" "$VOL"
        else
            printf "\uf028 %s" "$VOL"
        fi
    fi
fi
