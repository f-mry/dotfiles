local plugin = require('me.packer').register_plugin
local conf = require('modules.treesitter.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })
