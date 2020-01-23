#!/bin/bash

# Removing repo copy folders
rm -rf zsh
rm -rf vim
rm -rf homebrew
rm -rf flutter
rm -rf git

# Making new folders
mkdir zsh
mkdir vim
mkdir homebrew
mkdir flutter
mkdir git
mkdir git/gitkraken

# Generating Brewfile
cwd=$(pwd)
cd ~
rm Brewfile
brew bundle dump
cd $cwd

# Copying files to repo
cp ~/.zshrc ./zsh/.zshrc
cp ~/.vimrc ./vim/.vimrc
cp ~/Brewfile ./homebrew/Brewfile
cp ~/.flutter_settings ./flutter/.flutter_settings
cp ~/.gitkraken/profiles/d6e5a8ca26e14325a4275fc33b17e16f/profile ./git/gitkraken/profile
