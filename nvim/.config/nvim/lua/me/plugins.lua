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
    }

    -- debugging

    use {
        'mfussenegger/nvim-dap',
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
    }

    use {
        'williamboman/nvim-lsp-installer',
		requires = {
			'neovim/nvim-lspconfig'
		},

    }

    -- completion

    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        requires = {
            'ms-jpq/coq.artifacts',
        },
    }

    -- Convenience
    use {
        'jiangmiao/auto-pairs',
    }
    use 'tpope/vim-surround'

    -- use 'tpope/vim-vinegar'
    use {'tpope/vim-commentary'}

    use 'haya14busa/is.vim'

    use {
        'junegunn/vim-easy-align',
    }

    use {
        'ggandor/lightspeed.nvim',
    }

    use {
        'tpope/vim-repeat',
    }

    use {
        'ThePrimeagen/harpoon',
    }

    use {
        'ibhagwan/fzf-lua',
    }

    -- Cosmetics
    use {
        'kyazdani42/nvim-web-devicons',
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons'},
    }

    use {
        'norcalli/nvim-colorizer.lua',
    }

    -- Git stuffs
    use {
        'tpope/vim-fugitive',
        cmd = {'Git'}
    }
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
    }

    -- language specific

    use {
        "leoluz/nvim-dap-go",
        requires = {'mfussenegger/nvim-dap'},
    }


    use {"crispgm/nvim-go"}
    -- Colors
    use {'folke/tokyonight.nvim'}
    use {'christianchiarulli/nvcode-color-schemes.vim'}
    use {'Shatur/neovim-ayu'}

end)

