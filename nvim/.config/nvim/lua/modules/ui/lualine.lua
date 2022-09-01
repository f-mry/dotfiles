local present, lualine = pcall(require, "lualine")
if not present then
    return
end

local function ext(filetype, name)
    return {
        sections = {
            lualine_a = {function()
                return name
            end,}
        },
        filetypes = {filetype},
        inactive_sections = {
            lualine_a = {function()
                return name
            end,}
        },
    }
end



lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
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
        lualine_b = {},
        lualine_c = {{ 'filename', path = 1 }, 'diagnostics'},
        -- lualine_x = {'diff', 'diagnostics', 'branch', 'filetype'},
        lualine_x = {'diff', 'branch'},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fzf', 'quickfix', 'fugitive', ext("harpoon", "Harpoon"),
        ext("dapui_watches", "DAP Watches"),
        ext("dapui_stacks", "DAP Stacks"),
        ext("dapui_breakpoints", "DAP Breakpoints"),
        ext("dapui_scopes", "DAP Scopes"),
        ext("dap-repl", "DAP REPL"),
        ext("dapui-console", "DAP Console"),
        ext("TelescopePrompt", "Telescope"),
        {
            sections = {
                lualine_a = {function()
                    return "File"
                end,},
                lualine_c = {{
                    'filename',
                    path = 1,
                    file_status = false,

                }},
            },
            filetypes = {'lir'}
        }
    }
}
