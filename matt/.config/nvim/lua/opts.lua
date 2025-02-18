-- show line numbers
vim.wo.number = true

-- leader key configuration
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- nerd font configuration
vim.g.have_nerd_font = true

-- do not show mode as it is already in status line
vim.opt.showmode = false

-- decrease update time
vim.opt.updatetime = 100

-- decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- save undo history
vim.opt.undofile = true

-- keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- display certain whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '> ', trail = '·', nbsp = '␣' }

-- preview substitutions
vim.opt.inccommand = 'split'

-- min number of screen lines to keep above and below cursor
vim.opt.scrolloff = 10
