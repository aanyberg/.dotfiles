echo "Setting up Zsh..."
sh ./setup-zsh.sh
echo "Setting up Homebrew..."
sh ./setup-brew.sh
echo "Setting up macOS specific settings..."
sh ./setup-macos.sh

echo "Everything is set up! Please restart your terminal."
