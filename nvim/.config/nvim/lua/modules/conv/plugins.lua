local plugin = require('me.packer').register_plugin

plugin({'jiangmiao/auto-pairs', event = 'VimEnter'})
plugin({'tpope/vim-surround'})
plugin({'tpope/vim-commentary'})
-- plugin({'haya14busa/is.vim'})
plugin({
    'junegunn/vim-easy-align',
    config = function()
        local map = vim.api.nvim_set_keymap
        map('x', 'ga', '<Plug>(EasyAlign)', {})
        map('n', 'ga', '<Plug>(EasyAlign)', {})
    end
})
plugin({
    'ggandor/lightspeed.nvim',
    event = 'VimEnter'

})
plugin({'tpope/vim-repeat'})
