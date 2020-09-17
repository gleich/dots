#!/bin/bash

echo Removing current copied folders
rm -rf zsh
rm -rf vim
rm -rf homebrew/Brewfile
rm -rf flutter
rm -rf vscode
rm -rf macos
rm -rf jrnl
rm -rf hyper
rm -rf alacritty
rm -rf nuke
rm -rf npm
rm -rf taskwarrior
rm -rf nuke
rm -rf phoenix
rm -rf neofetch
rm -rf bashtop
rm -rf eDEX-UI

echo Making the new folders
mkdir zsh
mkdir vim
mkdir flutter
mkdir vscode
mkdir macos
mkdir jrnl
mkdir hyper
mkdir alacritty
mkdir npm
mkdir taskwarrior
mkdir nuke
mkdir phoenix
mkdir neofetch
mkdir bashtop
mkdir eDEX-UI

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

echo Generating list of vscode extensions
touch vscode/extensions.txt
code --list-extensions >> vscode/extensions.txt

echo Copying files to repo
cp ~/.hyper.js ./hyper/.hyper.js
cp ~/.zshrc ./zsh/.zshrc
cp ~/.zprofile ./zsh/.zprofile
cp ~/.p10k.zsh ./zsh/.p10k.zsh
cp ~/.vimrc ./vim/.vimrc
cp ~/Brewfile ./homebrew/Brewfile
cp ~/.flutter_settings ./flutter/.flutter_settings
cp ~/.config/jrnl/jrnl.yaml ./jrnl/.jrnl.yaml
cp ~/Library/Application' 'Support/Code/User/settings.json ./vscode/settings.json
cp ~/.config/alacritty/alacritty.yml ./alacritty/alacritty.yml
cp ~/.taskrc ./taskwarrior/.taskrc
cp ~/.config/nuke/config.yml ./nuke/config.yml
cp ~/.phoenix.js ./phoenix/.phoenix.js
cp ~/.config/neofetch/config.conf ./neofetch/config.conf
cp ~/.config/bashtop/bashtop.cfg ./bashtop/bashtop.cfg
cp /Users/matthewgleich/Library/Application' 'Support/eDEX-UI/settings.json ./eDEX-UI/settings.json


# Removing generated files
echo Removing generated files
rm ~/Brewfile
