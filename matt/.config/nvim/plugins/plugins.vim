call plug#begin('~/.config/nvim/autoload/plugged')

    """""""""""
    " General "
    """""""""""

        " Code time tracking
            Plug 'wakatime/vim-wakatime'
        " Improved spell check
            Plug 'kamykn/spelunker.vim'
        " Grammar checker
            Plug 'dpelle/vim-LanguageTool'
        " Snippets
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
        " fzf for vim
            Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
            Plug 'junegunn/fzf.vim'
        " Floating Termial
            Plug 'voldikss/vim-floaterm'
        " File tree for vim
            Plug 'preservim/nerdtree'

    """""""
    " Git "
    """""""

        " Run git commands
            Plug 'tpope/vim-fugitive'
        " Show git changes
            Plug 'mhinz/vim-signify'

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
        " Auto pairs for '(' '[' '{'
            Plug 'jiangmiao/auto-pairs'
        " Improved JavaScript support
            Plug 'pangloss/vim-javascript'
        " Improved syntax highlighting
            Plug 'sheerun/vim-polyglot'
        " LaTeX concealment
            Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

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
        " hyper theme
            Plug 'jdsimcoe/hyper.vim'
        " moonlight theme
            Plug 'lewis6991/moonlight.vim'

    """""""""""
    " Retired "
    """""""""""

        " Discord rich presense
            " Plug 'hugolgst/vimsence'

call plug#end()
