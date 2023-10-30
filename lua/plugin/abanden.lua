local bind = require('keymap.bind')
return {
        'terryma/vim-expand-region',
        vscode = true,
        cond = false,
        -- kyes = {
        --     { '<CR>', '<Plug>(expand_region_expand)', desc = "expand region" },
        --     { '<BS>', '<Plug>(expand_region_shrink)', desc = "shrink region" },
        -- },
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
            bind.nvim_load_mapping(
                {
                    ["|<CR>"] = bind.map_keys("<Plug>(expand_region_expand)"):with_noremap():with_silent(),
                    ["|<BS>"] = bind.map_keys("<Plug>(expand_region_shrink)"):with_noremap():with_silent(),
                }
            )
        end
    }