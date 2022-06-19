local lualine = require('lualine')


lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            function ()
                return ' '
            end
        },
        lualine_b = {},
        lualine_c = {{
            'filename',
            path = 1,

        }},
        lualine_x = {'diff', 'diagnostics', 'branch', 'filetype'},
        lualine_y = {'progress', 'location'},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fzf', 'quickfix', 'fugitive',
        {
            sections = {
                lualine_a = {function()
                    return "Harpoon"
                end,}
            },
            filetypes = {'harpoon'}
        }
    }
}
