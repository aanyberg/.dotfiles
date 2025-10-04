# Install brew
/bin/bash sudo -v -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew upgrade
brew tap homebrew/cask-versions

# Formulae
brew install --formulae carapace
brew install --formulae clib
brew install --formulae codex
brew install --formulae e2fsprogs
brew install --formulae fzf
brew install --formulae git
brew install --formulae graphviz
brew install --formulae jfrog-cli
brew install --formulae libxml2
brew install --formulae libxslt
brew install --formulae node
brew install --formulae openssl@3
brew install --formulae php
brew install --formulae pipenv
brew install --formulae pipx
brew install --formulae pkgconf
brew install --formulae pyenv
brew install --formulae repo
brew install --formulae sniffnet
brew install --formulae starship
brew install --formulae tree
brew install --formulae unixodbc
brew install --formulae wget
brew install --formulae xcodegen
brew install --formulae zoxide
brew install --formulae zsh-completions

# Cask
brew install --cask bitwarden-cli
brew install --cask carapace
brew install --cask clib
brew install --cask codex
brew install --cask e2fsprogs
brew install --cask fzf
brew install --cask git
brew install --cask graphviz
brew install --cask imagemagick
brew install --cask jfrog-cli
brew install --cask libxml2
brew install --cask libxslt
brew install --cask node
brew install --cask ollama
brew install --cask openconnect
brew install --cask openssl@3
brew install --cask php
brew install --cask pipenv
brew install --cask pipx
brew install --cask pkgconf
brew install --cask pyenv
brew install --cask python-tk@3.10
brew install --cask python-tk@3.12
brew install --cask repo
brew install --cask sniffnet
brew install --cask starship
brew install --cask tree
brew install --cask unixodbc
brew install --cask wget
brew install --cask xcodegen
brew install --cask zoxide
brew install --cask zsh-completions


# Cleanup after install
brew cleanup

echo "Everything is installed. Some apps may require a restart/logout"
