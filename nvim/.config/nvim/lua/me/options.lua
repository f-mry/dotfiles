local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local cmd = vim.cmd

o.completeopt = "menu,menuone,noselect"

-- find files
o.path = o.path .. "**"
o.wildmenu = true

-- number gutter
wo.number = true
wo.relativenumber = true

-- convenience
o.splitright = true
o.confirm = true
-- o.clipboard = "unnamedplus"
-- o.smartcase = true
o.hidden = true
o.wrap = false
o.sidescroll = 10

-- Formatting
bo.textwidth = 120
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.spelllang = "id,en"

bo.smartindent = true
bo.autoindent = true

o.formatoptions = 'cqjr'

-- General
o.showmode = false
o.ruler = false
o.lz = true
o.cursorline = true
o.laststatus = 2

-- mouse support
o.mouse = 'a'

-- Colors

o.tgc = true
cmd('syntax on')
cmd('colorscheme kanagawa')

--IDK
g.python3_host_prog = '/usr/bin/python'

-- still idk but usefull
cmd('au TextYankPost * silent! lua vim.highlight.on_yank({timeout=100})')
o.swapfile = false
-- o.undodir = '/home/farhanmry/.nvim/undodir'
o.undofile = false
