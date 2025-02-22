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
vim.opt.updatetime = 50

-- decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- save undo history
vim.opt.undofile = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- display certain whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- preview substitutions
vim.opt.inccommand = "split"

-- min number of screen lines to keep above and below cursor
vim.opt.scrolloff = 10

-- a tab character appears as 4 spaces wide
vim.opt.tabstop = 4

-- indentation uses 4 spaces per level
vim.opt.shiftwidth = 4

-- editing operations treat a tab as 4 spaces
vim.opt.softtabstop = 4

-- disable mouse support
vim.opt.mouse = ""

-- disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- enable undo directory
vim.undodir = os.getenv("HOME") .. "/.vim/undoir"
vim.opt.undofile = true

-- enable extra color support
vim.opt.termguicolors = true

-- enable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
