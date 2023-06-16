local settings = {
    number = true,
    tabstop = 4,
    expandtab = true,
    softtabstop = 4,
    shiftwidth = 4,
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
