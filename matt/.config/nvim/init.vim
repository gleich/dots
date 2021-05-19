source ~/.config/nvim/plugins.vim
source ~/.config/nvim/pluginconf.vim

syntax on             " Turn on syntax highlighting
colorscheme blackbird " Set color theme

set number         " Line numbers
set tabstop=4      " Default tab stop
set updatetime=100 " Faster completion
set timeoutlen=500 " By default timeoutlen is 1000 ms
set scrolloff=999  " Always center cursor in screen (at least on large screens)
set relativenumber " Relative side numbers
set spelllang=en   " Spell check language to English
set termguicolors  " Enable fancy colors
set nohlsearch     " Turn off highlight after search
set noswapfile     " Turn off swap files
set noerrorbells   " Turn off error bells
set nobackup       " Turn off backups
set incsearch      " Show results while searching
filetype plugin on " Turn on file detectionp
let &t_ut=''       " Fix kitty output

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Turn off auto comment insertion
