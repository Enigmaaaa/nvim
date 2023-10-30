local map = require('keymap.bind').map

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- map("n","<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files (root dir)" })
