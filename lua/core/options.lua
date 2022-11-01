require("nvim_init")
local global = require("core.global")

local function bind_option(options)
    for k, v in pairs(options) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd("set no" .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end

local function load_options(options)
    for name, value in pairs(options) do
        vim.opt[name] = value
    end
end

local function loading_in_nvim()
    local global_local = {
        fileencodings="utf-8,ucs-bom,gb18030,gbk,gb2312",
        encoding = "utf-8",
        relativenumber = true,
        cursorline = true,
        autoindent = true,
        expandtab = true,
        tabstop = 4,
        shiftwidth = 4,
        -- some new
        history = 1000,
    }
    load_options(global_local)
end

load_in_nvim(loading_in_nvim)
