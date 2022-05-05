
local pequire = require("utils").pequire
local wk = pequire("which-key")

pequire("trouble").setup {
    use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

wk.register({
    ["<leader>x"] = { name = "Trouble" },
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Trouble Toggle"},
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble Tggl Wkspc Diag"},
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble Tggl Doc Diag"},
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "Trouble Tggl QuickFix"},
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", "Trouble Tggl QuickFix"},
}, {})
