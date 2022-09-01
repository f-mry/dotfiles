local plugin = require('me.packer').register_plugin
plugin({
    'ThePrimeagen/harpoon',
    config = function()
        require('modules.file.harpoon')
    end
})
-- plugin({
--     'ibhagwan/fzf-lua',
--     config = function()
--         require('modules.file.fzf')
--     end
-- })
plugin ({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
})

plugin({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    config = function()
        require('modules.file.telescope')
    end
})
plugin({
    'tamago324/lir.nvim',
    config = function()
        require('modules.file.lir')
    end
})
