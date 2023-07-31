local global = require('core.global')
local bind = require('keymap.bind')

vim.g.mapleader = " "
vim.cmd('source ' .. global.lua_config_dir .. global.sep .. 'keymap' .. global.sep .. 'mapping.vim')

-- global:load_in_vscode(function ()
--     bind.nvim_load_mapping(require('keymap.vscode'))
-- end)

