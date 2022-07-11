local config = {}

function config.nvim_treesitter()
  require('nvim-treesitter.configs').setup({
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
end

return config
