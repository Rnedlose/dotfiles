#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/.config/backgrounds"
notify() { command -v notify-send >/dev/null && notify-send "Wallpaper" "$1" || true; }

# Wait until hyprpaper's IPC is ready (hyprpaper must be running)
# First wait for the socket file to exist
if [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then
  hyprpaper_sock="/run/user/$(id -u)/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.hyprpaper.sock"
  for _ in {1..100}; do
    [[ -S "$hyprpaper_sock" ]] && break
    sleep 0.1
  done
fi

# Then wait for hyprpaper IPC to respond
for _ in {1..50}; do
  hyprctl hyprpaper listactive >/dev/null 2>&1 && break
  sleep 0.1
done

# Collect candidates (jpg/png) recursively
mapfile -d '' -t files < <(find -L "$DIR" -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) -print0)

((${#files[@]} > 0)) || {
  notify "No images found in $DIR"
  exit 1
}

# Avoid repeating the current wallpaper if possible
current="$(hyprctl hyprpaper listactive 2>/dev/null | awk -F', ' 'NR==1{print $2}')"
pick=""
if [[ -n "${current:-}" && ${#files[@]} -gt 1 ]]; then
  for idx in $(shuf -i 0-$((${#files[@]} - 1)) -n ${#files[@]}); do
    [[ "${files[$idx]}" != "$current" ]] && {
      pick="${files[$idx]}"
      break
    }
  done
fi
[[ -z "$pick" ]] && pick="${files[$RANDOM % ${#files[@]}]}"

# Apply to all monitors at once (no manual preload needed)
hyprctl hyprpaper reload ",$pick" >/dev/null

notify "$(basename "$pick")"
