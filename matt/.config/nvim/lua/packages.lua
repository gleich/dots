vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'blackbirdtheme/vim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'wakatime/vim-wakatime'
  use 'terrortylor/nvim-comment'
  use 'rcarriga/nvim-notify'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'akinsho/toggleterm.nvim'
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  }
  use 'morhetz/gruvbox'
  use 'sheerun/vim-polyglot'
  use 'norcalli/nvim-colorizer.lua'
  use 'arnamak/stay-centered.nvim'
  use 'windwp/nvim-autopairs'

  --> lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'
  use 'simrat39/rust-tools.nvim'

  --> retired
  -- use 'dstein64/vim-startuptime'
end)
