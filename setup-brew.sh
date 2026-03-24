# Install brew
/bin/bash sudo -v -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew upgrade
brew tap homebrew/cask-versions

# Cleanup after install
brew cleanup

echo "Everything is installed. Some apps may require a restart/logout"
