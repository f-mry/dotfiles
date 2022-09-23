local map = vim.api.nvim_set_keymap

local options = { noremap = true }

-- require('utils')

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

-- map('n', '<C-d>', '<C-d>zz', options)
-- map('n', '<C-u>', '<C-u>zz', options)
-- map('n', '<C-o>', '<C-o>zz', options)
-- map('n', '<C-i>', '<C-i>zz', options)

-- map('n', 'n', 'nzz', options)
-- map('n', 'N', 'Nzz', options)

-- Convenience

-- tab management
-- map('n', 'ta', '<cmd>tabnew<cr>', options)
-- map('n', 'th', 'gT', options)
-- map('n', 'tl', 'gt', options)
-- map('n', 'tc', ':tabclose<cr>', options)

-- File Manager
-- map('n', '-', '<cmd>Ex<cr>', options)


-- Insert Mode
-- Try to use ctrl-c or alt-l to exit insert mode
-- map('i', 'jk', '<Esc>', options)



-- Background
function _G.toggle_background()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end

-- map('n', '<F5>', ":lua require('rose-pine.functions').toggle_variant({'base', 'dawn'})<cr>", options )
map('n', '<F5>', ":lua toggle_background()<cr>", options)

-- NICEEEE
map('n', ':', "<Cmd>set ignorecase<cr>:", options)

-- map('v', ':', "<Cmd>set ignorecase<cr>:", options)
-- map('n', '/', "<Cmd>set noignorecase<cr>/", options)
-- map('n', '?', "<Cmd>set noignorecase<cr>?", options)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local cmdgroup = augroup('CmdPre', {})
autocmd("CmdlineLeave", {
    pattern = '*',
    group = cmdgroup,
    callback = function()
        vim.o.ignorecase = false
    end
})
