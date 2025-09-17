#!/usr/bin/env bash
set -euo pipefail

confirm() {
  local q="${1:-Are you sure?}"
  [ "$(printf "No\nYes" | wofi --dmenu -i -p "$q")" = "Yes" ]
}

choice="$(printf '%s\n' \
  "  Lock" \
  "  Logout" \
  "  Suspend" \
  "  Reboot" \
  "  Shutdown" |
  wofi --dmenu -i -p "Power" --hide-scroll --no-actions)"

case "${choice%%  *}" in
"" | Lock) swaylock -f -c 000000 ;;
"" | Logout) swaymsg exit ;;
"" | Suspend)
  swaylock -f -c 000000
  systemctl suspend
  ;;
"" | Reboot) confirm "Reboot?" && systemctl reboot ;;
"" | Shutdown) confirm "Power off?" && systemctl poweroff ;;
*) exit 0 ;;
esac
