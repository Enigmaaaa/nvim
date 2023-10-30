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

local function loading_in_all()
    load_options({
        -- clipboard = "unnamedplus", -- 与系统剪贴板同步。
        ignorecase = true,         -- 搜索时忽略大小写。
        smartcase = true,          --当有大写字母时不忽略大小写

    })
end

local function loading_in_nvim()
    load_options({
        fileencodings = "utf-8,ucs-bom,gb18030,gbk,gb2312",
        encoding = "utf-8",
        relativenumber = true, -- 显示相对行号
        cursorline = true,     -- 高亮当前行

        expandtab = false,     -- 使用空格代替制表符
        tabstop = 4,           -- 制表符代表的空格数
        autoindent = true,     -- 自动缩进
        shiftwidth = 4,        -- 缩进为2
        smarttab = true,       -- 智能制表符
        softtabstop = 2,       -- 在插入模式下按退格键时，制表符代表的空格数。
        -- some new
        pumblend = 10,         -- 出窗口的透明度
        pumheight = 10,        -- 弹出窗口的最大条目数
        list = true,           -- 显示一些不可见的字符
        -- listchars = 'tab:|\\ ,trail:▫', -- 设置不可见字符的显示方式
        scrolloff = 4,         -- 滚动时上下保持的行数
        -- warp = true,           -- 启用软换行
        splitright = true,     -- 新窗口在当前窗口右侧
        splitbelow = true,     -- 新窗口在当前窗口下方
        colorcolumn = '100',   -- 在第100列显示一个颜色标记
        history = 1000,
        spelllang = { "en" },
        completeopt = "menu,menuone,noselect",
        termguicolors = true
    })
end

local function loading_in_vscode()
    load_options({})
end

local function loading_in_neovide()
    load_options({})
end

require('core.utils'):load_config({
    loading_in_all,
    { loading_in_nvim,    not global.is_vscode },
    { loading_in_vscode,  global.is_vscode },
    { loading_in_neovide, global.is_neovide },
})
