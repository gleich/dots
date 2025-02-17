-- option configurations for vim

-- show line numbers
vim.wo.number = true

-- leader key configuration
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- nerd font configuration
vim.g.have_nerd_font = true

-- do not show mode as it is already in status line
vim.opt.showmode = false

-- sync clipboard between os and neovim
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- decrease update time
vim.opt.updatetime = 100

-- save undo history
vim.opt.undofile = true
