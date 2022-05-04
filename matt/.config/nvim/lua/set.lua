local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.hlsearch = false
set.incsearch = false
set.ignorecase = true
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.fileencoding = 'utf-8'
set.termguicolors = true
set.number = true
set.hidden = true
set.backupcopy = 'yes'
set.errorbells = false
set.autoindent = true
set.lazyredraw = true
set.updatetime = 300
set.signcolumn = 'yes'
set.undodir = '/Users/matt/.vim/undoir/'
set.undofile = true
set.spelllang = 'en'
set.spellsuggest = 'best,9'
set.swapfile = false
set.cursorline = true
set.cursorlineopt = 'number'
set.showmode = false
set.backup = false
set.spell = true

vim.cmd('let g:tex_flavor=\'latex\'')
vim.cmd('let g:go_highlight_build_constraints = 1')
vim.cmd('let g:go_highlight_extra_types = 1')
vim.cmd('let g:go_highlight_fields = 1')
vim.cmd('let g:go_highlight_functions = 1')
vim.cmd('let g:go_highlight_methods = 1')
vim.cmd('let g:go_highlight_operators = 1')
vim.cmd('let g:go_highlight_structs = 1')
vim.cmd('let g:go_highlight_function_calls = 1')
vim.cmd('let g:go_highlight_operators = 1')
vim.cmd('let g:go_highlight_types = 1')

vim.cmd('let g:vim_svelte_plugin_load_full_syntax = 1')

vim.cmd('let g:user_emmet_leader_key=\'<C-Z>\'')

