local plugin = require('me.packer').register_plugin

plugin({
    'tpope/vim-fugitive',
    cmd = { 'Git' }
})
plugin({
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    cmd = { 'Git' }
})
