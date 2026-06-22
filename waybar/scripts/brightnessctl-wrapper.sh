#!/bin/bash
LOCKFILE=/tmp/brightnessctl.lock
MIN_BRIGHTNESS=5
exec 200>"$LOCKFILE"
flock -n 200 || exit 1
case "$1" in
  up)
    brightnessctl set 5%+
    ;;
  down)
    current=$(brightnessctl get)
    max=$(brightnessctl max)
    current_pct=$(( current * 100 / max ))
    if [ "$(( current_pct - 5 ))" -lt "$MIN_BRIGHTNESS" ]; then
      brightnessctl set "${MIN_BRIGHTNESS}%"
    else
      brightnessctl set 5%-
    fi
    ;;
esac
brightnessctl g
