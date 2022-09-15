local map = vim.api.nvim_set_keymap

local options = {noremap = true}
map('n', "<leader><leader>h", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', options)

map('n', "<leader><leader><leader>", '<cmd>lua require("harpoon.mark").add_file()<cr>', options)

map('n', "<leader><leader>f", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', options)
map('n', "<leader><leader>d", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', options)
map('n', "<leader><leader>s", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', options)
map('n', "<leader><leader>a", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', options)


