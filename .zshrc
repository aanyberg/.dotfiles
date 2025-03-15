# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

autoload -Uz compinit && compinit
autoload -U colors && colors
alias ls='ls -G'
alias ll='ls -lAG'

# history
setopt share_history
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# globbing
setopt extended_glob

# zmv
autoload -Uz zmv
alias zcp='zmv -C'
alias zln='zmv -L'

# fewer keystrokes
setopt auto_cd auto_pushd
setopt menu_complete

# fewer distractions
unsetopt beep nomatch notify

precmd() {
    local venv=""
    if [ -n "$VIRTUAL_ENV" ]; then
        venv="($(basename "$VIRTUAL_ENV")) "
    elif [ -n "$HATCH_ENV" ]; then
        venv="($HATCH_ENV) "
    fi

    if [ -d .git ]; then
        PS1="$venv%F{red}%n%F{red}@%m%F{grey} %~%f %F{red}($(git rev-parse --abbrev-ref HEAD 2>/dev/null))%f %F{grey}
>%f "
    else
        PS1="$venv%F{red}%n@%m%F{grey} %~%f %F{grey}
>%f "
    fi
}
