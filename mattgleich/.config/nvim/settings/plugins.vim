" fatih/vim-go
let g:go_def_mapping_enabled = 0 " Have coc manage go to definition
let g:go_gopls_enabled = 0       " Turn off gopls

" justinmk/vim-sneak
let g:sneak#label = 1 " Display switch character

" lervag/vimtex
let g:tex_flavor = 'pdflatex' " Setting the formula type

" kamykn/spelunker.vim
set nospell " Turning off vim's native spell check
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.py,*.Dockerfile,*.go,*.js,*.ts,*.tsx,*.rs call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.json,*.md,*.tex call spelunker#check_displayed_words()
augroup END

" rust-lang/rust.vim
let g:rustfmt_autosave = 1 " Run rustfmt on autosave

" hugolgst/vimsense
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'

" dense-analysis/ale
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_rust_rls_executable = 'rust-analyzer'
let g:ale_linters = {
	\ 'rust': ['rust-analyzer'],
        \ 'go': ['golangci-lint'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'css': ['prettier'],
	\ 'typescript': ['eslint', 'prettier'],
	\ 'scss': ['prettier'],
	\ 'yaml': ['prettier'],
	\ 'graphql': ['eslint', 'prettier'],
	\ 'html': ['prettier'],
	\ 'json': ['prettier'],
	\ 'markdown': ['prettier'],
        \ 'latex': ['chktex', 'lacheck'],
        \ 'Dockerfile': ['hadolint'],
        \ 'Dart': ['dartanalyzer'],
        \ 'Vim': ['vint'],
	\ }
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
        \ 'Dart': ['dartfmt']
	\ }
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--fast -E gofumpt -E unparam -E unconvert -E maligned -E goimports -E godot -E goconst'

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:ale_completion_autoimport = 1
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})
