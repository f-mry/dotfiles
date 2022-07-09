local plugin = require('me.packer').register_plugin
plugin({
    'ThePrimeagen/harpoon',
    -- event = 'BufEnter',
    config = require('modules.file.harpoon')
})
plugin({
    'ibhagwan/fzf-lua',
    -- event = 'BufEnter',
    config = require('modules.file.fzf')
})
plugin({
    'tamago324/lir.nvim',
    config = require('modules.file.lir')
})
