#!/usr/bin/env bash

# Default temperature values
ON_TEMP=3500
OFF_TEMP=6500

# Check if wlsunset is running
if pgrep -x wlsunset; then
  # Kill wlsunset to toggle off
  pkill wlsunset
  notify-send "☀️ Daylight" "Blue light filter disabled"
else
  # Start wlsunset with night temperature
  wlsunset -t $ON_TEMP &
  notify-send "🌙 Nightlight" "Blue light filter enabled ($ON_TEMP K)"
fi

# Restart waybar if it has nightlight module
restart_nightlighted_waybar() {
  if grep -q "custom/nightlight" ~/.config/waybar/config.jsonc; then
    "$HOME/.local/bin/waybar-restart.sh" 2>/dev/null || true
  fi
}
restart_nightlighted_waybar
