#!/usr/bin/env bash

# Rofi clipboard delete script using cliphist
# Usage: ./clipboard-delete.sh

# Check if cliphist is available
if ! command -v cliphist &> /dev/null; then
    notify-send -e "Clipboard Manager" "cliphist is not installed"
    exit 1
fi

# Get clipboard history and let user select entry to delete
selection=$(cliphist list | rofi -dmenu -i -p "🗑️ Delete from Clipboard History" \
    -theme-str 'window {width: 80%;}' \
    -theme-str 'listview {lines: 10;}')

# If user made a selection, delete it
if [[ -n "$selection" ]]; then
    echo "$selection" | cliphist delete
    notify-send -t 2000 "🗑️ Clipboard" "Entry deleted"
fi
