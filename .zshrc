# Environment
export EDITOR="zed --wait"
export VISUAL="zed --wait"

# Prompt
autoload -Uz promptinit && promptinit
prompt adam1

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Aliases
alias ls="ls --color=auto"
alias ll="ls -la"
alias la="ls -A"
alias dot="cd ~/.dots"

# Hyprland
alias hypr-reload="hyprctl reload"

# Pacman
alias update="sudo pacman -Syu"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rns"

# Source local config if exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
