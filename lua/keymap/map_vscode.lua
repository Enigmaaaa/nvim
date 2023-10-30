local map_cu = require('keymap.bind').map_cu

map_cu("n", "/", "call VSCodeNotify('actions.find')",
    { noremap = true, silent = true, desc = "vscode default search" })
map_cu("n", "==", "call VSCodeNotify('editor.action.formatDocument')",
    { noremap = true, silent = true, desc = "formating" })
map_cu("n", "?", "/",
    { noremap = true, silent = true, desc = "villina nvim search" })
map_cu("n", "E", "call VSCodeNotify('workbench.action.previousEditorInGroup')",
    { noremap = true, silent = true, desc = "previous tab" })
map_cu("n", "R", "call VSCodeNotify('workbench.action.nextEditorInGroup')",
    { noremap = true, silent = true, desc = "next tab" })
