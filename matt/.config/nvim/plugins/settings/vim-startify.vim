let g:startify_custom_header = startify#pad(split(system('CAT ~/.config/nvim/plugins/settings/vim.ascii'), '\n'))

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   🥑 Files:']                        },
          \ { 'type': 'dir',       'header': ['   🍒 Current Dir: '. getcwd()]       },
          \ { 'type': 'sessions',  'header': ['   🍎 Sessions:']                     },
          \ { 'type': 'bookmarks', 'header': ['   🌲 Bookmarks:']                    },
          \ ]
