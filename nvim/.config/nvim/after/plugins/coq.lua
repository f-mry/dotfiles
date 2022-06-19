vim.g.coq_settings = {
    auto_start = true,
    ["keymap.jump_to_mark"] = "<C-j>",
    ["display.preview.border"] = "double",
    ["clients.tmux.enabled"] = false,
    ["clients.tags.enabled"] = false,
}

require('coq')
