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


Printt = function (table)
    for key, value in pairs(table) do
        print(("%s --> %s"):format(key, value))
    end
end