-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })

-- quick quit using
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "quit" })

-- copy all of the lines in the current file
vim.keymap.set("n", "<leader>ca", "<cmd>%y+<cr>", { desc = "Copy all lines to clipboard" })

-- move splits with ctrl+arrow_key
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "move to window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "move to window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "move to window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "move to window right" })

-- create splits with ctrl+arrow_key and switch focus to the new split
vim.keymap.set("n", "<leader>w", "<cmd>aboveleft split | wincmd w<CR>", { desc = "open split above and move" })
vim.keymap.set("n", "<leader>s", "<cmd>belowright split | wincmd w<CR>", { desc = "open split below and move" })
vim.keymap.set("n", "<leader>d", "<cmd>leftabove vsplit | wincmd w<CR>", { desc = "open vertical split left and move" })
vim.keymap.set(
	"n",
	"<leader>a",
	"<cmd>rightbelow vsplit | wincmd w<CR>",
	{ desc = "open vertical split right and move" }
)

-- create a new tab
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<cr>", { desc = "create a new tab" })
