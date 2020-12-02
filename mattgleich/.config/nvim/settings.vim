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
set scrolloff=999                           " Always center cursor in screen
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab " Default tab length
set guifont=Fira\ Code\ iScript:h12         " Setting the font

" Theme
let g:gruvbox_italics = 1                    " Turning on italics
colorscheme gruvbox                          " Setting theme
set background=dark                          " Background color
hi Normal guibg=NONE ctermbg=NONE            " Transparent background
hi LineNr guibg=NONE ctermbg=NONE            " Transparent line number background
hi SignColumn guibg=NONE ctermbg=NONE        " Transparent gutter

" Key mapping
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
