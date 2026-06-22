#!/usr/bin/env bash

BRIGHTNESS=$(brightnessctl get 2>/dev/null)
MAX=$(brightnessctl max 2>/dev/null)
if [ -n "$BRIGHTNESS" ] && [ -n "$MAX" ] && [ "$MAX" -gt 0 ]; then
    PERCENT=$(( BRIGHTNESS * 100 / MAX ))
    if [ "$PERCENT" -eq 0 ]; then
        printf "\uf186 %s%%" "$PERCENT"
    elif [ "$PERCENT" -lt 33 ]; then
        printf "\uf0eb %s%%" "$PERCENT"
    else
        printf "\uf185 %s%%" "$PERCENT"
    fi
fi
