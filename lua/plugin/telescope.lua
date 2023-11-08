local utils = require("plugin.utils")

local root = utils.get_root()

-- this will return a function that calls telescope.
-- cwd will default to lazyvim.util.get_root
-- for `files`, git_files or find_files will be chosen depending on .git
local function _telescope(builtin, opts)
    local params = { builtin = builtin, opts = opts }
    return function()
        builtin = params.builtin
        opts = params.opts
        opts = vim.tbl_deep_extend("force", { cwd = root }, opts or {})
        if builtin == "files" then
            if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
                opts.show_untracked = true
                builtin = "git_files"
            else
                builtin = "find_files"
            end
        end
        if opts.cwd and opts.cwd ~= vim.loop.cwd() then
            opts.attach_mappings = function(_, map)
                map("i", "<a-c>", function()
                    local action_state = require("telescope.actions.state")
                    local line = action_state.get_current_line()
                    _telescope(
                        params.builtin,
                        vim.tbl_deep_extend("force", {}, params.opts or {}, { cwd = false, default_text = line })
                    )()
                end)
                return true
            end
        end

        require("telescope.builtin")[builtin](opts)
    end
end

-- fuzzy finder
return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = vim.fn.executable("make") == 1,
                config = function()
                    utils.on_load("telescope.nvim", function()
                        require("telescope").load_extension("fzf")
                    end)
                end,
            },
        },
        branch = '0.1.x',
        keys = {
            { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>/", _telescope("live_grep"),                            desc = "Grep (root dir)" },
            { "<leader>:", "<cmd>Telescope command_history<cr>",               desc = "Command History" },
            {
                "<leader><space>",
                _telescope("files"),
                desc =
                "Find Files (root dir)"
            },
            -- find
            { "<leader>fb", "<cmd>Telescope buffers<cr>",                     desc = "Buffers" },
            {
                "<leader>ff",
                _telescope("files"),
                desc =
                "Find Files (root dir)"
            },
            { "<leader>fF", _telescope("files", { cwd = false }),             desc = "Find Files (cwd)" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                    desc = "Recent" },
            { "<leader>fR", _telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
            -- git
            { "<leader>gc", "<cmd>Telescope git_commits<CR>",                 desc = "commits" },
            { "<leader>gs", "<cmd>Telescope git_status<CR>",                  desc = "status" },
            -- search
            { '<leader>s"', "<cmd>Telescope registers<cr>",                   desc = "Registers" },
            { "<leader>sa", "<cmd>Telescope autocommands<cr>",                desc = "Auto Commands" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",   desc = "Buffer" },
            { "<leader>sc", "<cmd>Telescope command_history<cr>",             desc = "Command History" },
            { "<leader>sC", "<cmd>Telescope commands<cr>",                    desc = "Commands" },
            { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>",         desc = "Document diagnostics" },
            {
                "<leader>sD",
                "<cmd>Telescope diagnostics<cr>",
                desc =
                "Workspace diagnostics"
            },
            { "<leader>sg", _telescope("live_grep"),                  desc = "Grep (root dir)" },
            { "<leader>sG", _telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>",           desc = "Help Pages" },
            {
                "<leader>sH",
                "<cmd>Telescope highlights<cr>",
                desc =
                "Search Highlight Groups"
            },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>",                                  desc = "Key Maps" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>",                                desc = "Man Pages" },
            { "<leader>sm", "<cmd>Telescope marks<cr>",                                    desc = "Jump to Mark" },
            { "<leader>so", "<cmd>Telescope vim_options<cr>",                              desc = "Options" },
            { "<leader>sR", "<cmd>Telescope resume<cr>",                                   desc = "Resume" },
            { "<leader>sw", _telescope("grep_string", { word_match = "-w" }),              desc = "Word (root dir)" },
            { "<leader>sW", _telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
            {
                "<leader>sw",
                _telescope("grep_string"),
                mode = "v",
                desc = "Selection (root dir)"
            },
            {
                "<leader>sW",
                _telescope("grep_string", { cwd = false }),
                mode = "v",
                desc =
                "Selection (cwd)"
            },
            {
                "<leader>uC",
                _telescope("colorscheme", { enable_preview = true }),
                desc =
                "Colorscheme with preview"
            },
            {
                "<leader>ss",
                _telescope("lsp_document_symbols", {
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                }),
                desc = "Goto Symbol",
            },
            {
                "<leader>sS",
                _telescope("lsp_dynamic_workspace_symbols", {
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                }),
                desc = "Goto Symbol (Workspace)",
            },
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    i = {
                        ["<c-t>"] = function(...)
                            return require("trouble.providers.telescope").open_with_trouble(...)
                        end,
                        ["<a-t>"] = function(...)
                            return require("trouble.providers.telescope").open_selected_with_trouble(...)
                        end,
                        ["<a-i>"] = function()
                            local action_state = require("telescope.actions.state")
                            local line = action_state.get_current_line()
                            _telescope("find_files", { no_ignore = true, default_text = line })()
                        end,
                        ["<a-h>"] = function()
                            local action_state = require("telescope.actions.state")
                            local line = action_state.get_current_line()
                            _telescope("find_files", { hidden = true, default_text = line })()
                        end,
                        ["<C-Down>"] = function(...)
                            return require("telescope.actions").cycle_history_next(...)
                        end,
                        ["<C-Up>"] = function(...)
                            return require("telescope.actions").cycle_history_prev(...)
                        end,
                        ["<C-f>"] = function(...)
                            return require("telescope.actions").preview_scrolling_down(...)
                        end,
                        ["<C-b>"] = function(...)
                            return require("telescope.actions").preview_scrolling_up(...)
                        end,
                    },
                    n = {
                        ["q"] = function(...)
                            return require("telescope.actions").close(...)
                        end,
                    },
                },
            },
        },
    },
    -- Flash Telescope config
    {
        "nvim-telescope/telescope.nvim",
        optional = true,
        opts = function(_, opts)
            if not utils.has("flash.nvim") then
                return
            end
            local function flash(prompt_bufnr)
                require("flash").jump({
                    pattern = "^",
                    label = { after = { 0, 0 } },
                    search = {
                        mode = "search",
                        exclude = {
                            function(win)
                                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
                            end,
                        },
                    },
                    action = function(match)
                        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                        picker:set_selection(match.pos[1] - 1)
                    end,
                })
            end
            opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
                mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
            })
        end,
    },
}
