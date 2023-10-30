local global = require('core.global')

---@class Utiles
local Utils = {}


---@param plugin string
function Utils.has(plugin)
    return require("lazy.core.config").spec.plugins[plugin] ~= nil
end
---MergeTables
---@param ... table[table]
---@return table
-- Example usage:
-- local table1 = { 1, 2, 3 }
-- local table2 = { 4, 5, 6 }
-- local table3 = { 7, 8, 9 }
-- local mergedTable = mergeTables(table1, table2, table3)
-- print(table.unpack(mergedTable)) -- Output: 1   2   3   4   5   6   7   8   9
function Utils.MergeTables(...)
    local result = {}
    for _, tbl in ipairs({ ... }) do
        for _, value in ipairs(tbl) do
            table.insert(result, value)
        end
    end
    return result
end


--- load config, if cond is nil or true, excude config function
---@param config function
---@param cond nil | boolean | function
---@return nil | any
function Utils:__load_config(config, cond)
    if cond == nil or cond == true then
        return config()
    elseif type(cond) == "function" then
        return cond() and config()
    end
end

--- load configs
---@param configs table [ function, nil | boolen | fuction]
function Utils:load_config(configs)
    for _, value in pairs(configs) do
        local value = type(value) == "function" and { value } or value
        self:__load_config(value[1], value[2])
    end
end

---@param ... function | table [ function]
---@return nil
function Utils:load_in_vscode(...)
    for _, value in pairs({ ... }) do
        self:__load_config(value(), global.is_vscode)
    end
end

---@param ... function | table [ function]
---@return nil
function Utils:load_in_nvim(...)
    for _, value in pairs({ ... }) do
        self:__load_config(value(), global.is_vscode)
    end
end

---@param table table
---@return nil
function printt(table)
    for key, value in pairs(table) do
        print(("%s --> %s"):format(key, value))
    end
end

---@param table table
---@param depth number
---@return nil
function PrintTableWithDepth(table, depth)
    if type(table) ~= "table" then
        print(table)
        return
    end

    depth = depth or 0

    for key, value in pairs(table) do
        local indent = string.rep("  ", depth)
        if type(value) == "table" then
            print(indent .. key .. " (table):")
            PrintTableWithDepth(value, depth + 1)
        else
            print(indent .. key .. ":", value)
        end
    end
end

return Utils