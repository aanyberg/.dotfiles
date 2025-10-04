# --- PATH & env kept light here; heavy stuff in ~/.zprofile ---

# Jira token for commitizen
export JIRA_TOKEN=""

# PYENV (lazy)
export PYENV_ROOT="$HOME/.pyenv"
# Put shims early if present to avoid running pyenv at startup
if [ -d "$PYENV_ROOT/shims" ]; then
  export PATH="$PYENV_ROOT/shims:$PATH"
fi
# Lazy init: first pyenv use does full init
pyenv() {
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  unset -f pyenv
  eval "$(command pyenv init -)"
  pyenv "$@"
}

# TokenUpdater & pipx
export PATH="$PATH:/Users/ANYBER11/TokenUpdater:/Users/ANYBER11/.local/bin"

# Certificates
export SSL_CERT_FILE=/opt/homebrew/etc/openssl@3/cert.pem
export REQUESTS_CA_BUNDLE=/opt/homebrew/etc/openssl@3/cert.pem

# Aliases
alias ls='ls -G'
alias ll='ls -lAG'
alias brew='env PATH="${PATH//${PYENV_ROOT}/shims:/}" brew'

# Completion styles (MUST be before compinit)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%F{reset}'

# fpath before compinit (if you have extra functions)
fpath+=("$HOME/.zfunc")

# Single compinit with cache
autoload -Uz compinit
# ensure cache dir exists
[[ -d ~/.zsh_cache ]] || mkdir -p ~/.zsh_cache
compinit -C -d ~/.zsh_cache/zcompdump

# Colors & options
setopt share_history extended_glob auto_cd auto_pushd menu_complete
unsetopt beep nomatch notify

# history search with arrows
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# zmv
autoload -Uz zmv
alias zcp='zmv -C'
alias zln='zmv -L'

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
zstyle ':completion:*:git:*' group-order 'alias commands' 'main commands' 'external commands'

source <(fzf --zsh)
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"
