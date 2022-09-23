vim.o.tgc = true
local ok, tokyonight = pcall(require, "tokyonight")
if ok then
    tokyonight.setup({
        sytle = "night",
        styles = {
            comment = { italic = true },
            keywords = { italic = true },
            boolean = {},
            functions = {},
            variables = {},
            -- sidebars = "dark",
            -- floats = "dark",
        },
        hide_inactive_statusline = true,
        sidebars = { "qf", "fugitive", "terminal", "packer", "netrw", "lir" },
    })
end

local ok, ayu = pcall(require "ayu")
if ok then
    local colors = require('ayu.colors')
    colors.generate()
    ayu.setup({
        overrides = {
            LspSignatureActiveParameter = { fg = colors.warning }
        }
    })
end

vim.cmd('colorscheme tokyonight-night')
