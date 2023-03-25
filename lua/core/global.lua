local global = {}
local os_name = vim.loop.os_uname().sysname

function global:load_variables()
    local path_sep = self.is_windows and "\\" or "/"
    self.sep = path_sep

    self.is_mac = os_name == "Darwin"
    self.is_linux = os_name == "Linux"
    self.is_windows = os_name:match('Windows') == "Windows"
    self.is_vscode = vim.g.vscode

    self.vim_config_dir = vim.fn.stdpath("config")
    self.lua_config_dir = self.vim_config_dir .. path_sep .. "lua"
    self.vim_data_dir = vim.fn.stdpath("data")
    self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))

    local home =
        self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
    self.cache_dir =
        home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
    self.home = home
end

global:load_variables()

---@param ... function | table[ function]
---@return nil
function global:load_in_vscode(...)
    local funcs = {...}
    if vim.g.vscode then
        for key, value in pairs(funcs) do
            value()
        end
    end
end

---@param ... function | table[ function]
---@return nil
function global:load_in_nvim(...)
    local funcs = {...}
    if not vim.g.vscode then
        for key, value in pairs(funcs) do
            value()
        end
    end
end

---@param table table
---@return nil
function global:printt(table)
    for key, value in pairs(table) do
        print(("%s --> %s"):format(key, value))
    end
end

return global
