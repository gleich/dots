"           __     _      __   _                _
"    ____ _/ /__  (_)____/ /_ ( )_____   _   __(_)___ ___
"   / __ `/ / _ \/ / ___/ __ \|// ___/  | | / / / __ `__ \
"  / /_/ / /  __/ / /__/ / / / (__  )   | |/ / / / / / / /
"  \__, /_/\___/_/\___/_/ /_/ /____/    |___/_/_/ /_/ /_/
" /____/
" Copyright (©) Matthew Gleich 2021 - Please site if you mod this

" _|_ |)    _          _
"  |  |/\  |/ /|/|/|  |/
"  |_/|  |/|_/ | | |_/|_/
" Theme 🎨

syntax on             " Turn on syntax highlighting
colorscheme blackbird " Set color theme

"  _,  _        _  ,_   _,  |\
" / | |/ /|/|  |/ /  | / |  |/
" \/|/|_/ | |_/|_/   |/\/|_/|_/
"  (|
" General ⚙️

set tabstop=4             " Default tab stop
set updatetime=50         " Faster completion
set timeoutlen=500        " By default timeoutlen is 1000 ms
set spelllang=en          " Spell check language to English
set termguicolors         " Enable gui colors
set nohlsearch            " No longer show search results after search
set noswapfile            " Turn off swap files
set noerrorbells          " Turn off error bells
set nobackup              " Turn off backups
set nowritebackup         " Turn off write backups
set incsearch             " Show results while searching
set smartcase             " Have searches use smartcases
filetype plugin on        " Turn on file detection
let &t_ut=''              " Fix kitty output
set shortmess+=c          " Don't pass messages to |ins-completion-menu|.
set cmdheight=2           " Give more space for displaying messages.
set hidden                " TextEdit might fail if hidden is not set.
set encoding=utf-8        " Ensure encoding is utf 8
set scrolloff=5           " Add bottom padding of 5 lines
set noshowmode            " Don't show the vim mode at the bottom of the screen
set undodir=~/.vim/undoir " Where to store undo files
set undofile              " Make undo files
set lazyredraw            " Make redraw faster
set autoindent            " Try to autoindent
set statusline=%#StatusLineMode#\ %{toupper(mode())}\ %#StatusLine#\ %t\ %m " Custom status line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o      " Turn off auto comment insertion

"          _,   _   ,_   _   ,
" /|/|/|  / |  /   /  | / \_/ \_
"  | | |_/\/|_/\__/   |/\_/  \/
" Macros 🔩

let @c = 'dawvU'            " Make the word after the current word the start of the sentence
let @n = 'jjoSitemn	' " Add itemn to next parent item (latex)

"  ,_   _          _,       ,
" /  | |/ /|/|/|  / |  |/\_/ \_
"    |/|_/ | | |_/\/|_/|_/  \/
"                     (|
" Remappings 🍁

nmap <leader>a :%y+<cr>
nmap <leader>b :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader>c :e ~/.config/nvim/init.vim<cr>
nmap <leader>u :UltiSnipsEdit<cr>
nmap <leader>k :call spelunker#check_displayed_words()<cr>
nmap <leader>l :NERDTreeFocus<cr>
nmap <leader>n :NERDTreeToggle<cr>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <leader>s :FZF<cr>
nmap <leader>p <plug>(SynStack)
nmap <leader>t :FloatermToggle<cr>
nmap <leader>r *:%s///g<left><left>
nmap <leader>rg :Rg<cr>
nmap <leader><down> <C-w><down>
nmap <leader><up> <C-w><up>
nmap <leader><left> <C-w><left>
nmap <leader><right> <C-w><right>

"     |\        _, o        ,
"  |/\_|/ |  |  / | | /|/|  / \_
"  |_/ |_/ \/|_/\/|/|/ | |_/ \/
" (|             (|
" Plugins 🔌

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-easy-align'                      " 📐 Easy alignment of characters
	Plug 'sheerun/vim-polyglot'                         " 📜 Improved language server
	Plug 'ap/vim-css-color'                             " 🌈 Hex colors displayed
	Plug 'preservim/nerdtree'                           " 📂 File tree
	Plug 'voldikss/vim-floaterm'                        " 📟 Floating terminal
	Plug 'airblade/vim-gitgutter'                       " ☁️ Show changes in gutter
	Plug 'mhinz/vim-startify'                           " 🚀 Improved start page
	Plug 'wakatime/vim-wakatime'                        " ⏰ Time tracking
	Plug 'fatih/vim-go'                                 " 🫐 Support for the go programming language
	Plug 'SirVer/ultisnips'                             " ✂️ Snippet engine
	Plug 'honza/vim-snippets'                           " ✂️ Snippets
	Plug 'tpope/vim-surround'                           " 🏄 Fancy surround commands
	Plug 'tpope/vim-commentary'                         " 💬 Comment out a line easily
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 🗄️ Fast file search
	Plug 'junegunn/fzf.vim'                             " 🗄️ Fast file search
	Plug 'ryanoasis/vim-devicons'                       " 💡 Fancy file icons
	Plug 'lervag/vimtex'                                " ⚗️ LaTeX support for vim
	Plug 'dylnmc/synstack.vim'                          " 🎨 Easily show syntax highlighting group under current cursor
	Plug 'neoclide/coc.nvim', {'branch': 'release'}     " 🌹 Language server
	Plug 'kamykn/spelunker.vim'                         " 💬 Improved spell check
	Plug 'kamykn/popup-menu.nvim'                       " 🍿 Popup menu instead of new buffer selector
	Plug 'tpope/vim-fugitive'                           " ♟️ Git commands from vim
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " ✍️ Markdown previewing
call plug#end()

"      |\        _, o           _   _        |\ o  _,
"  |/\_|/ |  |  / | | /|/|     /   / \_/|/|  |/ | / |
"  |_/ |_/ \/|_/\/|/|/ | |_/   \__/\_/  | |_/|_/|/\/|/
" (|             (|                          |)    (|
" Plugin Configuration ⚗️

" preservim/nerdtree  ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
let NERDTreeMinimalUI = 1
let NERDTreeWinPos ='right'
let NERDTreeShowHidden = 1
let NERDTreeGitStatusWithFlags = 1
let NERDTreeIgnore = ['.DS_Store']
" kamykn/spelunker.vim ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
set nospell
let g:spelunker_disable_uri_checking = 1
let g:spelunker_disable_email_checking = 1
let g:spelunker_disable_acronym_checking = 1
let g:spelunker_check_type = 2
let g:spelunker_disable_auto_group = 1
augroup spelunker
  autocmd!
augroup END
" SirVer/ultisnips ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'vertical'
" fatih/vim-go ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
" mhinz/vim-startify ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   🌲 Files:']                        },
          \ { 'type': 'dir',       'header': ['   🌲 Current Dir: '.getcwd()]        },
          \ { 'type': 'sessions',  'header': ['   🌲 Sessions:']                     },
          \ { 'type': 'bookmarks', 'header': ['   🌲 Bookmarks:']                    },
          \ ]
let g:startify_custom_header = startify#pad(split(system('CAT ~/.config/nvim/vim.ascii'), '\n'))
let g:startify_change_to_dir = 0
" lervag/vimtex ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_mappings_enabled = 0
let g:vimtex_log_ignore = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
        \ 'Token not allowed in a PDF string']
let g:vimtex_matchparen_enabled = 0
" junegunn/fzf ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" voldikss/vim-floaterm ╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼╾╼
let g:floaterm_autoclose = 1
