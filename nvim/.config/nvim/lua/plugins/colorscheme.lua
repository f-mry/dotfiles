local g = vim.g

g.tokyonight_style = 'night'
g.tokyonight_sidebars = { "qf", "fugitive", "terminal", "packer", "netrw" }

require 'ayu'.setup({
  overrides = function()
    if vim.o.background == 'dark' then
      return { Cursor = {bg = '#FFFFFF', fg = '#000000'} }
    else
      return { Cursor = {bg = '#000000', fg = '#FFFFFF'} }
    end
  end
})
