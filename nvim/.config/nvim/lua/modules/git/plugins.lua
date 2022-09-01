local plugin = require('me.packer').register_plugin

plugin({
    'tpope/vim-fugitive',
    config = function()
        -- Git Stuffs
        local map = vim.api.nvim_set_keymap
        local options = {noremap = true}
        map('n', '<leader>gs', ':Git<cr>', options)
        map('n', '<leader>gl', ':Gclog<cr>', options)
    end,
    cmd = "Git"
})
plugin({
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
        require('gitsigns').setup()
    end,
    after = 'vim-fugitive'
})
