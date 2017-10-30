export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/Users/goos/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Editor flags
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vi=nvim

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# vi-mode
bindkey -v
export KEYTIMEOUT=0.4

# Powerline settings
POWERLEVEL9K_MODE='flat'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER='.'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status)

POWERLEVEL9K_TIME_FOREGROUND='226'
POWERLEVEL9K_TIME_BACKGROUND='025'
POWERLEVEL9K_DIR_HOME_FOREGROUND='226'
POWERLEVEL9K_DIR_HOME_BACKGROUND='024'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='226'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='024'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='226'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='024'
POWERLEVEL9K_STATUS_OK_FOREGROUND='green'
POWERLEVEL9K_STATUS_OK_BACKGROUND='025'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='green'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='025'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='226'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='024'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='226'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='024'

function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
      printf '%s' ${terminfo[smkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-line-finish {
    powerlevel9k_prepare_prompts
    if (( ${+terminfo[rmkx]} )); then
        printf '%s' ${terminfo[rmkx]}
     fi
    zle reset-prompt
    zle -R
}

function zle-keymap-select {
    powerlevel9k_prepare_prompts
    zle reset-prompt
    zle -R
}

zle -N zle-line-init
zle -N ale-line-finish
zle -N zle-keymap-select

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

alias top='top -o cpu'

alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

export USE_CCACHE=1

export ANDROID_NDK=~/android-ndk-r15c
alias ndk-build=$ANDROID_NDK/ndk-build
