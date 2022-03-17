local ls = require('luasnip')

ls.snippets = {
    rust = {
        ls.parser.parse_snippet("dp", "println!(\"$1 = {:?}\", $1);")
    }
}

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/vscode/" } })

