-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })

-- quick quit using
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "quit" })

-- quick save using
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "write" })

-- quick save and quit
vim.keymap.set("n", "<leader>s", "<cmd>wq<cr>", { desc = "write and quit" })

-- copy all of the lines in the current file
vim.keymap.set("n", "<leader>ca", "<cmd>%y+<cr>", { desc = "Copy all lines to clipboard" })
