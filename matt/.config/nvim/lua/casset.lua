require('nvim-tree').setup {
    diagnostics = {
        enable = true,
    },
}

require('nvim_comment').setup()

require('notify').setup()
vim.notify = require('notify')

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
require('nvim-autopairs').setup{}
require('startup').setup({theme = 'electro'})

--> lsp
require('lspconfig').pyright.setup({})
require('rust-tools').setup({})
