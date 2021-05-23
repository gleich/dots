" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" nerdtree
let mapleader = ' '
nmap <leader>n :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeWinPos='right'
let NERDTreeShowHidden = 1
let NERDTreeGitStatusWithFlags = 1

" spelunker
set nospell
let g:spelunker_disable_uri_checking = 1
let g:spelunker_disable_email_checking = 1
let g:spelunker_disable_acronym_checking = 1
let g:spelunker_check_type = 2
let g:spelunker_disable_auto_group = 1
augroup spelunker
  autocmd!
  autocmd CursorHold *.tex,*.md call spelunker#check_displayed_words()
augroup END

" snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'

" vim-go
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

" startify
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   🌲 Files:']                        },
          \ { 'type': 'dir',       'header': ['   🌲 Current Dir: '. getcwd()]       },
          \ { 'type': 'sessions',  'header': ['   🌲 Sessions:']                     },
          \ { 'type': 'bookmarks', 'header': ['   🌲 Bookmarks:']                    },
          \ ]
let g:startify_custom_header = startify#pad(split(system('CAT ~/.config/nvim/vim.ascii'), '\n'))
let g:startify_change_to_dir = 0

" coc
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_mappings_enabled = 0
let g:vimtex_log_ignore = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
        \ 'Token not allowed in a PDF string']
let g:vimtex_matchparen_enabled = 0
set conceallevel=2
let g:tex_conceal='abdmg'

" fzf
nmap <leader>s :GFiles<cr>

" synstack.vim
nmap <leader>p <plug>(SynStack)

" vim-floaterm
let g:floaterm_autoclose = 1
nmap <leader>t :FloatermToggle<cr>

" ale
let g:ale_linters = {
	\ 'markdown': ['null'],
	\ 'vim': ['null'],
	\}
let g:ale_fixers = {
	\ '*': [
		\ 'remove_trailing_lines',
		\ 'trim_whitespace'
	\ ],
	\ 'rust': ['rustfmt'],
	\ 'sh': ['shfmt'],
	\ 'zsh': ['shfmt'],
	\ 'python': ['black'],
	\ 'typescript': ['eslint', 'prettier'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'typescriptreact': ['eslint', 'prettier'],
	\ 'javascriptreact': ['eslint', 'prettier'],
	\ 'css': ['prettier'],
	\ 'less': ['prettier'],
	\ 'scss': ['prettier'],
	\ 'json': ['prettier'],
	\ 'json5': ['prettier'],
	\ 'graphql': ['prettier'],
	\ 'markdown': ['prettier'],
	\ 'html': ['prettier'],
	\ 'yaml': ['prettier'],
	\ 'Dockerfile': ['hadolint'],
	\ 'Dart': ['dartfmt'],
    \ 'java': ['google_java_format']
	\ }
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
