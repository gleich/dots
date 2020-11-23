let g:mapleader = "\<Space>"                " set leader key

" General settings
syntax on                                   " Enables syntax highlighting
set guicursor=                              " Just use the GUI cursor
set hidden                                  " Required to keep multiple buffers open
set encoding=utf-8                          " The text encoding
set ruler                                   " Show the cursor position at all times
set smarttab                                " Automatic switching for tab spacing based off document
set autoindent                              " Auto indentation
set number                                  " Display line numbers
set updatetime=300                          " Faster completion
set timeoutlen=500                          " By default timeoutlen is 1000 ms
set so=999                                  " Always center cursor in screen
set scrolloff=5                             " Number of lines around cursor

" Theme
color Papercolor                             " Theme
set background=dark                          " Background color
hi Normal guibg=NONE ctermbg=NONE            " Transparent background
hi LineNr guibg=NONE ctermbg=NONE            " Transparent line number background
hi SignColumn guibg=NONE ctermbg=NONE        " Transparent gutter

