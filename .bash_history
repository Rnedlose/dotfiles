wiremix
sudo pacman -S pipewire pipewire-pulse
sudo pacman -Rns pulseaudio
clear
wiremix
sudo pacman -S wireplumber
sudo pacman -S pipewire-alsa alsa-utils
sudo pacman -S pipewire-jack pipewire-audio bluez bluez-utils
systemctl --user enable --now pipewire pipewire-pulse wireplumber
systemctl --user status pipewire wireplumber
clear
pactl info | grep "Server Name"
pactl list short sinks
wiremix
clear
sudo pacman -S fprintd libfprint
systemctl status fprintd
clear
fprintd-enroll
sudo pacman -S polkit-gnome
sudo nvim ~/.xinitrc
sudo reboot
fprintd-enroll
fprintd-verify
sudo true
clear
sudo nvim /etc/pam.d/sudo
sudo -k
sudo true
yay -Syu
clear
xinput list
sudo pacman -S xorg-xinput
xinput list
xinput list
xinput list-props 16 | grep -i tapping
xinput set-prop 16 "libinput Tapping Enabled" 1
xinput list-props 16 | grep -i tapping
clear
sudo mkdir -p /etc/X11/xorg.conf.d
sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf
sudo reboot
sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf
clear
sudo pacman -S brightnessctl playerctl
clear
xev
sudo pacman -S xorg-xev
xev
xev
clear
sudo pacman -S sxhkd playerctl brightnessctl
sudo pacman -S pipewire wireplumber
command -v wpctl
sudo nvim ~/.xinitrc
mkdir -p ~/.config/sxhkd
nvim ~/.config/sxhkd/sxhkdrc
clear
pkill sxhkd
sxhkd &
cd .config/oxwm/
nvim config.lua 
sudo reboot
cd .config/oxwm/
nvim config.lua 
yay -S discord spotify obsidian
cd .config/oxwm
nvim config.lua 
nvim ~/.xinitrc
sudo reboot
nvim ~/.xinitrc
cd .config/oxwm/
nvim config.lua 
nvim ~/.xinitrc
sudo reboot
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub   https://flathub.org/repo/flathub.flatpakrepo
sudo restart x
sudo reboot
flatpak install flathub com.discordapp.Discord
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.spotify.Client
clear
flatpak run com.spotify.Client
yay -R discord
yay -R spotify obsidian
clear
flatpak override --user --env=ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1 com.discordapp.Discord
flatpak override --user --env=ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1 md.obsidian.Obsidian
flatpak override --user --env=ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1 com.spotify.Client
flatpak override --user --env=GDK_SCALE=1 com.discordapp.Discord
flatpak override --user --env=GDK_SCALE=1 md.obsidian.Obsidian
flatpak override --user --env=GDK_SCALE=1 com.spotify.Client
flatpak run com.discordapp.Discord
flatpak kill com.discordapp.Discord
rm -rf ~/.var/app/com.discordapp.Discord/config/discord
rm -rf ~/.var/app/com.discordapp.Discord/data/discord/Cache
flatpak run com.discordapp.Discord   --force-device-scale-factor=1   --high-dpi-support=1   --disable-features=WaylandWindowDecorations
cd .config/oxwm/
nvim config.lua 
clear
nvim .config/oxwm/config.lua 
nvim ~/.config/sxhkd/sxhkdrc 
pkill sxhkd
sxhkd &
clear
sudo pacman -S dunst libnotify
nvim ~/.xinitrc
cd .local
ls
mkdir bin
cd bin
nvim osd-vol
nvim osd-bright
nvim osd-track
chmod +x ~/.local/bin/osd-vol ~/.local/bin/osd-bright ~/.local/bin/osd-track
cd
nvim ~/.config/sxhkd/sxhkdrc 
sudo reboot
pgrep -a dunst || echo "dunst not running"
notify-send "OSD test" "If you see this, notifications work"
echo $?
echo "DISPLAY=$DISPLAY"
echo "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS"
dbus-send --session --print-reply   --dest=org.freedesktop.Notifications   /org/freedesktop/Notifications   org.freedesktop.Notifications.GetServerInformation
pkill dunst
dunst -config /dev/null -verbosity=debug &
notify-send "OSD test" "If you see this, your dunstrc is the problem"
mkdir -p ~/.config/dunst
nvim ~/.config/dunst/dunstrc
pkill dunst
dunst &
notify-send "OSD test" "You should see this top-center"
nvim ~/.config/dunst/dunstrc
pkill dunst
dunst &
notify-send "OSD test" "You should see this top-center"
nvim ~/.config/dunst/dunstrc
pkill dunst
dunst &
dunst &
notify-send "OSD Test" "TokyoNight Storm"
sudo reboot
nvim ~/.xinitrc
sudo reboot
cd .config
ls
cd rofi
ls
nvim config.rasi 
nvim config.rasi 
sudo reboot
bluetui
flatpak override --user --env=ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1.25 com.spotify.Client
flatpak kill com.spotify.Client
flatpak run com.spotify.Client
flatpak override --user --show com.spotify.Client
flatpak override --user --unset-env=GDK_SCALE com.spotify.Client
flatpak override --user --unset-env=GDK_DPI_SCALE com.spotify.Client
flatpak kill com.spotify.Client
flatpak override --user --env=ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1.25 com.spotify.Client
flatpak override --user --show com.spotify.Client
flatpak override --user --env=ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1.75 com.spotify.Client
flatpak override --user --show com.spotify.Client
flatpak kill com.spotify.Client
flatpak override --user --show com.spotify.Client
flatpak run com.spotify.Client
gh auth
yay -S gh
yay -S github-cli
clear
gh auth login
clear
git clone git@github.com:Rnedlose/dotfiles.git
fastfetch
clear
clear && fastfetch
yay -S yazi
yazi
yay -S unzip
cd Downloads/
ls
unzip nvim.zip -d ~/.config/
nvim
nvim
cd .config/nvim
vim .
nvim
nvim
nvim
nvim
nvim
nvim
cd
sudo pacman -S nodejs npm
sudo pacman -S nodejs npm
yay -S node
yay -S nodejs
yay -S npm
sudo pacman -S reflector
sudo reflector   --country US,CA   --protocol https   --latest 20   --sort rate   --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
yay -S npm
python -v
python --version
yay -S pyright
clear
nvim
nvim
nvim
nvim
clear
nvim
exit
cd .config/tmux/
ls
nvim tmux.conf 
nvim tmux.conf 
exit
cd dotfiles/
nvim .
nvim
exit
nvim
exit
exit
ls
source .bashrc
clear
yay -R starship
clear
cd dotfiles/
cd .config/
nvim .zshrc
nvim
cd ..
ls
ls -a
nvim .zshrc 
exit
yay -S starship
nvim .bashrc
sourc .bashrc
source .bashrc
clear
yay -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
tmux
source .bashrc
nvim .bashrc
source .bashrc
clear
nvim .bashrc
source .bashrc
nvim .bashrc
source .bashrc
cf
cd dotfiles/
ls
exit
exit
nvim
nvim
cd .config/tmux/
nvim
clear
nvim .bashrc
ls
cd
nvim .bashrc
source .bashrc
clear
nvim .bashrc
yay -S eza bat ripgrep fd zoxide
nvim .bashrc
yay -S fzf
source .bashrc
clear
cf
tmux kill
tmux kill-session Terminal
tmux kill-session
cd dotfiles/
exit
tmt
yay -S feh
clear
cd .local
ls
cd bin
ls
nvim wallcycle.sh
chmod +x random-wallpaper.sh 
ls
random-wallpaper.sh 
random-wallpaper.sh 
random-wallpaper.sh 
ls
cd
cd .config/oxwm/
nvim config.lua 
nvim config.lua 
nvim config.lua 
..
cd alacritty/
nvim
cd .config
ls
cd picom/
ls
nvim picom.conf 
exit
cd .config/alacritty/
nvim
clear
cd
cf
nvim .bashrc
cf
source .bashrc
cf
clear
cf
cd .config/oxwm/
nvim
cd
nvim ~/.xinitrc
cf
nvim ~/.xinitrc
bat .bashrc
nv
nvim
exit
nvim
exit
tmt
tmt
nvim
nv
nvim
clear
cd
cf
tmt
yay -S stow
clear
cd dotfiles/
ls
ls -a
stow .
cd dotfiles/
stow .xinitrc 
ls
ls -a
stow .
git config --global user.name "Rodney Nedlose"
git config --global user.email "nedloserodney@gmail.com"
cd dotfiles/
ls
lazygit
lazygit
cd dotfiles/
stow .
z dot
lazygit
cd
clear
sudo reboot
nvim
cd
cf
source .bashrc
cf
cf
yazi
cf
source .bashrc
cf
cd .config
cd tmux/
nvim
cd
clear
echo $0
echo $SHELL
shopt -q login_shell && echo "login" || echo "not login"
lsa
nvim .bash_profile 
exit
cf
exit
cf
exit
tmt
source ~/.bash_profile
tmux kill-server
tmt
tmux kill-server
tmux kill-session
tmt
cd dotfiles/
stow .
cd dotfiles/
lazygit
git push origin main
cd
ls
lsa
git config --global user.name "Rodney Nedlose"
git config --global user.email "nedloserodney@gmail.com"
cd dot
lazygit
z dot
git init
git branch -m main
git add .
impala
exit
z dot
lazygit
git commit -m "Reconfiguring git for this repo"
ping google.com
ping google.com
clear
cd dotfiles/
ls
ls -a
stow .
stow .
git remote origin add git@github.com:Rnedlose/dotfiles.git
git remote add origin git@github.com:Rnedlose/dotfiles.git
git push origin main
ping google.com
impala
cd dot
ls
lazygit
sudo reboot
ping google.com
clear
cd dotfiles/
ls
git push
ping google.com
ping google.com
clear
ping google.com
ping google.com
ping google.com
clear
ping google.com
ping google.com
impala
ping google.com
clear
cd dotfiles/
git init
git branch -M main
git remote add origin git@github.com:Rnedlose/dotfiles.git
git remote -v
git status
git add .
git commit -m "Reconfigured local dots"
git push -u origin main
git pull
git push -u origin main
gh auth login
ping google.com
lazygit
ping google.com
clear
cd
impala
ping google.com
clear
cd dots
ls
cd dot
clear
git init
git branch -m main
git remote add origin git@github.com:Rnedlose/dotfiles.git
git status
git commit -m "Updates"
git add .
git commit -m "Updates"
lazygit
ping google.com
cleaar
clear
cd
cf
clear
ping google.com
cd dot
lazygit
cd
sudo reboot
tmt
cd .config/oxwm/
ls
