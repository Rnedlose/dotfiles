export GTK_THEME=Adwaita-dark

# --- HiDPI scaling (2x) ---
# X11 font DPI hint (helps fonts/toolkits that honor Xft.dpi)
xrdb -merge ~/.Xresources &

export PATH="$HOME/.local/bin:$PATH"

# GTK / Firefox (X11) scaling
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Qt scaling (if you run any Qt apps)
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=192

# Electron apps (VS Code, Discord, etc.)
export ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1

# --- your existing stuff ---
xset r rate 200 35 &
picom --config ~/.config/picom/picom.conf &
~/.local/bin/random-wallpaper.sh &
dunst &

sxhkd &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

exec oxwm
