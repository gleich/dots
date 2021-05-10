source ~/.config/nvim/plugins.vim
source ~/.config/nvim/pluginconf.vim

syntax on           " Turn on syntax highlighting
colorscheme gruvbox " Set color theme

set number            " Line numbers
set tabstop=4         " Default tab stop
set updatetime=300    " Faster completion
set timeoutlen=500    " By default timeoutlen is 1000 ms
set scrolloff=999     " Always center cursor in screen (at least on large screens)
set relativenumber    " Relative side numbers
set mouse=a           " Turn on mouse mode
set spelllang=en      " Spell check language to English

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Turn off auto comment insertion

