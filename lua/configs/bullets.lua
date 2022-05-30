local wk = require("which-key")

vim.cmd[[

let g:bullets_set_mappings = 1 " default = 1
let g:bullets_checkbox_markers = ' .oOX'
]]


wk.register({
    ["<CR>"] = { "Bullets Insert Bullet" },
    ["C-CR"] = { "Bullets Insert Bullet" },
    ["C-D"] = { "Bullets Promote Bullet" },
    ["C-T"] = { "Bullets Demote Bullet" },
}, { mode = "i" })


wk.register({
    ["o"] = { "Bullets Insert Bullet" },
    ["gN"] = { "Bullets Renumber List"},
    ["<leader>x"] = { "Bullets Toggle Checkbox"},
    [">>"] = { "Bullets Promote Unindent"},
    ["<<"] = { "Bullets Demote Indent"},
}, { mode = "n" })


wk.register({
    ["gN"] = { "Bullets Renumber Selected" },
    [">"] = { "Bullets Promote Unindent" },
    ["<"] = { "Bullets Demote Unindent" },
}, { mode = "v" })
