local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_dark',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
        lualine_a = {
            function ()
               return ' '
            end
        },
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {'branch', 'diff', 'diagnostics', 'filetype'},
    lualine_y = {'progress', 'location'},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fzf', 'quickfix', 'fugitive',
        { sections =
            {
                lualine_b = {'mode'},
                lualine_z = {}
            },
            filetypes = {'TelescopePrompt'}
        }
}
}
