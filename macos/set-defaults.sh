#!/usr/bin/env bash

set -e

####################
# Helper functions #
####################

dock_item() {
	printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>', "$1"
}

############
# Settings #
############

# Dock
defaults write com.apple.dock persistent-apps -array \
	"$(dock_item /Applications/Spark.app)" \
	"$(dock_item /Applications/Slack.app)" \
	"$(dock_item /Applications/Things3.app)" \
	"$(dock_item /Applications/Brave\ Browser.app)" \
	"$(dock_item /Applications/Visual\ Studio\ Code.app)" \
	"$(dock_item /Applications/GitHub\ Desktop.app)" \
	"$(dock_item /Applications/Hyper.app)" \
	"$(dock_item /Applications/Paw.app)" \
	"$(dock_item /Applications/Postico.app)" \
	"$(dock_item /Applications/Dash.app)" \
	"$(dock_item /Applications/Discord.app)" \
	"$(dock_item /Applications/Notion.app)" \
	"$(dock_item /Applications/TweetDeck.app)" \
	"$(dock_item /System/Applications/Music.app)" \
	"$(dock_item /Applications/zoom.us.app)" \
	"$(dock_item /System/Applications/System\ Preferences.app)" 
	

defaults write com.apple.dock persistent-others -array "$(dock_item ~/Downloads)"

defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock autohide -bool false

defaults write com.apple.dock mineffect -string "genie"

defaults write com.apple.dock "mru-spaces" -bool false

# Keyboard
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# Screenshots
mkdir -p "$HOME/Documents/screenshots"
defaults write com.apple.screencapture location -string "$HOME/Documents/screenshots"

# Clock
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\"" 

# Save to iCloud by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "true" 

# Show File Extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Set Desktop Picture
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/System/Library/Desktop Pictures/Monterey Graphic.heic"'

################
# Restart apps #
################

apps=(
	Dock
)

for app in "${apps[@]}"
do
	killall "$app"
done

