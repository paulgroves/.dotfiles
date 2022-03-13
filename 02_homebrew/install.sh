#!/usr/bin/env bash

set -e

brew update

(cd ~/.dotfiles/02_homebrew && brew bundle --file Brewfile)

brew upgrade

brew cleanup
