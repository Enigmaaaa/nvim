local map_options ={}

function map_options:new()
    local instance={
        mode = nil,
        lhs = nil,
        rhs = nil,
        options = {
            noremap = false,
            silent = false,
            expr = false,
            nowait = false
        }
    }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

function map_options:mode(mode_string)
    local _mode = function ()
        self.mode = mode_string
        return self
    end
    return _mode
end

function map_options:from(lhs)
    local _from = function ()
        self.lhs = lhs
        return self
    end
    return _from
end

function map_options:to(rhs)
    local _to = function ()
        self.rhs = rhs
        return self
    end
    return _to
end

function map_options:to_cr(rhs_string)
    local _to_cr = function ()
        self.rhs = ("<Cmd>%s<CR>"):format(rhs_string)
        return self
    end
    return _to_cr
end

function map_options:silent()
    self.options.silent = true
    return self
end

function map_options:noremap()
    self.options.noremap = true
    return self
end

function map_options:expr()
    self.options.expr = true
    return self
end

function map_options:nowait()
    self.options.nowait = true
    return self
end


--[[ 
map(mode('n'), from('a'), to('asdf'))
 ]]
local map = function(...)
    local result = map_options:new()
    for _, value in pairs(...) do
        result:value()
    end
end

local nvim_load_mapping = function(mapping)
    for _, value in pairs(mapping) do
        if type(value) =='table'then
            local mode = value.mode
            local lhs = value.lhs
            local rhs = value.rhs
            local opt = value.options
            vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
        end
    end
end


return {map, nvim_load_mapping}
