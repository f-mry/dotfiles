-- RESERVED FOR MANUAL CONFIG (HOPEFULLY)
-- =  =  =  =  =  =  =  =  =  =
-- local o = vim.o

-- local function git_status()
--     local status = vim.b.gitsigns_status_dict
--     if status == nil then
--         return ""
--     end
--     -- local added = (status.added ~= 0) and "+" .. status.added or ""
--     -- local changed = (status.changed ~= 0) and "~" .. status.changed or ""
--     -- local removed = (status.removed ~= 0) and "-" .. status.removed or ""

--     local added = (status.added ~= 0) and "%#GitSignsAdd#" .. status.added .. " " or ""
--     local changed = (status.changed ~= 0) and "%#GitSignsChange#" .. status.changed .. " " or ""
--     local removed = (status.removed ~= 0) and "%#GitSignsDelete#" .. status.removed .. " " or ""

--     return table.concat {
--         added,
--         changed,
--         removed,
--         "%#StatusLine#"
--     }
-- end

-- local function file()
--     return "%t %m%h%r%w"
-- end


-- function StatuslineInactive()
--     return table.concat {
--         file(),
--     }
-- end

-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- local statuslinegroup = augroup('HighlightYank', { clear = true })

-- autocmd("WinEnter,BufEnter", {
--     pattern = '*',
--     group = statuslinegroup,
--     callback = function()
--         WIP
--         vim.wo.statusline = "%!luaeval('StatuslineActive()')"
--     end
-- })

-- autocmd("WinLeave,BufLeave", {
--     pattern = '*',
--     group = statuslinegroup,
--     callback = function()
--         WIP
--         vim.wo.statusline = "%!luaeval('StatuslineInactive()')"
--     end
-- })

local ok, lualine = pcall(require, "lualine")
if not ok then
    return
end

local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local config = {
    options = {
        theme = "tokyonight",
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },

    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    incactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },

    extensions = {},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

local function ins_extension(component)
    table.insert(config.extensions, component)
end

ins_left {
    "filename",
    color = { gui = "bold" },
    path = 1,
}

ins_left { "diagnostics" }

ins_right { "diff" }
ins_right { "branch", color = { fg = colors.blue, gui = "bold" } }
ins_right { "location" }
ins_right { "progress", color = { gui = "bold" } }

ins_extension("quickfix")
ins_extension("fugitive")

local telescope = {
    sections = { lualine_c = {
        {
            function()
                return "Telescope"
            end,
            color = { gui = "bold" }
        }
    } },
    filetypes = { 'TelescopePrompt' }
}
ins_extension(telescope)

lualine.setup(config)
