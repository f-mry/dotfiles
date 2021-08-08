local line = require('lualine')

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
}

local function ruler()
    return [[ℓ%3l/%L 𝚌 %2v]]
end

line.setup{
    options = {
        theme = 'auto',
        component_separators = "|",
        section_separators = "",
    },
    extension = {
        'quickfix',
        'fugitive'
    },
    sections = {
        lualine_a = {
            {
                function ()
                    return " "
                end,
                left_padding = 0,
                right_padding = 2
            }
        },
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                symbols = {
                    modified = ' ',
                    readonly = ' ',
                },
            },
            'filetype',

        },
        lualine_x = {
            {'branch', condition = conditions.hide_in_width},
            -- {'location'},
            {ruler},
            -- {
            --     'progress',
            --     color = "lualine_a_normal_to_lualine_b_normal"
            -- },
        },
        lualine_y = {},
        lualine_z = {}
    },
}
