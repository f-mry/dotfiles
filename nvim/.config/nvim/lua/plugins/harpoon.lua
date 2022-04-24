local map = vim.api.nvim_set_keymap

local options = {noremap = true}
map('n', ';;f', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', options)

map('n', ';;a', '<cmd>lua require("harpoon.mark").add_file()<cr>', options)

map('n', ';;j', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', options)
map('n', ';;k', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', options)
map('n', ';;l', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', options)
map('n', ';;;', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', options)

map('n', ';;<space>', '<cmd>lua require("harpoon.ui").nav_next()<cr>', options)
