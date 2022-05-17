vim.g.coq_settings = {
    ["keymap.jump_to_mark"] = "<C-j>",
    ["clients.tmux.enabled"] = false,
    ["display.preview.border"] = "double"
}

vim.g.coq_settings.auto_start = 'shut-up'

require('coq')
