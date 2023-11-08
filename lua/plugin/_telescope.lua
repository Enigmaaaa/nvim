return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        -- or                              , branch = '0.1.x',
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            { "<leader>ff", function ()
                require('telescope.builtin').find_files()
            end ,             desc = "Find Files (cwd)" },
        }
    }
}
