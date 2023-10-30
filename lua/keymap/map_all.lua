local global = require('core.global')
local map = require('keymap.bind').map
local map_cu = require('keymap.bind').map_cu

-- crouse
map({ "n", "v", "o" }, "<C-j>", "<C-d>", { noremap = true, silent = true, desc = "Scroll crourse down" })
map({ "n", "v", "o" }, "<C-k>", "<C-u>", { noremap = true, silent = true, desc = "Scroll crourse up" })

-- Index of keymaps
map("n", ">", ">>", { noremap = true, silent = true, desc = "Indent right" })
map("n", "<", "<<", { noremap = true, silent = true, desc = "Indent left" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right" })
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left" })

-- windows
map_cu("n", "E", "tabprevious", { desc = "Previous tab" })
map_cu("n", "R", "tabnext", { desc = "Next tab" })

--oprator
map('o', 'h', '^', { noremap = true, silent = true, desc = "to first char" })
map('o', 'l', '$', { noremap = true, silent = true, desc = "to last char" })
map('o', 'w', 'iw', { noremap = true, silent = true, desc = "select word" })
map('o', '9', 'i(', { noremap = true, silent = true, desc = "select ()" })
map('o', '0', 'i)', { noremap = true, silent = true, desc = "select ()" })
map('o', '[', 'i[', { noremap = true, silent = true, desc = "select []" })
map('o', ']', 'i]', { noremap = true, silent = true, desc = "select []" })
map('o', '{', 'i{', { noremap = true, silent = true, desc = "select {}" })
map('o', '}', 'i}', { noremap = true, silent = true, desc = "select {}" })
map('v', 'w', 'iw', { noremap = true, silent = true, desc = "select word" })
map('v', '9', 'i(', { noremap = true, silent = true, desc = "select ()" })
map('v', '0', 'i)', { noremap = true, silent = true, desc = "select ()" })
map('v', '[', 'i[', { noremap = true, silent = true, desc = "select []" })
map('v', ']', 'i]', { noremap = true, silent = true, desc = "select []" })
map('v', '{', 'i{', { noremap = true, silent = true, desc = "select {}" })
map('v', '}', 'i}', { noremap = true, silent = true, desc = "select {}" })

-- yank paset select
map({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
map({ "n", "v" }, "x", '"_x', { noremap = true, silent = true, desc = "Cut to blackhole register" })
map("n", "<leader>x", 'V"_x', { noremap = true, silent = true, desc = "Cut to blackhole register" })
map({ "n", "v" }, "daa", "vaad", { silent = true, desc = "Delete all" })
map({ "n", "v" }, "yaa", "vaay", { silent = true, desc = "Yank all" })
map({ "n", "v" }, "<leader>yaa", "vaa<leader>y", { silent = true, desc = "Yank all" })
map("v", "aa", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select all" })
