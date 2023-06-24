vim.scriptencoding = "utf-8"

local settings = {
    number = true,
    tabstop = 4,
    expandtab = true,
    softtabstop = 4,
    shiftwidth = 2,
    autoindent = true,
    cursorline = true,
    expandtab = true,
    encoding = "utf-8",
    title = true,
    wildmenu = true,
    ttimeoutlen = 0,
    showcmd = true,
    showmatch = true,
}

local cmds = {
    "colorscheme gruvbox"
}

-- apply settings and cmds
for k, v in pairs(settings) do
    vim.opt[k] = v
end
for _, c in ipairs(cmds) do
    vim.cmd(c)
end
