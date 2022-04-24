local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup {
    -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
    indent = {
        enable = true
    },
    -- rainbow = {
    --     enable = true,
    --     colors = require('ayu').rainbow_colors
    -- }
}
