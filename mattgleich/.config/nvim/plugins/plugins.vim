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
    " Improved spell check
    Plug 'kamykn/spelunker.vim'
    " Improved status/tabline
    Plug 'vim-airline/vim-airline'
    " gruvbox theme
    Plug 'morhetz/gruvbox'
    " LaTeX support
    Plug 'lervag/vimtex'
    " Improved startup menu
    Plug 'mhinz/vim-startify'
    " Ranger in neovim
    Plug 'francoiscabrol/ranger.vim'
    " Popup instead of new buffer
    Plug 'kamykn/popup-menu.nvim'
    " Show git changes in the gutter
    Plug 'airblade/vim-gitgutter'
    " Built in fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Asynchronous Lint Engine
    Plug 'dense-analysis/ale'
    " Intellisense for a LSP
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Indentation lines
    Plug 'Yggdroot/indentLine'
    " Color display for CSS RGB or regular hex values
    Plug 'gko/vim-coloresque'

    " Discord rich presense
    " Plug 'hugolgst/vimsence'

call plug#end()
