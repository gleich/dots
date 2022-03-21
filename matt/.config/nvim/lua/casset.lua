require('nvim-tree').setup {
    diagnostics = {
        enable = true,
    },
}
require('Comment').setup()
require('notify').setup()
vim.notify = require('notify')
require('luasnip').config.set_config({
    updateevents = "TextChanged, TextChangedI",
    region_check_events = "CursorMoved"
})
require('colorizer').setup()
require('toggleterm').setup({
    direction = 'float',
})
require('stay-centered')
require('lualine').setup()
require('nvim-autopairs').setup{}
require('startup').setup({theme = 'electro'})
require('rust-tools').setup({
    tools = {
        hover_with_actions = true,
        autoSetHints = true,
    },
    server = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            }
        }
    }
})
require('presence'):setup({
    main_image = "file",
    neovim_image_text = "editor of champions"
})
require('nvim-lightbulb').setup()
