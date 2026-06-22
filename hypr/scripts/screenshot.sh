#!/bin/bash

DIR="$HOME/Pictures/screenshots"
mkdir -p "$DIR"
FILE="$DIR/$(date +%Y%m%d-%H%M%S).png"

grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE"
