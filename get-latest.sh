#!/bin/bash

# Removing repo copy folders
rm -rf zsh
rm -rf vim
rm -rf homebrew/Brewfile
rm -rf flutter
rm -rf VSCode

# Making new folders
mkdir zsh
mkdir vim
mkdir flutter
mkdir VSCode

# Generating Brewfile
cwd=$(pwd)
cd ~
rm -rf Brewfile
brew bundle dump --describe
cd $cwd

# Copying files to repo
cp ~/.zshrc ./zsh/.zshrc
cp ~/.vimrc ./vim/.vimrc
cp ~/Brewfile ./homebrew/Brewfile
cp ~/.flutter_settings ./flutter/.flutter_settings
cp ~/Library/Application' 'Support/Code/User/settings.json ./VSCode/settings.json
