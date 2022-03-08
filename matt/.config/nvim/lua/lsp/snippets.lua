local ls = require('luasnip')

ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "- this is what you expanded!"),
    }
}

require("luasnip.loaders.from_vscode").load({ paths = { "./snippets/vscode/" } })
