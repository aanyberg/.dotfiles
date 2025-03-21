# Install brew
/bin/bash sudo -v -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew upgrade
brew tap homebrew/cask-versions

# CLI Tools
brew install git
brew install node
brew install pyenv


# Formulae
brew install unixodbc
brew install openssl@1.1
brew install openssl@3
brew install php

# Cask
brew install --cask google-chrome
brew install --cask firefox
brew install --cask linearmouse
brew install --cask fork
brew install --cask mullvadvpn
brew install --cask cryptomator
brew install --cask displaylink
brew install --cask docker
brew install --cask logi-options-plus
brew install --cask transmission
brew install --cask spotify
brew install --cask stats
brew install --cask bettertouchtool
# brew install --cask alfred
brew install --cask raycast
brew install --cask microsoft-teams
brew install --cask microsoft-auto-update
brew install --cask microsoft-office
brew install --cask bitwarden
brew install --cask appcleaner
brew install --cask plex-media-server
brew install --cask teamviewer
brew install --cask figma
brew install --cask visual-studio-code
brew install --cask macfuse
brew install --cask veracrypt
brew install --cask pycharm-ce
brew install --cask rectangle

# Cleanup after install
brew cleanup

echo "Everything is installed. Some apps may require a restart/logout"
