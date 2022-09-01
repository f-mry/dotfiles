local map = vim.api.nvim_set_keymap

local options = { noremap = true }

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = require('telescope.actions').close,
                ["<C-v>"] = require('telescope.actions').select_vertical,
                ["<C-h>"] = require('telescope.actions').select_horizontal,
            },
            n = { ["q"] = require('telescope.actions').close }
        },
        sorting_strategy = 'ascending',
    },
    pickers = {
        find_files = { previewer = false, theme = 'dropdown' },
        fd = { theme = 'dropdown', previewer = false },
        buffers = { theme = 'dropdown', previewer = false },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
require('telescope').load_extension('fzf')

map('n', '<leader>ff', '<cmd> Telescope find_files<cr>', options)
map('n', '<leader>fg', '<cmd> Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd> Telescope buffers<cr>', options)
map('n', 'gr', '<cmd> Telescope lsp_references<CR>', options)
map('n', '<leader>gb', '<cmd> Telescope git_branches<CR>', options)
map('n', '<C-p>', '<cmd> Telescope commands<CR>', options)
