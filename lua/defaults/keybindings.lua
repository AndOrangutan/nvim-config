local pequire = require("utils").pequire
local wk = pequire("which-key")

wk.register({
    ["<M->"] = { name = "Alt"},
    ["<M-h>"] = { "<C-w>h", "Navigate to Left Buffer"},
    ["<M-j>"] = { "<C-w>j", "Navigate to Bellow Buffer"},
    ["<M-k>"] = { "<C-w>k", "Navigate to Above Buffer"},
    ["<M-l>"] = { "<C-w>l", "Navigate to Right Buffer"},

    ["Q"] = { "<cmd>write|bdelete!<cr>", "Close Current Buffer"},

    ["td"] = { ":call TabSpaceDouble()<cr>", "Double Tab Spacing"},
    ["th"] = { ":call TabSpaceHalve()<cr>", "Halve Tab Spacing"},

    ["gx"] = { ":call HandleURL()<cr>", "Open Link"},
}, {})


