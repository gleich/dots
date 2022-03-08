local map = vim.api.nvim_set_keymap

map('n', '<leader>q', ':q<cr>', {})
map('n', '<leader>n', ':NvimTreeToggle<cr>', {})

--> telescope
map('n', '<leader>p', ':Telescope find_files<cr>', {})
map('n', '<leader>r', ':Telescope oldfiles<cr>', {})

--> luasnip
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({

  -- ... Your other configuration ...

  mapping = {

    -- ... Your other mappings ...

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...
  },

  -- ... Your other configuration ...
})
-- local ls = require('luasnip')
-- vim.keymap.set({ 'i', 's' }, '<c-k>', function()
--     if ls.expand_or_jumpable() then
--         ls.expand_or_jump()
--     end
-- end, { silent = true })
-- vim.keymap.set({ 'i', 's' }, '<c-j>', function()
--     if ls.jumpable(-1) then
--         ls.jump(-1)
--     end
-- end, { silent = true })
