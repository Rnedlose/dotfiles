export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"

# aliases
alias cd='z'
alias v='nvim'
alias y='yazi'
alias ls='eza --icons=always'
alias lsa='ls -a'
alias cf='clear && fastfetch'
alias nv='cd ~/.config/nvim && nvim init.lua'
alias ..='cd ..'
alias ...='cd ../..'
alias tmn='tmux new-session -s'
alias tmk='tmux kill-session -t'
alias tmt='tmux new-session -s Terminal'
alias tma='tmux attach-session -t'
alias tmat='tmux attach-session -t Terminal'

export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"

# Shell integrations
eval "$(fzf --bash)"
eval "$(zoxide init bash)"

fastfetch
