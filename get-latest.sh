#!/bin/bash

echo Removing current copied folders
rm -rf zsh
rm -rf vim
rm -rf homebrew/Brewfile
rm -rf flutter
rm -rf VSCode
rm -rf macos
rm -rf jrnl
rm -rf hyper
rm -rf alacritty
rm -rf nuke
rm -rf npm

echo Making the new folders
mkdir zsh
mkdir vim
mkdir flutter
mkdir VSCode
mkdir macos
mkdir jrnl
mkdir hyper
mkdir alacritty
mkdir nuke
mkdir npm

echo Generating brew file
cwd=$(pwd)
cd ~
rm -rf Brewfile
brew bundle dump --describe
cd $cwd

echo Generating shortcuts plist
touch macos/shortcuts.plist
shortcuts read --as-plist >> macos/shortcuts.plist

echo Generating global npm package list
touch npm/packages.txt
npm list -g --depth 0 >> npm/packages.txt

echo Copying files to repo
cp ~/.hyper.js ./hyper/.hyper.js
cp ~/.zshrc ./zsh/.zshrc
cp ~/.p10k.zsh ./zsh/.p10k.zsh
cp ~/.vimrc ./vim/.vimrc
cp ~/Brewfile ./homebrew/Brewfile
cp ~/.flutter_settings ./flutter/.flutter_settings
cp ~/.config/jrnl/jrnl.yaml ./jrnl/.jrnl.yaml
cp ~/Library/Application' 'Support/Code/User/settings.json ./VSCode/settings.json
cp ~/.config/alacritty/alacritty.yml ./alacritty/alacritty.yml
cp ~/.config/nuke/config.yml ./nuke/config.yml

# Removing generated files
echo Removing generated files
rm ~/Brewfile
