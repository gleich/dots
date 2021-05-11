" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" nerdtree
let mapleader = ','
nmap <leader>ne :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1

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
