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
	\ 'rust': ['analyzer'],
	\ 'css': ['prettier'],
	\ 'typescript': ['eslint', 'prettier'],
	\ 'scss': ['prettier'],
	\ 'yaml': ['prettier'],
	\ 'graphql': ['eslint', 'prettier'],
	\ 'html': ['prettier'],
	\ 'json': ['prettier'],
	\ 'markdown': ['prettier'],
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
	\ 'Dart': ['dartfmt'],
        \ 'java': ['google_java_format']
	\ }
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_disable_lsp = 1
