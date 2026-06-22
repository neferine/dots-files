#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
STATE_FILE="$HOME/.cache/wallpaper_index"
CACHE_WAL="$HOME/.cache/wal/wal"

mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort)
if [ ${#WALLPAPERS[@]} -eq 0 ]; then exit 1; fi

IDX=0
[ -f "$STATE_FILE" ] && IDX=$(cat "$STATE_FILE")

NEXT=$(( (IDX + 1) % ${#WALLPAPERS[@]} ))
echo "$NEXT" > "$STATE_FILE"

WALLPAPER="${WALLPAPERS[$NEXT]}"

# update pywal cache and apply everything
echo "$WALLPAPER" > "$CACHE_WAL"
bash "$HOME/.config/hypr/scripts/pywal-apply.sh"
