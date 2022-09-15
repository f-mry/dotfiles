vim.g.coq_settings = {
    ["keymap.jump_to_mark"] = "<C-j>",
    ["clients.tmux.enabled"] = false,
    ["clients.tags.enabled"] = true,
    ["diplay.preview.positions.north"] = nil,
    ["diplay.preview.positions.south"] = nil,
    ["completion.smart"] = false,
}

vim.cmd [[silent! COQnow -s]]






