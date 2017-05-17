#!/usr/bin/env bash

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

while read p; do
    echo "Installing $p"
    brew cask install $p
done <casks.txt
