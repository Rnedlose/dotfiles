#!/bin/bash

DIR=$HOME/.config/backgrounds
CACHE_DIR="$HOME/.cache/lockscreen"
CURRENT_WALLPAPER_CACHE="$CACHE_DIR/current_wallpaper.jpg"

WALLS=($(ls "${DIR}"))

RANDOMWALL=${WALLS[$RANDOM % ${#WALLS[@]}]}
SELECTED_WALLPAPER="${DIR}/${RANDOMWALL}"

# Create cache directory
mkdir -p "$CACHE_DIR"

if [[ $(pidof swaybg) ]]; then
  pkill swaybg
fi

swww query || swww-daemon

# Change to random wallpaper in the Pictures directory
swww img "$SELECTED_WALLPAPER" --transition-fps 60 --transition-type any --transition-duration 3 --resize crop

# Cache the current wallpaper for lockscreen use
cp "$SELECTED_WALLPAPER" "$CURRENT_WALLPAPER_CACHE"
