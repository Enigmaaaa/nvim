local icons = {
    kind = require("plugin.icons").get("kind"),
    documents = require("plugin.icons").get("documents"),
    ui = require("plugin.icons").get("ui"),
    ui_sep = require("plugin.icons").get("ui", true),
    misc = require("plugin.icons").get("misc"),
}
return {
    -- makes some plugins dot-repeatable like leap
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                icons = {
                    breadcrumb = icons.ui.Separator,
                    separator = icons.misc.Vbar,
                    group = icons.misc.Add,
                },
            })
        end,
    },
}
