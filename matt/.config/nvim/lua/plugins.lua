local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "numToStr/Comment.nvim",
    version = "*",
    config = function()
      require('Comment').setup {}
    end
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 }, -- theme

  -- neovim file explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- coding tracking
  {"wakatime/vim-wakatime"},

  -- file search
  {
   'nvim-telescope/telescope.nvim', tag = '0.1.1',
   dependencies = { 'nvim-lua/plenary.nvim' }
  }
})
