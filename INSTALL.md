> For general documentation from upstream, see [README](README.md). What follows are the instructions to setup a new Mac. Hat tip to [Dries Vints](https://github.com/driesvints/dotfiles#driess-dotfiles).

## A Fresh macOS Setup

1. Clean install (or update) of latest macOS via App Store

1. Install macOS Xcode Command Line Tools
   ```sh
   $ xcode-select --install
   ```

1. Copy public and private SSH keys to `~/.ssh` and make sure they're set to 600

1. Add `~/.extra` from secret gist

1. Clone this repo to `~/Desktop/dotfiles`

1. Symlink `~/Desktop/dotfiles` to `~/dotfiles`

1. Start the installation
   ```sh
   $ cd ~/dotfiles
   $ ./install.sh
   ```

1. Run installers downloaded by Homebrew Cask
   > will be revealed in Finder

   * Adobe Creative Cloud
   * Little Snitch
   * Oversight

1. Restart computer

1. Copy dotfiles to home directory
   ```sh
   $ source bootstrap.sh
   ```

1. Make sure Dropbox is set up and synced
   > download & install [Fujitsu ScanSnap](http://www.fujitsu.com/global/support/products/computing/peripheral/scanners/scansnap/software/ix500.html) while waiting

1. Restore preferences via Mackup
   ```sh
   $ mackup restore
   ```

1. Create Dropbox symlinks
   ```sh
   $ ln -s ~/Dropbox/sites /usr/local/sites
   $ ln -s ~/Dropbox/src /usr/local/src
   ```

1. Drop temp clone of this repo and symlink to Dropbox clone
   ```sh
   $ rm -rf ~/Desktop/dotfiles
   $ ln -s /usr/local/src/dotfiles ~/dotfiles
   ```

1. Restart computer to finalize the process

Your Mac is now ready to use!
