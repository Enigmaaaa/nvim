-- My NeoVim Setting writen in lua
local fn = vim.fn
local api = vim.api

--[[ 
Install packer by git:

In powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

In Linux
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ]]

--  Auto Install packer
local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(packer_install_dir)) > 0 then
    local plug_url_format = 'https://github.com/%s'
    local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
    local install_cmd = string.format('!git clone --depth=1 %s %s', packer_repo, packer_install_dir)
    api.nvim_command(install_cmd)
end

load_in_vscode = function(...)
    local funcs = {...}
    if vim.g.vscode then
        for key, value in pairs(funcs) do
            value()
        end
    end
end

load_in_nvim = function(...)
    local funcs = {...}
    if not vim.g.vscode then
        for key, value in pairs(funcs) do
            value()
        end
    end
end

printt = function (table)
    for key, value in pairs(table) do
        print(("%s --> %s"):format(key, value))
    end
end
-- if not vim.g.vscode then
--     require("core")
-- end

vim.cmd [[packadd packer.nvim]]
require 'plugins'