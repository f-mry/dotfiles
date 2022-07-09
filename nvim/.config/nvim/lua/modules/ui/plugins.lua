local plugin = require('me.packer').register_plugin
plugin({ 'kyazdani42/nvim-web-devicons' })

plugin({
    'folke/tokyonight.nvim',
    config = function()
        vim.g.tokyonight_style = 'night'
        vim.g.tokyonight_sidebars = { "qf", "fugitive", "terminal", "packer", "netrw", "lir" }
        vim.g.tokyonight_italic_keywords = false
    end
})

plugin({
    'Shatur/neovim-ayu',
    config = function()
        require 'ayu'.setup({
            overrides = function()
                if vim.o.background == 'dark' then
                    return { Cursor = { bg = '#FFFFFF', fg = '#000000' } }
                else
                    return { Cursor = { bg = '#000000', fg = '#FFFFFF' } }
                end
            end
        })
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

plugin({ 'christianchiarulli/nvcode-color-schemes.vim' })

plugin({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require('modules.ui.lualine')
    end
})

