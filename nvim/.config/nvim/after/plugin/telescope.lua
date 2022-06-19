
local present, telescope = pcall(require, "telescope")
if not present then
    return
end

local actions = require('telescope.actions')

telescope.setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        -- prompt_position = "bottom",
        prompt_prefix = "🔭 ",
        selection_caret = "» ",
        entry_prefix = "  ",
        initial_mode = "insert",
        -- selection_strategy = "reset",
        -- sorting_strategy = "descending",
        -- layout_strategy = "horizontal",
        -- layout_defaults = {
        --     horizontal = {
        --         mirror = false,
        --     },
        --     vertical = {
        --         mirror = false,
        --     },
        -- },
        -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        -- file_ignore_patterns = {},
        -- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        -- shorten_path = true,
        -- winblend = 0,
        -- width = 0.75,
        -- preview_cutoff = 120,
        results_height = 1,
        height=0.3,
        -- results_width = 0.8,
        -- border = {},
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<esc>"] = actions.close
            }
        }
    },
    extension = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }

}

telescope.load_extension('fzf')

-- keybind
local map = vim.api.nvim_set_keymap

local options = {noremap = true}

map('n', '<leader>ff', '<cmd>Telescope fd theme=ivy previewer=false<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep theme=ivy preview=true<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers theme=ivy previewer=false<cr>', options)
map('n', 'gr', '<cmd>Telescope lsp_references theme=ivy<CR>', options)