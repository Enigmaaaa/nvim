local global = require('core.global')
local bind = require('keymap.bind')
local icons = {
    kind = require("icons").get("kind"),
    documents = require("icons").get("documents"),
    ui = require("icons").get("ui"),
    ui_sep = require("icons").get("ui", true),
    misc = require("icons").get("misc"),
}
return {
    {
        -- 'justinmk/vim-sneak',
        -- config = function ()
        --     api.nvim_set_keymap('n', 'f', '<Plug>Sneak_s', {noremap = true})
        --     api.nvim_set_keymap('n', 'F', '<Plug>Sneak_S', {noremap = true})
        --     api.nvim_set_keymap('n', 't', 'f', {noremap = true})
        --     api.nvim_set_keymap('n', 'T', 'F', {noremap = true})
        -- end
    },
    {
        "ggandor/flit.nvim",
        keys = { f = 't', F = 'T', },
        opts = { labeled_modes = "nx" },
    },
    {
        "ggandor/leap.nvim",
        keys = {
            { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },
    { 'machakann/vim-sandwich' },
    {
        'terryma/vim-expand-region',
        config = function()
            vim.g.expand_region_text_objects = {
                ['iw'] = 0,
                ['i"'] = 0,
                ["i'"] = 0,
                ['i]'] = 1,
                ['ib'] = 1,
                ['iB'] = 1,
                ['il'] = 0,
                ['ip'] = 0,
                ['ie'] = 0,
            }
            bind.nvim_load_mapping({
                ['|<CR>'] = bind.map_keys('<Plug>(expand_region_expand)'):with_silent(),
                ['|<BS>'] = bind.map_keys('<Plug>(expand_region_shrink)'):with_silent(),
            })
        end
    },
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
    {
        "ybian/smartim",
        event = { "InsertEnter" },
        config = function()
            -- default IME mode
            vim.g.smartim_default = "com.apple.keylayout.ABC"
        end,
        enabled = global.is_mac
    },
    {
        "Neur1n/neuims",
        enabled = global.is_windows
    }
}
