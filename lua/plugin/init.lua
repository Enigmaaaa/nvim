local global = require('core.global')
local icons = {
    kind = require("icons").get("kind"),
    documents = require("icons").get("documents"),
    ui = require("icons").get("ui"),
    ui_sep = require("icons").get("ui", true),
    misc = require("icons").get("misc"),
}

local lazypath = global.data_dir .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

local function load_plugins(plugins_table)
    local list = {}
    for _, plugins in pairs(plugins_table) do
        for _, plugin in pairs(plugins) do
            table.insert(list, plugin)
            -- list[#list + 1] = plugin
        end
    end
    return list
end

local lazy_setting = {
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        colorscheme = { "catppuccin" },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.88, height = 0.8 },
        wrap = true, -- wrap the lines in the ui
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",
        icons = {
            cmd = icons.misc.Code,
            config = icons.ui.Gear,
            event = icons.kind.Event,
            ft = icons.documents.Files,
            init = icons.misc.ManUp,
            import = icons.documents.Import,
            keys = icons.ui.Keyboard,
            loaded = icons.ui.Check,
            not_loaded = icons.misc.Ghost,
            plugin = icons.ui.Package,
            runtime = icons.misc.Vim,
            source = icons.kind.StaticMethod,
            start = icons.ui.Play,
            list = {
                icons.ui_sep.BigCircle,
                icons.ui_sep.BigUnfilledCircle,
                icons.ui_sep.Square,
                icons.ui_sep.ChevronRight,
            },
        },
    },
}

local plugins_tables = {
    require('plugin.util'),
    require('plugin.plugins'),
}

require('lazy').setup(load_plugins(plugins_tables), lazy_setting)

vim.opt.rtp:prepend(lazypath)
