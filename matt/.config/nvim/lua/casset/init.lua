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
    history = true,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,
}
