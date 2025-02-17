-- bootstrap lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- add git related signs to the gutter
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- theme
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true
        }
      })
      vim.cmd('colorscheme github_dark')
    end,
  },

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = vim.g.have_nerd_font,
          theme = 'auto'
        }
      })
    end
  },

  -- statup screen
  {
    "goolord/alpha-nvim",
    config = function()
       local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = { "mattglei.ch" }
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.footer.val = {}
      dashboard.section.buttons.val = {}

      local header_lines = #dashboard.section.header.val
      local total_lines = vim.o.lines
      local top_padding = math.floor((total_lines - header_lines) / 2)

      dashboard.config.layout = {
        { type = "padding", val = top_padding },
        dashboard.section.header,
        { type = "padding", val = 1 },
        dashboard.section.buttons,
        dashboard.section.footer,
      }

      vim.cmd([[highlight AlphaHeader guifg=#ffffff]])
      require("alpha").setup(dashboard.config)
    end,
  },


  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end
      },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          }
        }
      })

      -- enable telescope extensions
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- key mappings
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = '[L]ive [G]rep' })

      -- fuzzy finder for neovim configuration files
      vim.keymap.set('n', '<leader>sco', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [C]onfigation files' })
    end
  },

  -- configures lua lsp, runtime and plugins used for completion,
  -- annotations, and signatures of neovim apis
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
})
