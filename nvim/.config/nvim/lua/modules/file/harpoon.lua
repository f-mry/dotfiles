local map = vim.api.nvim_set_keymap

local options = {noremap = true}
map('n', "''", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', options)

map('n', "'<space>", '<cmd>lua require("harpoon.mark").add_file()<cr>', options)

map('n', "'f", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', options)
map('n', "'d", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', options)
map('n', "'s", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', options)
map('n', "'a", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', options)

map('n', "'t", '<cmd>lua require("harpoon.term").gotoTerminal(1)<cr>', options)
