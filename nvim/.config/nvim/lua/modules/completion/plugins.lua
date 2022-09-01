local plugin = require('me.packer').register_plugin
local conf = require('modules.completion.config')

plugin({
    'williamboman/nvim-lsp-installer',
    requires = { 'neovim/nvim-lspconfig' }
})

plugin({
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {
        'ms-jpq/coq.artifacts',
    },
    config = function()
        vim.g.coq_settings = {
            auto_start = 'shut-up',
            ["keymap.jump_to_mark"] = "<C-j>",
            ["clients.tmux.enabled"] = false,
            ["clients.tabnine.enabled"] = false,
            ["diplay.preview.positions.north"] = nil,
            ["diplay.preview.positions.south"] = nil,
            ["completion.smart"] = true,
        }
        require('coq')
    end
})

plugin({'ray-x/go.nvim'})

require('modules.completion.config')
