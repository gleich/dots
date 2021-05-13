source ~/.config/nvim/plugins.vim
source ~/.config/nvim/pluginconf.vim

syntax on             " Turn on syntax highlighting
colorscheme blackbird " Set color theme

set number           " Line numbers
set tabstop=4        " Default tab stop
set updatetime=300   " Faster completion
set timeoutlen=500   " By default timeoutlen is 1000 ms
set scrolloff=999    " Always center cursor in screen (at least on large screens)
set relativenumber   " Relative side numbers
set mouse=a          " Turn on mouse mode
set spelllang=en     " Spell check language to English
set termguicolors    " Enable fancy colors
set nohlsearch       " Turn off highlight after search
set noswapfile       " Turn off swap files
set noerrorbells     " Turn off error bells
set ignorecase       " Ignore cases in search
set smartcase        " Allow for custom, case sensitive searches
set nobackup         " Turn off backups
set incsearch        " Show results while searching
set conceallevel=0 " Turn off concealment

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Turn off auto comment insertion

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
