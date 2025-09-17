#!/usr/bin/env bash

# Simple waybar restart script for NixOS/Hyprland
# Using more targeted process killing to avoid script termination

# Set up environment variables that waybar needs
export WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-1}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}

# Kill waybar processes more carefully
for pid in $(pgrep -f "^waybar$"); do
    if kill -TERM "$pid" 2>/dev/null; then
        # Wait for process to die gracefully
        timeout 3 tail --pid="$pid" -f /dev/null 2>/dev/null
    fi
done

# Force kill any remaining waybar processes
for pid in $(pgrep -f "^waybar$"); do
    kill -KILL "$pid" 2>/dev/null
done

# Wait a moment for cleanup
sleep 0.5

# Start waybar in background
waybar >/dev/null 2>&1 &
