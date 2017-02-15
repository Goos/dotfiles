# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/goos/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Editor flags
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
  export EDITOR='vim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# vi-mode
bindkey -v
export KEYTIMEOUT=0.4

# Powerline settings
POWERLEVEL9K_MODE='flat'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir)
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
    export TAG_CMD_FMT_STRING='nvim {{.Filename}} +{{.LineNumber}}'
    tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
    alias ag=tag
fi
