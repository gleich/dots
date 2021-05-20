call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'                      " Easy alignment of characters
	Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Language server
	Plug 'sheerun/vim-polyglot'                         " Improved language server
	Plug 'ap/vim-css-color'                             " Hex colors displayed
	Plug 'preservim/nerdtree'                           " File tree
	Plug 'voldikss/vim-floaterm'                        " Floating terminal
	Plug 'airblade/vim-gitgutter'                       " Show changes in gutter
	Plug 'mhinz/vim-startify'                           " Improved start page
	Plug 'wakatime/vim-wakatime'                        " Time tracking
	Plug 'fatih/vim-go'                                 " Support for the go programming language
	Plug 'SirVer/ultisnips'                             " Snippet engine
	Plug 'honza/vim-snippets'                           " Snippets
	Plug 'tpope/vim-surround'                           " Fancy surround commands
	Plug 'tpope/vim-commentary'                         " Comment out a line easily
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fast file search
	Plug 'junegunn/fzf.vim'                             " Fast file search
	Plug 'Matt-Gleich/blackbird.vim'                    " The best theme around
	Plug 'ryanoasis/vim-devicons'                       " Fancy file icons
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " Colored nerdtree
	Plug 'tpope/vim-fugitive'                           " Git commands inside vim
	Plug 'lervag/vimtex'                                " LaTeX support for vim
	Plug 'mattn/emmet-vim'                              " Emmet for vim
	Plug 'dylnmc/synstack.vim'                          " Easily show syntax highlighting group under current cursor
	Plug 'junegunn/goyo.vim'                            " Focused writing mode
	Plug 'sbdchd/neoformat'                             " Formatters

	" Markdown preview plugin
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()
