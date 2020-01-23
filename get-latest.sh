#!/bin/bash

rm .zshrc
rm .vimrc
rm Brewfile

cwd=$(pwd)
cd ~
rm Brewfile
brew bundle dump
cd $cwd

cp ~/.zshrc .zshrc
cp ~/.vimrc .vimrc
cp ~/Brewfile Brewfile

