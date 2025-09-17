# GTK Theme Configuration

## Tokyo Night Night Theme Setup

This directory contains GTK theme settings configured for the Tokyo Night Night theme to match the rest of the desktop environment.

### Theme Details

- **Theme**: `Tokyonight-Dark-Storm` 
- **Icons**: `Papirus-Dark` 
- **Font**: Ubuntu 11
- **Cursor**: Yaru (24px)

### Installation

The Tokyo Night GTK theme should be installed from:
```bash
git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
cd Tokyo-Night-GTK-Theme/themes
./install.sh -c dark -t default --tweaks storm -l
```

### Files

- `settings.ini` - GTK 3.0 theme configuration
- `../gtk-4.0/settings.ini` - GTK 4.0 theme configuration

### Application

These settings are applied system-wide via:
1. Configuration files (this directory)
2. GSettings: `gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark-Storm'`
3. GSettings: `gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'`

### Coordination

This GTK theme coordinates with:
- Waybar (Tokyo Night colors)
- Yazi file manager theme
- Vesktop/Discord theme  
- Btop system monitor theme
- Terminal applications (Neovim, tmux, etc.)
