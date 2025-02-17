-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "clear highlights" })

-- quick quit using
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = "quit" })

-- quick save using
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = "write" })
--
-- quick save and quit
vim.keymap.set('n', '<leader>s', '<cmd>wq<CR>', { desc = "write and quit" })
