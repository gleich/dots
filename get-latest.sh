#!/bin/bash

# Removing repo copy folders
rm -rf zsh
rm -rf vim
rm -rf homebrew
rm -rf flutter

# Making new folders
mkdir zsh
mkdir vim
mkdir homebrew
mkdir flutter
mkdir git

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
