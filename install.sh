#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Open installers downloaded via brew cask but not yet run
open /usr/local/Caskroom/adobe-creative-cloud/latest
open /usr/local/Caskroom/little-snitch
open /usr/local/Caskroom/oversight

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

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
