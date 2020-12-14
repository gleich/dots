source ~/.config/nvim/plugins/plugins.vim
source ~/.config/nvim/settings.vim

for fpath in split(globpath('~/.config/nvim/plugins/settings/', '*.vim'), '\n')
  exe 'source' fpath
endfor
