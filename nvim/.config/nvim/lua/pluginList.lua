local present, _ = pcall(require, "packerInit")
local packer

if present then
    packer = require "packer"
else
    return false
end

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- LSP and Completion
    use {
        'nvim-treesitter/nvim-treesitter',
        event = "BufRead",
        config = function ()
            require "plugins.treesitter"
        end
    }
    use {
        'kabouzeid/nvim-lspinstall',
        event = "BufEnter"
    }
    use {
        'neovim/nvim-lspconfig',
        after = "nvim-lspinstall",
        config = function()
            require "plugins.lspconfig"
        end
    }
    use {
        'glepnir/lspsaga.nvim',
        after = "nvim-lspconfig",
        config = function ()
            require "plugins.lspsaga"
        end
    }
    use {
        'ray-x/lsp_signature.nvim',
        event = "InsertCharPre",
        after = "nvim-lspconfig"
    }
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require "plugins.compe"
        end,
        wants = "LuaSnip",
        requires = {
            {
                'onsails/lspkind-nvim',
                config = function ()
                    require "plugins.lspkind"
                end
            },
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require "plugins.luasnip"
                end
            },
            {
                "rafamadriz/friendly-snippets",
                event = "InsertCharPre"
            }
        }
    }

    -- Convenience
    use {
        'jiangmiao/auto-pairs',
        event = "InsertCharPre",

    }
    use 'tpope/vim-surround'
    use {
        'tpope/vim-obsession',
        cmd = "Obsession",
        opt = true
    }
    use {
        'tpope/vim-commentary',
        event = 'BufEnter'
    }
    -- use 'haya14busa/is.vim'
    use {
        'junegunn/vim-easy-align',
        event = "BufRead"
    }

    use {
        'kyazdani42/nvim-web-devicons',
        event = "BufEnter"
    }

    use {
        "nvim-telescope/telescope.nvim",
        cmd    = "Telescope",
        config = function()
            require "plugins.telescope"
        end
    }

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    }
    -- Git stuffs
    use {
        'tpope/vim-fugitive',
        opt = true,
        cmd = {'Git'}
    }
    use {
        'lewis6991/gitsigns.nvim',
        event = "BufRead",
        config = function ()
            require "plugins.gitsigns"
        end
    }

    -- Colors
    use 'folke/tokyonight.nvim'
    use {'christianchiarulli/nvcode-color-schemes.vim', opt = true }
    -- use 'ray-x/aurora'
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require "plugins.lualine"
        end
    }

end)
