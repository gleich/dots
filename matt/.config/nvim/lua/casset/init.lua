require('nvim-tree').setup {
    diagnostics = {
        enable = true,
    },
}

require('nvim_comment').setup()

--> luasnip
require('luasnip.loaders.from_vscode').load({ paths = { "./snippets/vscode/" } })
local ls = require('luasnip')
ls.config.set_config {
    history = false,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,
}

require('colorizer').setup()

require('toggleterm').setup({
    direction = 'float',
})

require('stay-centered')

require('startup').setup({theme = 'electro'})
