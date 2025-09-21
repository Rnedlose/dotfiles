export PATH=$PATH:/home/rodney/.local/bin
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$HOME/.cargo/bin:$PATH"
export GDK_BACKEND=wayland
export QT_QPA_PLATFORMTHEME=gtk2
export GTK3_MODULES=gdk-gtk3
export QT_QPA_PLATFORMTHEME=gtk2

eval "$(starship init zsh)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias cd='z'
alias v='nvim'
alias y='yazi'
alias ls='eza --icons=always'
alias lsa='ls -a'
alias cf='clear && fastfetch'
alias nv='cd ~/.config/nvim && nvim init.lua'
alias bv='cd ~/.config/hypr && nvim bindings.conf'
alias zv='cd && nvim .zshrc'
alias tv='cd ~/.config/tmux && nvim tmux.conf'
alias wv='cd ~/.config/waybar && nvim config.jsonc'
alias zsh='cd && source .zshrc'
alias ..='cd ..'
alias ...='cd ../..'
alias tmn='tmux new-session -s'
alias tmk='tmux kill-session -t'
alias tmt='tmux new-session -s Terminal'
alias tmf='tmux new-session -s Files'
alias tma='tmux attach-session -t'
alias tmat='tmux attach-session -t Terminal'
alias tmaf='tmux attach-session -t Files'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
