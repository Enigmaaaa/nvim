local global = require('core.global')
local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_keys = bind.map_keys

return {
    ['n|<C-j>'] = map_keys('<C-d>'):with_noremap():with_silent(),
    ['n|<C-k>'] = map_keys('<C-u>'):with_noremap():with_silent(),
    
    ['n|>'] = map_keys('>>'):with_noremap():with_silent(),
    ['n|<'] = map_keys('<<'):with_noremap():with_silent(),
    ['v|>'] = map_keys('>gv'):with_noremap():with_silent(),

    ['E'] = map_keys('gT'):with_noremap():with_silent(),
}
