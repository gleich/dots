" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" nerdtree
let mapleader = ' '
nmap <leader>ne :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeWinPos='right'
let NERDTreeShowHidden = 1

" spelunker
set nospell
let g:spelunker_disable_uri_checking = 1
let g:spelunker_disable_email_checking = 1
let g:spelunker_disable_acronym_checking = 1

" snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'

" ale
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

" tokyonight
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

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
let g:go_auto_type_info = 1

" startify
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   🌲 Files:']                        },
          \ { 'type': 'dir',       'header': ['   🌲 Current Dir: '. getcwd()]       },
          \ { 'type': 'sessions',  'header': ['   🌲 Sessions:']                     },
          \ { 'type': 'bookmarks', 'header': ['   🌲 Bookmarks:']                    },
          \ ]
let g:startify_custom_header = startify#pad(split(system('CAT ~/.config/nvim/vim.ascii'), '\n'))

" vim-tex
let g:tex_fast=''
let g:tex_no_error=1
let g:Tex_IgnoredWarnings =
    \''."\n".
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Reference %.%# undefined'."\n".
    \'LaTeX Warning: Reference'."\n".
    \'Foreign command %.%#'."\n"
let g:Tex_IgnoreLevel = 11
