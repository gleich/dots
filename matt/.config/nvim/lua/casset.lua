require('nvim-tree').setup {
    diagnostics = {
        enable = true,
    },
}
require('nvim_comment').setup()
require('notify').setup()
vim.notify = require('notify')
require('luasnip').config.set_config {
    history = false,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,
}
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

