local plugin = require('me.packer').register_plugin

plugin({
    'tpope/vim-fugitive',
    cmd = { 'Git' },
    config = function()
        -- Git Stuffs
        local map = vim.api.nvim_set_keymap
        local options = {noremap = true}
        map('n', '<leader>gs', ':Git<cr>', options)
        map('n', '<leader>gl', ':Gclog<cr>', options)
    end
})
plugin({
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
        require('gitsigns').setup()
    end,
    after = 'vim-fugitive'
})
