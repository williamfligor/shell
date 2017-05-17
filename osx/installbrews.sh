#!/usr/bin/env bash

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Brew cask
brew tap caskroom/cask
brew install cask

brew tap d12frosted/emacs-plus

# Install brew items
brew install macvim --with-cscope --with-lua --override-system-vim
brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
brew install stow
brew install the_silver_searcher
brew install rename
brew install ssh-copy-id
brew install dos2unix
brew install python
brew install python3
brew install unrar
brew install aws-elasticbeanstalk
brew install aspell
brew install wget
brew install awscli
brew install gnu-sed
brew install git-annex
brew install doctl
