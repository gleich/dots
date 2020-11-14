rm -rf /Users/mattgleich/github/Matt-Gleich/public/Shell/dots/mattgleich

#----------------------------
echo Creating head folders
mkdir /Users/mattgleich/github/Matt-Gleich/public/Shell/dots/mattgleich
cd /Users/mattgleich/github/Matt-Gleich/public/Shell/dots/mattgleich
mkdir ./.config/
mkdir ./packages/

#----------------------------
echo Making folders
mkdir ./.config/alacritty/
mkdir ./.config/fgh/
mkdir ./.config/nuke/
mkdir ./.config/neofetch/
mkdir ./.config/gh/
mkdir ./.config/jrnl/
mkdir ./.config/iTerm2/
mkdir ./.config/alfred/
mkdir ./.config/StardewValley/
mkdir ./.config/cava/
mkdir ./.config/ranger/
mkdir ./.config/nvim/
mkdir ./.config/texsch/
mkdir ./.config/omf/
mkdir ./.config/zsh/
mkdir -p ./.config/vis/colors/
mkdir -p ./.config/bpytop/themes/

mkdir ./packages/homebrew/
mkdir ./packages/npm/
mkdir ./packages/vscode/

mkdir ./.docker/
mkdir ./.kite/
mkdir -p ./Pictures/Wallpaper/
mkdir -p ./Library/Application\ Support/eDEX-UI/
mkdir -p ./Library/Application\ Support/Code/User/
mkdir -p ./Library/Developer/Xcode/UserData/KeyBindings/
mkdir -p ./Library/Developer/Xcode/UserData/FontAndColorThemes/
mkdir -p ./Library/Preferences/gitmoji-nodejs/
mkdir -p ./Documents/Zwift/

#----------------------------
echo Generating homebrew package list
cd ./packages/homebrew/
brew bundle dump --describe --file=Brewfile
cd ../..

#----------------------------
echo Copying over files from ~/.config
cp ~/.config/bpytop/bpytop.conf                ./.config/bpytop/bpytop.conf
cp ~/.config/fgh/config.yaml                   ./.config/fgh/config.yaml
cp ~/.config/gh/config.yml                     ./.config/gh/config.yml
cp ~/.config/cava/config                       ./.config/cava/config
cp ~/.config/vis/config                        ./.config/vis/config

cp -r ~/.config/jrnl/                          ./.config/jrnl/
cp -r ~/.config/alfred/                        ./.config/alfred/
cp -r ~/.config/neofetch/                      ./.config/neofetch/
cp -r ~/.config/nuke/                          ./.config/nuke/
cp -r ~/.config/bpytop/themes/                 ./.config/bpytop/themes/
cp -r ~/.config/alacritty/                     ./.config/alacritty/
cp -r ~/.config/iTerm2/                        ./.config/iTerm2/
cp -r ~/.config/ranger/                        ./.config/ranger/
cp -r ~/.config/nvim/                          ./.config/nvim/
cp -r ~/.config/texsch/                        ./.config/texsch/
cp -r ~/.config/omf/                           ./.config/omf/
cp -r ~/.config/vis/colors/                    ./.config/vis/colors/
cp -r ~/.config/zsh/                           ./.config/zsh/

xmllint --format ~/.config/StardewValley/startup_preferences >> ./.config/StardewValley/startup_preferences
rm -rf ./.config/nvim/autoload/

#----------------------------
echo Generating global npm package list
npm list -g --depth 0 >> ./packages/npm/packages.txt

#----------------------------
echo Generating list of vscode extensions
code --list-extensions >> ./packages/vscode/extensions.txt

#----------------------------
echo Copying over files from ~
cp ~/.gitconfig                                              ./.gitconfig
cp ~/.zshrc                                                  ./.zshrc
cp ~/.zprofile                                               ./.zprofile
cp ~/.profile                                                ./.profile
cp ~/.vimrc                                                  ./.vimrc
cp ~/.p10k.zsh                                               ./.p10k.zsh
cp ~/.kite/settings.json                                     ./.kite/settings.json
cp ~/.docker/config.json                                     ./.docker/config.json
cp ~/Library/Application\ Support/eDEX-UI/settings.json      ./Library/Application\ Support/eDEX-UI/settings.json
cp ~/Library/Application\ Support/Code/User/keybindings.json ./Library/Application\ Support/Code/User/keybindings.json
cp ~/Library/Application\ Support/Code/User/settings.json    ./Library/Application\ Support/Code/User/settings.json
cp ~/Documents/Zwift/prefs.xml                               ./Documents/Zwift/prefs.xml
cp -r ~/Pictures/Wallpaper/                                  ./Pictures/Wallpaper/
cp -r ~/Library/Developer/Xcode/UserData/KeyBindings/        ./Library/Developer/Xcode/UserData/KeyBindings/
cp -r ~/Library/Developer/Xcode/UserData/FontAndColorThemes/ ./Library/Developer/Xcode/UserData/FontAndColorThemes/
cp -r ~/Library/Preferences/gitmoji-nodejs/                  ./Library/Preferences/gitmoji-nodejs/

