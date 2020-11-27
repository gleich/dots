call plug#begin('~/.config/nvim/autoload/plugged')

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Blazing fast autocompletion
    Plug 'kiteco/vim-plugin', { 'as': 'kite.vim' }
    " Code time tracking
    Plug 'wakatime/vim-wakatime'
    " Autoremove whitespace from files
    Plug 'bronson/vim-trailing-whitespace'
    " Golang Support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Language server
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Improved spell check
    Plug 'kamykn/spelunker.vim'
    " Improved status/tabline
    Plug 'vim-airline/vim-airline'
    " Sick icon
    Plug 'ryanoasis/vim-devicons'
    " Hex color coloring
    Plug 'norcalli/nvim-colorizer.lua'
    " gruvbox theme
    Plug 'morhetz/gruvbox'
    " The papercolor theme
    Plug 'NLKNguyen/papercolor-theme'
    " Missing motion for vim
    Plug 'justinmk/vim-sneak'
    " LaTeX support
    Plug 'lervag/vimtex'
    " Improved startup menu
    Plug 'mhinz/vim-startify'
    " Ranger in neovim
    Plug 'francoiscabrol/ranger.vim'
    " Popup instead of new buffer
    Plug 'kamykn/popup-menu.nvim'

call plug#end()

