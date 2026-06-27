#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
STATE_FILE="$HOME/.cache/wallpaper_index"
CACHE_WAL="$HOME/.cache/wal/wal"

mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort)
if [ ${#WALLPAPERS[@]} -eq 0 ]; then exit 1; fi

IDX=0
if [ -f "$STATE_FILE" ]; then
    IDX=$(cat "$STATE_FILE")
else
    # First run: default to nefwal.png
    for i in "${!WALLPAPERS[@]}"; do
        if [[ "${WALLPAPERS[$i]}" == *"nefwal.png" ]]; then
            IDX=$i
            break
        fi
    done
fi

if [ "${1:-}" = "next" ]; then
    NEXT=$(( (IDX + 1) % ${#WALLPAPERS[@]} ))
else
    NEXT=$IDX
fi
echo "$NEXT" > "$STATE_FILE"

WALLPAPER="${WALLPAPERS[$NEXT]}"

# update pywal cache and apply everything
echo "$WALLPAPER" > "$CACHE_WAL"
bash "$HOME/.config/hypr/scripts/pywal-apply.sh"
