#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Open installers downloaded via brew cask but not yet run
open /usr/local/Caskroom/adobe-creative-cloud/latest
open /usr/local/Caskroom/backblaze/latest
open /usr/local/Caskroom/little-snitch
open /usr/local/Caskroom/oversight

# Remove outdated versions from the cellar
brew cleanup

# Remove app installers
brew cask cleanup

# Add login items
loginitems -a "Bartender 2"
loginitems -a Flux
loginitems -a Magnet
loginitems -a SlimBatteryMonitor

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
