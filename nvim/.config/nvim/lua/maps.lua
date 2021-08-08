local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

local options = {noremap = true}

require('utils')

-- leader key
vim.g.mapleader = ','

-- Navigation
map('n', ']q', '<cmd>cnext<cr>zz', options)
map('n', '[q', '<cmd>cprevious<cr>zz', options)
map('n', ']l', '<cmd>lnext<cr>zz', options)
map('n', '[l', '<cmd>lprevious<cr>zz', options)

map('n', '<leader>qo', '<cmd>copen<cr>', options)
map('n', '<leader>ql', '<cmd>cclose<cr>', options)

map('n', ']b', '<cmd>bnext<cr>zz', options)
map('n', '[b', '<cmd>bprevious<cr>zz', options)

map('n', '<leader>bo', '<cmd>ls<cr>', options)

-- Convenience
map('n', 'n', 'nzzzv', options)
map('n', 'N', 'Nzzzv', options)
map('n', '<C-L>', '<cmd>nohlsearch<cr>', options)

-- tab management
map('n', 'ta', '<cmd>tabnew<cr>', options)
map('n', 'th', 'gT', options)
map('n', 'tl', 'gt', options)
map('n', 'tc', ':tabclose<cr>', options)

-- File Manager
map('n', '<leader>e', '<cmd>Ex<cr>', options)

-- telescope
map('n', '<leader>ff', '<cmd>Telescope fd<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)

-- Insert Mode
map('i', 'jk', '<Esc>', options)

-- Snippets
-- vim.g.UltiSnipsExpandTrigger = "<c-j>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
map('i', '<C-j>', 'v:lua.tab_complete()', {expr = true})
map('s', '<C-j>', 'v:lua.tab_complete()', {expr = true})
map('i', '<C-k>', 'v:lua.s_tab_complete()', {expr = true})
map('s', '<C-k>', 'v:lua.s_tab_complete()', {expr = true})


-- Formatting
map('x', 'ga', '<Plug>(EasyAlign)', {})
map('n', 'ga', '<Plug>(EasyAlign)', {})

-- Git Stuffs
map('n', '<leader>gs', ':Git<cr>', options)
map('n', '<leader>gl', ':Gclog<cr>', options)

map('n', '<A-g>', ':Lspsaga open_floaterm lazygit<cr>', options)

-- Terminal
map('n', '<A-t>', ':Lspsaga open_floaterm<cr>', options)
map('t', '<A-c>', '<C-\\><C-n>:Lspsaga close_floaterm<cr>', options)

