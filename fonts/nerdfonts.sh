#!/bin/bash
set -e

if [[ `uname` == 'Darwin' ]]; then
    brew tap caskroom/fonts
    brew cask install font-sourcecodepro-nerd-font
else
    mkdir /tmp/nerdfonts
    cd /tmp/nerdfonts
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts
    ./install.sh SourceCodePro
fi
