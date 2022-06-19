-- keybind
local map = vim.api.nvim_set_keymap

local options = {noremap = true}

require'fzf-lua'.setup {
    fzf_colors = {
        ["fg"]          = { "fg", "CursorLine" },
        ["bg"]          = { "bg", "Normal" },
        ["hl"]          = { "fg", "Identifier" },
        ["fg+"]         = { "fg", "Normal" },
        ["bg+"]         = { "bg", "CursorLine" },
        ["hl+"]         = { "fg", "Statement" },
        ["info"]        = { "fg", "PreProc" },
        ["prompt"]      = { "fg", "Conditional" },
        ["pointer"]     = { "fg", "Exception" },
        ["marker"]      = { "fg", "Keyword" },
        ["spinner"]     = { "fg", "Label" },
        ["header"]      = { "fg", "Comment" },
        ["gutter"]      = { "bg", "Normal" },
    },
}



map('n', '<leader>ff', '<cmd>FzfLua files previewer=false<cr>', options)
map('n', '<leader>flg', '<cmd>FzfLua live_grep<cr>', options)
map('n', '<leader>fg', '<cmd>FzfLua grep<cr>', options)
map('n', '<leader>fb', '<cmd>FzfLua buffers previewer=false<cr>', options)
map('n', 'gr', '<cmd>FzfLua lsp_references<CR>', options)
map('n', '<leader>gb', '<cmd>FzfLua git_branches<CR>', options)
