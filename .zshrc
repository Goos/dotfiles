# History
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY

# colors
export CLICOLOR=1
PROMPT='%F{172}%1~%f %F{yellow}λ%f '

# Autocompletion
source "$HOME/dev/zsh-autosuggestions/zsh-autosuggestions.zsh"
setopt COMPLETE_IN_WORD

# vim shit
export EDITOR='vi'
# load vim mode plugin
source "$HOME/dev/zsh-vim-mode/zsh-vim-mode.plugin.zsh"
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
alias vi=kittyvimpadding
alias vfzf='vi $(fzf)'
# (make vi-mode transitions faster)
export KEYTIMEOUT=1

# syntax highlighting
source "$HOME/dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# added by automated setup
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/emulator:${ANDROID_SDK}/tools:${ANDROID_SDK}/tools/bin:${ANDROID_SDK}/platform-tools
export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"

# paths
export PATH=$HOME/.bin:$PATH
