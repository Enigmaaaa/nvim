local M = {}

---comment
---@param mode string|table
---@param lhs string
---@param rhs string
---@param opts string|table
function M.map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
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
    local cmd = (":<C-u>%s<CR>"):format(cmd_string)
    M.map(mode, lhs, cmd, opts)
end

return M
