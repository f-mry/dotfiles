vim.cmd("packadd packer.nvim")

local present, packer = pcall(require, "packer")

if not present then
    local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

    print("Cloning packer..")
    -- remove the dir before cloning
    vim.fn.delete(packer_path, "rf")
    vim.fn.system(
        {
            "git",
            "clone",
            "https://github.com/wbthomason/packer.nvim",
            "--depth",
            "20",
            packer_path
        }
    )

    vim.cmd("packadd packer.nvim")
    present, packer = pcall(require, "packer")

    if present then
        print("Packer cloned successfully.")
    else
        error("Couldn't clone packer !\nPacker path: " .. packer_path)
    end
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end
    },
    git = {
        clone_timeout = 600 -- Timeout, in seconds, for git clones
    }
}

packer.startup(function(use)
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- lsp and completion
    use {
        'nvim-treesitter/nvim-treesitter',
        event = "BufRead",
        config = function ()
            require "plugins.treesitter"
        end
    }

    use {
        'williamboman/nvim-lsp-installer',
		requires = {
			'neovim/nvim-lspconfig'
		},
		config = function()
			require "plugins.lspconfig"
		end

    }

    -- completion

    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        config = function()
			vim.g.coq_settings = {
				auto_start = 'shut-up',
				["keymap.jump_to_mark"] = "<C-j>",
                ["clients.tmux.enabled"] = false,
                ["display.preview.border"] = "double"
			}
        end,
        requires = {
            'ms-jpq/coq.artifacts',
        },
        disable = false
    }

    use {
        'ray-x/go.nvim',
        opt = true,
        ft = "go",
        config = function()
            require('go').setup({
                run_in_floaterm = true
            })
        end
    }
    use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}

    -- Convenience
    use {
        'jiangmiao/auto-pairs',
        event = "InsertCharPre",
		opt = true

    }
    use 'tpope/vim-surround'

    use 'tpope/vim-vinegar'
    use {
        'tpope/vim-commentary',
        event = 'InsertCharPre',
		opt = true,
    }

    use 'haya14busa/is.vim'

    use {
        'junegunn/vim-easy-align',
        event = "BufRead",
		opt = true
    }

    use {
        'ggandor/lightspeed.nvim',
        opt = true,
        event = "BufRead",
        config = function()
            require('lightspeed').init_highlight(true)
        end
    }

    use {
        'tpope/vim-repeat',
        opt = true,
        event = "BufRead"
    }

    use {
        'ThePrimeagen/harpoon',
        config = function ()
                   require "plugins.harpoon"
                 end
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

    -- Cosmetics
    use {
        'kyazdani42/nvim-web-devicons',
        event = "BufEnter"
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons'},
        config = function()
            require "plugins.lualine"
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        opt = true,
        ft = {'css', 'javascript', 'html'},
        config = function()
            require "plugins.colorizer"
        end
    }

    -- Git stuffs
    use {
        'tpope/vim-fugitive',
        cmd = {'Git'}
    }
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        event = "BufRead",
        opt = true,
        config = function ()
			require('gitsigns').setup()
        end,
    }

    -- Colors
    use {'folke/tokyonight.nvim'}
    use {'christianchiarulli/nvcode-color-schemes.vim'}
    use {'Shatur/neovim-ayu'}
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v1.*',
        config = function ()
            require('rose-pine').setup({
                ---@usage 'main'|'moon'
                dark_variant = 'main',
                bold_vert_split = true,
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = true,
                ---@usage string hex value or named color from rosepinetheme.com/palette
                groups = {
                    background = 'base',
                    panel = 'surface',
                    border = 'highlight_med',
                    comment = 'muted',
                    link = 'iris',
                    punctuation = 'subtle',

                    error = 'love',
                    hint = 'iris',
                    info = 'foam',
                    warn = 'gold',

                    headings = {
                        h1 = 'iris',
                        h2 = 'foam',
                        h3 = 'rose',
                        h4 = 'gold',
                        h5 = 'pine',
                        h6 = 'foam',
                    }
                    -- or set all headings at once
                    -- headings = 'subtle'
                },
                -- Change specific vim highlight groups
                highlight_groups = {
                    ColorColumn = { bg = 'rose' }
                }
            })
        end
    })

end)

