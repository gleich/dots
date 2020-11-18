"auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Blazing fast autocompletion
    Plug 'kiteco/vim-plugin', { 'as': 'kite.vim' }
    " Code time tracking
    Plug 'wakatime/vim-wakatime'
    " Autoremove whitespace from files
    Plug 'bronson/vim-trailing-whitespace'
    " Auto completion
    Plug 'dense-analysis/ale'
    " Golang Support
    Plug 'fatih/vim-go'
    " Minimap
    Plug 'wfxr/minimap.vim'
    " Language server
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Smooth Scrolling
    Plug 'psliwka/vim-smoothie'
    " Improved spell check
    Plug 'kamykn/spelunker.vim'
    " Auto pairs for '(', '[', and '{'
    Plug 'jiangmiao/auto-pairs'
    " Improved status/tabline
    Plug 'vim-airline/vim-airline'
    " Tabs for nerdtree
    Plug 'jistr/vim-nerdtree-tabs'
    " Sick icon
    Plug 'ryanoasis/vim-devicons'
    " Hex color coloring
    Plug 'norcalli/nvim-colorizer.lua'
    " gruvbox theme
    Plug 'morhetz/gruvbox'

call plug#end()

