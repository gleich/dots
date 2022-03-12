require('nvim-tree').setup {
    diagnostics = {
        enable = true,
    },
}

require('nvim_comment').setup()

require('notify').setup()
vim.notify = require('notify')

--> luasnip
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
require('lualine').setup()
require('nvim-autopairs').setup{}
require('startup').setup({theme = 'electro'})
