local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_keys = bind.map_keys

return {
    ["n|/"] = map_cu("call VSCodeNotify('actions.find')"):with_noremap():with_silent():with_desc("setting find in vscode"),
    ["n|=="] = map_cu("call VSCodeNotify('editor.action.formatDocument')"):with_noremap():with_silent():with_desc("setting formating in vscode"),
    ["n|?"] = map_keys("/"):with_noremap():with_silent():with_desc("setting villina nvim search")
}

