require('impatient')
require('options')
require('keymaps')

local cmd = vim.cmd
local vim = vim
local create_cmd = vim.api.nvim_create_user_command


create_cmd('PackerInstall', function()
  cmd [[packadd packer.nvim]]
  require('plugins').install()
end, {})
create_cmd('PackerUpdate', function()
  cmd [[packadd packer.nvim]]
  require('plugins').update()
end, {})
create_cmd('PackerSync', function()
  cmd [[packadd packer.nvim]]
  require('plugins').sync()
end, {})
create_cmd('PackerClean', function()
  cmd [[packadd packer.nvim]]
  require('plugins').clean()
end, {})
create_cmd('PackerCompile', function()
  cmd [[packadd packer.nvim]]
  require('plugins').compile()
end, {})
create_cmd('PackerStatus', function()
  cmd [[packadd packer.nvim]]
  require('plugins').status()
end, {})
