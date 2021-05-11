call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'                  " Easy alignment of characters
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server
	Plug 'sheerun/vim-polyglot'                     " Improved language server
	Plug 'ap/vim-css-color'                         " Hex colors displayed
	Plug 'preservim/nerdtree'                       " File tree
	Plug 'voldikss/vim-floaterm'                    " Floating terminal
	Plug 'airblade/vim-gitgutter'                   " Show changes in gutter
	Plug 'mhinz/vim-startify'                       " Improved start page
	Plug 'wakatime/vim-wakatime'                    " Time tracking
	Plug 'fatih/vim-go'                             " Support for the go programming language
	Plug 'ryanoasis/vim-devicons'                   " Nerdfont icons
	Plug 'kamykn/spelunker.vim'                     " Improved spell check
	Plug 'kamykn/popup-menu.nvim'                   " Popup menu instead of new buffer selector
	Plug 'SirVer/ultisnips'                         " Snippet engine
	Plug 'honza/vim-snippets'                       " Snippets
	Plug 'dense-analysis/ale'                       " Formatters
	Plug 'lewis6991/moonlight.vim'                  " Fancy theme
call plug#end()
