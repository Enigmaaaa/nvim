--- @class global
local global = {}

function global:load_variables()
    local path_sep = self.is_windows and "\\" or "/"
    --- @type string
    local os_name = vim.loop.os_uname().sysname
    self.sep = path_sep

    self.is_mac = os_name == "Darwin"
    self.is_linux = os_name == "Linux"
    self.is_windows = os_name:match('Windows') == "Windows"
    self.is_wsl = vim.fn.has("wsl") == 1

    self.is_vscode = vim.g.vscode
    self.is_neovide = vim.g.neovide

    self.vim_config_dir = vim.fn.stdpath("config")
    self.lua_config_dir = self.vim_config_dir .. path_sep .. "lua"
    self.vim_data_dir = vim.fn.stdpath("data")
    self.data_dir = vim.fn.stdpath("data")

    local home =
        self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
    self.cache_dir =
        home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
    self.home = home
end

global:load_variables()
return global
