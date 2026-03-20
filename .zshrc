# Autocompletion
autoload -U compinit
source "$HOME/dev/zsh-autosuggestions/zsh-autosuggestions.zsh"
setopt COMPLETE_IN_WORD
fpath+=~/.zfunc
compinit

# History
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

# colors
export CLICOLOR=1
PROMPT='%F{172}%1~%f %F{yellow}λ%f '

# vim shit
alias vi=nvim
alias vfzf='vi $(fzf)'
export EDITOR='vi'
# load vim mode plugin
source "$HOME/dev/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
# (make vi-mode transitions faster)
export KEYTIMEOUT=1

# syntax highlighting
source "$HOME/dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# aerospace
function ff() {
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

# paths
export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"
export PATH=$HOME/.bin:$PATH
export PATH=/opt/llvm/bin:$PATH
