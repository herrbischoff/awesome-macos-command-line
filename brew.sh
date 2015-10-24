#!/usr/bin/env bash

###############################################################################
# Install command-line tools using Homebrew                                   #
###############################################################################

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s $(brew --prefix)/bin/gsha256sum $(brew --prefix)/bin/sha256sum

# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Install `wget` with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install archivers
brew install p7zip
brew install pigz
brew install pixz
brew install unrar
brew install xz

# Install other useful binaries
brew install aria2
brew install dark-mode
brew install git
brew install git-lfs
brew install htop
brew install pv
brew install speedtest_cli
brew install tmux
brew install tree

# Remove outdated versions from the cellar
brew cleanup
