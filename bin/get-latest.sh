cd ..
cwd=$(pwd)

#----------------------------
echo Removing head folders
rm -rf ./.config/
rm -rf ./packages/
rm -rf ./mattgleich/

#----------------------------
echo Creating head folders
mkdir ./.config/
mkdir ./packages/
mkdir ./mattgleich/

#----------------------------
echo Making folders
mkdir ./.config/alacritty/
mkdir ./.config/bpytop/
mkdir ./.config/fgh/
mkdir ./.config/nuke/
mkdir ./.config/neofetch/
mkdir ./.config/gh/
mkdir ./.config/jrnl/

mkdir ./packages/homebrew/
mkdir ./packages/npm/
mkdir ./packages/vscode/

mkdir ./mattgleich/.docker/
mkdir ./mattgleich/.kite/
mkdir -p ./mattgleich/Pictures/Wallpaper/
mkdir -p ./mattgleich/Library/Application\ Support/eDEX-UI/
mkdir -p ./mattgleich/Library/Application\ Support/Code/User/

#----------------------------
echo Generating homebrew package lists
cd ./packages/homebrew/
brew bundle dump --describe --file=Brewfile
cd $cwd

#----------------------------
echo Copying over files from ~/.config
cp ~/.config/alacritty/.alacritty.yml ./.config/alacritty/.alacritty.yml
cp ~/.config/bpytop/bpytop.conf       ./.config/bpytop/bpytop.conf
cp ~/.config/fgh/config.yaml          ./.config/fgh/config.yaml
cp ~/.config/nuke/config.yml          ./.config/nuke/config.yml
cp ~/.config/neofetch/config.conf     ./.config/neofetch/config.conf
cp ~/.config/gh/config.yml            ./.config/gh/config.yml
cp ~/.config/jrnl/jrnl.yaml           ./.config/jrnl/jrnl.yaml

#----------------------------
echo Generating global npm package list
npm list -g --depth 0 >> ./packages/npm/packages.txt

#----------------------------
echo Generating list of vscode extensions
code --list-extensions >> ./packages/vscode/extensions.txt

#----------------------------
echo Copying over files from ~
cp ~/.gitconfig                                              ./mattgleich/.gitconfig
cp ~/.zshrc                                                  ./mattgleich/.zshrc
cp ~/.zprofile                                               ./mattgleich/.zprofile
cp ~/.vimrc                                                  ./mattgleich/.vimrc
cp ~/.phoenix.js                                             ./mattgleich/.phoenix.js
cp ~/.p10k.zsh                                               ./mattgleich/.p10k.zsh
cp ~/.kite/settings.json                                     ./mattgleich/.kite/settings.json
cp ~/.docker/config.json                                     ./mattgleich/.docker/config.json
cp -r ~/Pictures/Wallpaper/                                  ./mattgleich/Pictures/Wallpaper/
cp ~/Library/Application\ Support/eDEX-UI/settings.json      ./mattgleich/Library/Application\ Support/eDEX-UI/settings.json
cp ~/Library/Application\ Support/Code/User/keybindings.json ./mattgleich/Library/Application\ Support/Code/User/keybindings.json
cp ~/Library/Application\ Support/Code/User/settings.json    ./mattgleich/Library/Application\ Support/Code/User/settings.json

