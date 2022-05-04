vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'wakatime/vim-wakatime'
  use 'numToStr/Comment.nvim'
  use 'rcarriga/nvim-notify'
  use 'akinsho/toggleterm.nvim'
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
      vim.opt.spell = false
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
  use 'nvim-lualine/lualine.nvim'
  use 'dylnmc/synstack.vim'
  use 'tpope/vim-surround'
  use 'andweeb/presence.nvim'
  use 'kosayoda/nvim-lightbulb'
  use({ "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" })

  --> telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'andreasvc/vim-256noir'
  use 'mattn/emmet-vim'

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
  use 'simrat39/rust-tools.nvim'
  use 'lervag/vimtex'
  use 'fatih/vim-go'
  use 'leafOfTree/vim-svelte-plugin'

  --> retired
  -- use 'dstein64/vim-startuptime'
  -- use 'blackbirdtheme/vim'
  -- use 'sheerun/vim-polyglot'
end)
