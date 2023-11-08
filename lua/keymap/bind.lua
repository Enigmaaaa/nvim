local M = {}

-- Wrapper around vim.keymap.set that will
-- not create a keymap if a lazy key handler exists.
-- It will also set `silent` to true by default.
---comment
---@param mode string|table
---@param lhs string
---@param rhs string
---@param opts string|table
function M.map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    local modes = type(mode) == "string" and { mode } or mode
    -- do not create the keymap if a lazy keys handler exists

    ---@param m string
    modes = vim.tbl_filter(function(m)
        return not (keys.have and keys:have(lhs, m))
    end, modes)

    -- do not create the keymap if a lazy keys handler exists
    if #modes > 0 then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

---comment
---@param mode string|table
---@param lhs string
---@param cmd_string string
---@param opts string|table
function M.map_cu(mode, lhs, cmd_string, opts)
    local cmd = ("<Cmd>%s<CR>"):format(cmd_string)
    M.map(mode, lhs, cmd, opts)
end

return M
