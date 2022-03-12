vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'wakatime/vim-wakatime'
  use 'terrortylor/nvim-comment'
  use 'rcarriga/nvim-notify'
  use 'akinsho/toggleterm.nvim'
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  }
  use 'norcalli/nvim-colorizer.lua'
  use 'arnamak/stay-centered.nvim'
  use 'windwp/nvim-autopairs'
  use 'stevearc/qf_helper.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use 'morhetz/gruvbox'
  use 'nvim-lualine/lualine.nvim'

  --> telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'

  --> completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'

  --> lsp
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'

  --> language stuff
  use 'sheerun/vim-polyglot'

  --> retired
  -- use 'dstein64/vim-startuptime'
  -- use 'blackbirdtheme/vim'
end)