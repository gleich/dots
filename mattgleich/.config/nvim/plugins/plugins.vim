call plug#begin('~/.config/nvim/autoload/plugged')

    """""""""""
    " General "
    """""""""""

        " Code time tracking
            Plug 'wakatime/vim-wakatime'
        " Improved spell check
            Plug 'kamykn/spelunker.vim'
        " Show git changes in the gutter
            Plug 'airblade/vim-gitgutter'
        " Quoting/Parenthesizing made simple
            Plug 'tpope/vim-surround'
        " Tree explorer
            Plug 'scrooloose/nerdtree'
        " Snippets
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'

    """"""""""""""
    " Formatting "
    """"""""""""""

        " Color display for CSS RGB or regular hex values
            Plug 'gko/vim-coloresque'

    """"""""""""""""""""
    " Language Support "
    """"""""""""""""""""

        " Asynchronous Lint Engine
            Plug 'dense-analysis/ale'
        " Intellisense for a LSP
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " LaTeX support
            Plug 'lervag/vimtex'
        " Golang Support
            Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        " Blazing fast autocompletion
            Plug 'kiteco/vim-plugin', { 'as': 'kite.vim' }
        " Auto pairs for '(' '[' '{'
            Plug 'jiangmiao/auto-pairs'

    """"""""""
    " Themes "
    """"""""""

        " gruvbox theme
            Plug 'morhetz/gruvbox'
        " Improved status/tabline
            Plug 'vim-airline/vim-airline'
        " Improved startup menu
            Plug 'mhinz/vim-startify'
        " Popup instead of new buffer
            Plug 'kamykn/popup-menu.nvim'
        " Sick icons
            Plug 'ryanoasis/vim-devicons'
        " Themes for vim-airline
            Plug 'vim-airline/vim-airline-themes'


    """""""""""
    " Retired "
    """""""""""

        " Discord rich presense
        " Plug 'hugolgst/vimsence'

call plug#end()
