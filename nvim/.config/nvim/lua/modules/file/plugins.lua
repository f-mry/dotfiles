local plugin = require('me.packer').register_plugin
plugin({
    'ThePrimeagen/harpoon',
    config = function()
        require('modules.file.harpoon')
    end
})
plugin({
    'ibhagwan/fzf-lua',
    config = function()
        require('modules.file.fzf')
    end
})
plugin({
    'tamago324/lir.nvim',
    config = function()
        require('modules.file.lir')
    end
})
