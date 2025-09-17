#!/usr/bin/env bash
# waybar-scripts-menu.sh (v3) — correct arg forwarding to inner script

set -euo pipefail

BIN="$HOME/.local/bin"
WALLPAPER="$BIN/wallpaper-random.sh"
POWER="$BIN/wofi-powermenu.sh"
RESTART_WAYBAR="$BIN/waybar-restart.sh"
TOGGLE_NIGHTLIGHT="$BIN/toggle-blue-light.sh"

center_floating() {
  local cls="$1"
  # For sway, floating rules are handled in the main config file
  # This function is kept for compatibility but doesn't need to do anything
  return 0
}

# Launch $1 (path) with remaining args only; then wait for a keypress.
run_in_alacritty_wait() {
  local cls="$1"
  shift
  local cmd="$1"
  shift || true
  center_floating "$cls"
  kitty --class "$cls" -e bash -c ' "$1" "${@:2}"; st=$?; echo; read -n1 -rsp "Done. Press any key to close…"; echo; exit $st ' _ "$cmd" "$@"
}

choice="$(printf "%s\n" "󱩌  Toggle Nightlight" "󰁱  Restart Waybar" "󰸉  Random Wallpaper" "⏻  Power Menu" | wofi --dmenu --prompt "Scripts" --cache-file /dev/null)"

case "${choice:-}" in
"󱩌  Toggle Nightlight")
  bash -lc "$TOGGLE_NIGHTLIGHT"
  ;;
"󰁱  Restart Waybar")
  bash -lc "$RESTART_WAYBAR"
  ;;
"󰸉  Random Wallpaper")
  bash -lc "$WALLPAPER"
  ;;
"⏻  Power Menu")
  bash -lc "$POWER"
  ;;
*)
  exit 0
  ;;
esac
