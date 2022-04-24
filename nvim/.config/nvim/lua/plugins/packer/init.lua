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
        event = "BufEnter",
		opt = true,
		requires = {
			'neovim/nvim-lspconfig'
		},
		config = function()
			require "plugins.lspconfig"
		end

    }

    use {
        'neovim/nvim-lspconfig',
        after = "nvim-lsp-installer",
        config = function()
            require "plugins.lspconfig"
        end
    }

    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        config = function()
			vim.g.coq_settings = {
				auto_start = 'shut-up',
				["keymap.jump_to_mark"] = "<C-j>",
			}
        end,
        requires = {
            'ms-jpq/coq.artifacts',
        },
        disable = false
    }

    -- Language Related
    use {
        'crispgm/nvim-go',
        opt = true,
        ft = {'go'},
        config = function ()
            require('go').setup({
                auto_format = false,
                auto_lint = false,
                lint_prompt_style = 'vt',
            })

        end
    }

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

    -- Cosmetics
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

end)

