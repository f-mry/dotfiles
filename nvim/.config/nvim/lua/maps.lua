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

-- tab management
map('n', 'ta', '<cmd>tabnew<cr>', options)
map('n', 'th', 'gT', options)
map('n', 'tl', 'gt', options)
map('n', 'tc', ':tabclose<cr>', options)

-- File Manager
-- map('n', '<leader>e', '<cmd>Ex<cr>', options)

-- telescope
map('n', '<leader>ff', '<cmd>Telescope fd theme=ivy previewer=false<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep theme=ivy preview=true<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers theme=ivy previewer=false<cr>', options)

-- Insert Mode
map('i', 'jk', '<Esc>', options)


-- Formatting
map('x', 'ga', '<Plug>(EasyAlign)', {})
map('n', 'ga', '<Plug>(EasyAlign)', {})

-- Git Stuffs
map('n', '<leader>gs', ':Git<cr>', options)
map('n', '<leader>gl', ':Gclog<cr>', options)

-- Background
function _G.toggle_background()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end

-- map('n', '<F5>', ":lua require('rose-pine.functions').toggle_variant({'base', 'dawn'})<cr>", options )
map('n', '<F5>', ":lua toggle_background()<cr>", options )

