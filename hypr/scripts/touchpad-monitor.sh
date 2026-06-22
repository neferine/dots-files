#!/usr/bin/env bash

TOUCHPAD_NAME=$(hyprctl devices 2>/dev/null | grep -A1 "touchpad" | grep "Device:" | sed 's/Device: //')

udevadm monitor --subsystem-match=input --property --udev 2>/dev/null | while read -r line; do
    if echo "$line" | grep -q "ID_INPUT_MOUSE\|ID_INPUT_TOUCHPAD\|ACTION=remove\|ACTION=add"; then
        sleep 0.5
        MOUSE=$(hyprctl devices 2>/dev/null | grep -A2 "mouse" | grep -iv "touchpad\|touchpoint\|touch stick" | grep "Device:")
        if [ -n "$MOUSE" ]; then
            hyprctl keyword input:touchpad:enabled false 2>/dev/null
        else
            hyprctl keyword input:touchpad:enabled true 2>/dev/null
        fi
    fi
done
