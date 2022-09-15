local packer = nil
local function init()
    if packer == nil then
        packer = require 'packer'
        packer.init { disable_commands = true }
    end

    local use = packer.use
    packer.reset()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- common
    use 'lewis6991/impatient.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim', after = 'mason.nvim' }
    use { 'neovim/nvim-lspconfig', after = 'mason-lspconfig.nvim' }

    use { 'j-hui/fidget.nvim' }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter-context' }

    -- completion
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        requires = {
            'ms-jpq/coq.artifacts',
        }
    }

    -- dap
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui' }

    -- editing / convenience
    use { 'jiangmiao/auto-pairs', event = 'InsertEnter' }
    use { 'tpope/vim-surround', event = 'BufEnter' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-repeat' }
    use { 'junegunn/vim-easy-align' }
    use { 'mbbill/undotree' }

    -- file / jump here and there
    use { 'ThePrimeagen/harpoon' }


    use { 'nvim-telescope/telescope.nvim' }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use { 'tpope/vim-vinegar' }

    -- git
    use { 'tpope/vim-fugitive' }
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        config = function()
            require('gitsigns').setup()
        end
    }

    use { 'ThePrimeagen/git-worktree.nvim' }

    -- colors

    use { 'folke/tokyonight.nvim' }
    use { 'Yazeed1s/minimal.nvim' }

    use { 'Shatur/neovim-ayu' }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end,
        cmd = 'ColorizerToggle'
    }

    -- statusline
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim' }

    -- lang
    use { 'ray-x/go.nvim' }

    -- wiki

    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_global_ext = 0
        end

    }



end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins
