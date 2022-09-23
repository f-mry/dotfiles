vim.o.relativenumber = true
vim.o.number = true

vim.o.cmdheight = 0
vim.o.laststatus = 0

local map = vim.api.nvim_set_keymap
map('n', 'q', '<cmd>quit<cr>', {noremap = true})
map('n', 'i', '<cmd>echo "no insert allowed"<cr>', {noremap = true})
map('n', 'y', '"+y', {noremap = true})
map('v', 'y', '"+y', {noremap = true})
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank({timeout=50})')


