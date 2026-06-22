# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

export PATH=$PATH:"$HOME/.local/bin"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# vim shit
export EDITOR='nvim'
# load vim mode plugin
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
alias vi=nvim
alias vfzf='vi $(fzf)'
# (make vi-mode transitions faster)
export KEYTIMEOUT=1

source "$HOME/.cargo/env"


# Added by Antigravity CLI installer
export PATH="/home/goos/.local/bin:$PATH"

# bun completions
[ -s "/home/goos/.local/share/reflex/bun/_bun" ] && source "/home/goos/.local/share/reflex/bun/_bun"

# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
