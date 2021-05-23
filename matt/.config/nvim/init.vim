source ~/.config/nvim/plugins.vim
source ~/.config/nvim/pluginconf.vim

syntax on             " Turn on syntax highlighting
colorscheme blackbird " Set color theme

set number         " Line numbers
set tabstop=4      " Default tab stop
set updatetime=50  " Faster completion
set timeoutlen=500 " By default timeoutlen is 1000 ms
set relativenumber " Relative side numbers
set spelllang=en   " Spell check language to English
set termguicolors  " Enable fancy colors
set nohlsearch     " Turn off highlight after search
set noswapfile     " Turn off swap files
set noerrorbells   " Turn off error bells
set nobackup       " Turn off backups
set nowritebackup  " Turn off write backups
set incsearch      " Show results while searching
filetype plugin on " Turn on file detectionp
let &t_ut=''       " Fix kitty output
set shortmess+=c   " Don't pass messages to |ins-completion-menu|.
set cmdheight=2    " Give more space for displaying messages.
set hidden         " TextEdit might fail if hidden is not set.
set encoding=utf-8 " Ensure encoding is utf 8
set scrolloff=5    " Add bottom padding of 5 lines

set statusline=\ λ\ %f%m\ 🌲\ LNS:\ %L\ PCT:\ %%%p\ COL:\ %v\ %=\ %{strftime('%c')} " Custom status line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o      " Turn off auto comment insertion
