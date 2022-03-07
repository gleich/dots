vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

local keymap = vim.api.nvim_set_keymap
-- hjkl for window movement
local opts = { noremap = true }
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
-- follow the leader!
keymap('n', '<leader>q', ':q<cr>', {})
keymap('n', '<leader>w', ':w<cr>', {})

-- packages
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
end)
