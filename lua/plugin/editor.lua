-- local bind = require('keymap.bind')
local global = require('core.global')

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
        enabled = true,
        keys = function()
            local ret = {}
            for _, key in ipairs({ "f", "F", "t", "T" }) do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
            end
            return ret
        end,
        opts = { labeled_modes = "nx" },
    },
    {
        "ggandor/leap.nvim",
        enabled = true,
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
            -- vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
        end,
    },

    -- makes some plugins dot-repeatable like leap
    { "tpope/vim-repeat", event = "VeryLazy" },
    -- { 'machakann/vim-sandwich' },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'terryma/vim-expand-region',
        kyes = {
            { '<CR>', '<Plug>(expand_region_expand)', desc = "expand region" },
            { '<BS>', '<Plug>(expand_region_shrink)', desc = "shrink region" },
        },
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
        end
    },
    -- {
    --     "gbprod/yanky.nvim",
    --     dependencies = { { "kkharji/sqlite.lua", enabled = not global.is_windows } },
    --     opts = function()
    --         local mapping = require("yanky.telescope.mapping")
    --         local mappings = mapping.get_defaults()
    --         mappings.i["<c-p>"] = nil
    --         return {
    --             highlight = { timer = 200 },
    --             ring = { storage = global.is_windows and "shada" or "sqlite" },
    --             picker = {
    --                 telescope = {
    --                     use_default_mappings = false,
    --                     mappings = mappings,
    --                 },
    --             },
    --         }
    --     end,
    --     keys = {
    --         -- stylua: ignore
    --         { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
    --         { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    --         { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
    --         { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    --         { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
    --         { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
    --         { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
    --         { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    --         { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    --         { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    --         { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    --         { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    --         { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
    --         { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
    --         { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    --         { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
    --         { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    --         { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    --     },
    -- },
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
