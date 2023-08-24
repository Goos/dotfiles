alias trim="awk '{\$1=\$1};1'"
export ZSH=/Users/robingoos/.oh-my-zsh

export PATH=~/.npm-global/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/dev/sourcekit-lsp/.build/debug"
export PATH="$PATH:$HOME/dev/android-platform-tools"
export PATH="$PATH:$HOME/go/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# direnv
eval "$(direnv hook zsh)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, z, zsh-autosuggestions)

source $HOME/.cargo/env
source $ZSH/oh-my-zsh.sh

alias vi=nvim
alias vfzf='vi $(fzf)'
export EDITOR='vi'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# vi-mode
bindkey -v
" Make vi-mode transitions faster
export KEYTIMEOUT=1

# Speed up VCS status
DISABLE_UNTRACKED_FILES_DIRTY="true"

# zle -N zle-line-init
# zle -N ale-line-finish
# zle -N zle-keymap-select
PROMPT='%F{172}%1~%f %F{yellow}λ%f '

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# # backspace and ^h working even after
# # returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
#
# # ctrl-w removed word backwards
bindkey '^w' backward-kill-word
#
# # ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

if (( $+commands[tag] )); then
    export TAG_CMD_FMT_STRING='nvim "{{.Filename}}" +{{.LineNumber}}'
    tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
    alias ag=tag
fi

alias top='htop'

# Envoy stuff

alias start_hotel='sudo launchctl unload /Library/LaunchDaemons/hotel.plist && sudo launchctl load /Library/LaunchDaemons/hotel.plist > /dev/null'
alias stop_hotel='sudo launchctl unload /Library/LaunchDaemons/hotel.plist > /dev/null'
alias start_pgsql='pg_ctl -D /usr/local/var/postgres start'
alias stop_pgsql='pg_ctl -D /usr/local/var/postgres stop'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

