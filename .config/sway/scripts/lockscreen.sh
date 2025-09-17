#!/bin/bash

# Dynamic lockscreen script that adapts to current wallpaper
# Works with swww wallpaper system

# Configuration
BACKGROUNDS_DIR="$HOME/.config/backgrounds"
FALLBACK_IMAGE="$HOME/.config/backgrounds/0057.jpg"  # Use first available background as fallback
CACHE_DIR="$HOME/.cache/lockscreen"
CURRENT_WALLPAPER_CACHE="$CACHE_DIR/current_wallpaper.jpg"

# Create cache directory
mkdir -p "$CACHE_DIR"

# Function to get a random wallpaper if current one can't be detected
get_random_wallpaper() {
    local walls=($(ls "$BACKGROUNDS_DIR"))
    echo "$BACKGROUNDS_DIR/${walls[$RANDOM % ${#walls[@]}]}"
}

# Function to find the best wallpaper to use
get_lockscreen_wallpaper() {
    # Try to use the most recently set wallpaper from our walls script
    # This approach works better than trying to detect the current swww wallpaper
    local recent_wallpaper
    
    # Check if we have a cached current wallpaper
    if [[ -f "$CURRENT_WALLPAPER_CACHE" ]]; then
        echo "$CURRENT_WALLPAPER_CACHE"
        return
    fi
    
    # Fall back to a random wallpaper
    get_random_wallpaper
}

# Get the wallpaper to use
WALLPAPER=$(get_lockscreen_wallpaper)

# Launch swaylock with the selected wallpaper and nice styling
exec swaylock \
    --image "$WALLPAPER" \
    --scaling fill \
    --ignore-empty-password \
    --show-failed-attempts \
    --font "JetBrainsMono Nerd Font" \
    --font-size 24 \
    --indicator-radius 120 \
    --indicator-thickness 10 \
    --ring-color 7aa2f7 \
    --ring-ver-color bb9af7 \
    --ring-wrong-color f7768e \
    --ring-clear-color 9ece6a \
    --inside-color 1a1b26 \
    --inside-ver-color 1a1b26 \
    --inside-wrong-color 1a1b26 \
    --inside-clear-color 1a1b26 \
    --line-color 00000000 \
    --text-color c0caf5 \
    --text-ver-color c0caf5 \
    --text-wrong-color f7768e \
    --text-clear-color 9ece6a \
    --separator-color 00000000 \
    --key-hl-color bb9af7 \
    --bs-hl-color f7768e \
    --caps-lock-key-hl-color e0af68 \
    --caps-lock-bs-hl-color f7768e \
    "$@"
