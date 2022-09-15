local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

treesitter.setup({
    ignore_install = { 'phpdoc' },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
    },
})

local ok, ts_context = pcall(require, "treesitter-context")
if not ok then
    return
end
ts_context.setup({
    enable = true,
    max_lines = 2
})
