local global = require("core.global")
local icons = {
    kind = require("plugin.icons").get("kind"),
    documents = require("plugin.icons").get("documents"),
    ui = require("plugin.icons").get("ui"),
    ui_sep = require("plugin.icons").get("ui", true),
    misc = require("plugin.icons").get("misc"),
}

return {
    -- measure startuptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    -- Session management. This saves your session in the background,
    -- keeping track of open buffers, window arrangement, and more.
    -- You can restore sessions when returning through the dashboard.
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
        },
    },
    -- which-key helps you remember key bindings by showing a popup
    -- with the active keybindings of the command you started typing.
    {
        "folke/which-key.nvim",
        vscode = false,
        cond = not global.is_vscode,
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
            defaults = {
                mode = { "n", "v" },
                ["g"] = { name = "+goto" },
                ["gz"] = { name = "+surround" },
                ["]"] = { name = "+next" },
                ["["] = { name = "+prev" },
                ["<leader><tab>"] = { name = "+tabs" },
                ["<leader>b"] = { name = "+buffer" },
                ["<leader>c"] = { name = "+code" },
                ["<leader>f"] = { name = "+file/find" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>gh"] = { name = "+hunks" },
                ["<leader>q"] = { name = "+quit/session" },
                ["<leader>s"] = { name = "+search" },
                ["<leader>u"] = { name = "+ui" },
                ["<leader>w"] = { name = "+windows" },
                ["<leader>x"] = { name = "+diagnostics/quickfix" },
            },
            icons = {
                breadcrumb = icons.ui.Separator,
                separator = icons.misc.Vbar,
                group = icons.misc.Add,
            },
            popup_mappings = {
                scroll_down = "<c-j>", -- binding to scroll down inside the popup
                scroll_up = "<c-k>",   -- binding to scroll up inside the popup
            },
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for keymaps that start with a native binding
                i = { "j", "k" },
                v = { "j", "k" },
                n = { "<", ">" },
                o = { "<", ">" },
            },

        },
        config = function(_, opts)
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },
}
