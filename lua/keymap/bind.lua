local rhs_options ={}

function rhs_options:new()
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

function rhs_options:mode(mode_string)
    self.mode = mode_string
    return self
end

function rhs_options:from(lhs)
    self.lhs = lhs
    return self
end

function rhs_options:to(rhs)
    self.rhs = rhs
    return self
end

function rhs_options:to_cr(rhs_string)
    self.rhs = ("<Cmd>%s<CR>"):format(rhs_string)
    return self
end

function rhs_options:silent()
    self.options.silent = true
    return self
end

function rhs_options:noremap()
    self.options.noremap = true
    return self
end

function rhs_options:expr()
    self.options.expr = true
    return self
end

function rhs_options:nowait()
    self.options.nowait = true
    return self
end

local map = function(mode)
    return rhs_options:new():mode(mode)
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