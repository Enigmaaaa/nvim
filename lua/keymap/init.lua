local global = require('core.global')

-- vim.g.mapleader = " "
-- locatied at core.init.lua

require("keymap.map_all")
if global.is_vscode then
    require("keymap.map_vscode")
elseif not global.is_vscode then
    require('keymap.map_nvim')
end