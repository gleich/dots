"auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

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
    " Golang Support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
    " The papercolor theme
    Plug 'NLKNguyen/papercolor-theme'
    " Missing motion for vim
    Plug 'justinmk/vim-sneak'
    " Ranger integration
    Plug 'francoiscabrol/ranger.vim'
    " LaTeX support
    Plug 'lervag/vimtex'
    "
    Plug 'mhinz/vim-startify'

call plug#end()

