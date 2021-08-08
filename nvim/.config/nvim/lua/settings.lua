local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local cmd = vim.cmd

o.completeopt = "menuone,noselect"

-- find files
o.path = o.path .. "**"
o.wildmenu = true

-- number gutter
wo.number = true
wo.relativenumber = true

-- convenience
o.splitright = true
o.confirm = true
o.clipboard = "unnamedplus"
o.smartcase = true
o.hidden = true

-- Formatting
bo.textwidth = 120
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

bo.autoindent = true

-- General
o.showmode = false

-- mouse support
o.mouse = 'a'

-- Colors

g.tokyonight_style = 'night'
g.tokyonight_sidebars = { "qf", "fugitive", "terminal", "packer" }

g.nvcode_termcolors = 256
o.tgc = true
cmd('syntax on')
cmd('colorscheme tokyonight')

g.python3_host_prog = '/usr/bin/python'

o.spelllang = "id,en"
