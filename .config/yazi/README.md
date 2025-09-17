# Yazi Configuration

This directory contains the configuration for Yazi file manager with the **Vague** theme to match your Alacritty and Kitty terminal themes.

## Files

- `yazi.toml` - Main configuration file for Yazi settings
- `theme.toml` - Specifies which theme to use (currently "vague")
- `themes/vague.toml` - The Vague theme definition with colors matching your terminal theme

## Vague Color Palette

The theme uses the same colors as your terminal configurations:

- **Background**: `#141415` (very dark gray)
- **Foreground**: `#cdcdcd` (light gray)
- **Black**: `#252530` / Bright: `#606079`
- **Red**: `#d8647e` / Bright: `#e08398`
- **Green**: `#7fa563` / Bright: `#99b782`
- **Yellow**: `#f3be7c` / Bright: `#f5cb96`
- **Blue**: `#6e94b2` / Bright: `#8ba9c1`
- **Magenta**: `#bb9dbd` / Bright: `#c9b1ca`
- **Cyan**: `#aeaed1` / Bright: `#bebeda`
- **White**: `#cdcdcd` / Bright: `#d7d7d7`

## Color Usage in Yazi

- **Directories**: Blue (`#6e94b2`)
- **Executables**: Green (`#7fa563`)
- **Images**: Yellow (`#f3be7c`)
- **Media files**: Magenta (`#bb9dbd`)
- **Archives**: Red (`#d8647e`)
- **Documents**: Cyan (`#aeaed1`)
- **Broken symlinks**: Red background
- **Hovered items**: Dark gray background (`#252530`)
- **Selection**: Dark gray background (`#252530`)

## Usage

1. **Installation**: Ensure these files are symlinked or copied to `~/.config/yazi/`
2. **Testing**: Run `yazi` in your terminal to test the theme
3. **Reloading**: If you make changes to the theme, restart Yazi or use `:reload` if available

## Customization

To modify colors:

1. Edit `themes/vague.toml`
2. Update the hex color values while maintaining the Vague color palette
3. Restart Yazi to see changes

## Troubleshooting

- **Theme not loading**: Check that `theme.toml` specifies `use = "vague"`
- **Colors not showing**: Ensure your terminal supports true color (24-bit)
- **File type colors**: Modify the `[filetype]` rules section in the theme file

## Original Theme Credit

The Vague theme was created by **vague2k** <ilovedrawing056@gmail.com>
- GitHub: https://github.com/vague2k/vague.nvim
- License: MIT License
