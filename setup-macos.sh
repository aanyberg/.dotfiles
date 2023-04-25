# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Dock > Show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# System Preferences > Dock > Hide dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.4

# System Preferences > Dock > Autohide-delay (duration)
defaults write com.apple.dock autohide-delay -float 0.3

# System Preferences > Dock > Size
defaults write com.apple.dock tilesize -int 36

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Finder > Preferences > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Show wraning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Show wraning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

defaults write com.apple.finder _FXSortFoldersFirst -bool true

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

echo "Everything is done. Some changes may require a restart/logout"