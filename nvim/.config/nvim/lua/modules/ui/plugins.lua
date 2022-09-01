local plugin = require('me.packer').register_plugin
plugin({ 'kyazdani42/nvim-web-devicons' })

plugin({
    'folke/tokyonight.nvim',
    config = function()
        vim.g.tokyonight_style = 'night'
        vim.g.tokyonight_sidebars = { "qf", "fugitive", "terminal", "packer", "netrw", "lir" }
    end
})

plugin({
    'Shatur/neovim-ayu',
    config = function()
        require('modules.ui.ayu')
    end
})

plugin({
    'rebelot/kanagawa.nvim',
    config = function()
        require 'kanagawa'.setup({
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            variablebuiltinStyle = { italic = true },
            specialReturn = true, -- special highlight for the return keyword
            specialException = true, -- special highlight for exception handling keywords
            transparent = false, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            globalStatus = false, -- adjust window separators highlight for laststatus=3
            colors = {},
            overrides = {},
        })
    end
})

plugin({ 'bluz71/vim-nightfly-guicolors' })
plugin({
    'ellisonleao/gruvbox.nvim',
    config = function()
        require("gruvbox").setup({
            undercurl = true,
            underline = true,
            bold = true,
            italic = true,
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = true,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            overrides = {},
        })
    end
})

plugin({
    'shaunsingh/solarized.nvim',
    config = function()
        vim.g.solarized_italic_comments = true
        vim.g.solarized_italic_keywords = true
        vim.g.solarized_italic_functions = true
        vim.g.solarized_italic_variables = false
        vim.g.solarized_contrast = true
        vim.g.solarized_borders = false
        vim.g.solarized_disable_background = false
    end
})

plugin({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        require('modules.ui.lualine')
    end
})

plugin({
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup()
    end,
    cmd = 'ColorizerToggle'
})

plugin({'Yazeed1s/minimal.nvim'})
