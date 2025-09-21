#!/usr/bin/env bash

# Rofi clipboard manager script using cliphist
# Usage: ./clipboard.sh

# Check if cliphist is available
if ! command -v cliphist &> /dev/null; then
    notify-send -e "Clipboard Manager" "cliphist is not installed"
    exit 1
fi

# Get clipboard history and let user select
selection=$(cliphist list | rofi -dmenu -i -p "📋 Clipboard History" \
    -theme ~/.config/rofi/themes/vague-clipboard.rasi)

# If user made a selection, copy it to clipboard
if [[ -n "$selection" ]]; then
    echo "$selection" | cliphist decode | wl-copy
    notify-send -t 2000 "📋 Clipboard" "Copied to clipboard"
fi
