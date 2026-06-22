#!/usr/bin/env bash

STATUS=$(hyprctl getoption input:touchpad:enabled 2>/dev/null | grep -oP 'int: \K\d')

if [ "$STATUS" = "1" ]; then
    hyprctl keyword input:touchpad:enabled false
else
    hyprctl keyword input:touchpad:enabled true
fi
