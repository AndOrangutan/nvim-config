--local pequire = require("utils").pequire
local wk = require("which-key")



vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.spell = true


--nnoremap("<leader>s", "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle")

vim.cmd[[
set breakindent breakindentopt=sbr,list:-1 linebreak
" this should be set up per filetype probably
let &formatlistpat = '^line\s\+\d\+:\s*'
]]



wk.register({
    ["<c-p>"] = { "<cmd>PasteImg<cr>", ".md Paste Image" },
    ["j"] = { "gj", ".md Wrap [J]ump" },
    ["k"] = { "gk", ".md Wrap [K]ick" },
    ["^"] = { "g^", ".md Wrap Start" },
    ["0"] = { "g0", ".md Wrap Beginning" },
    ["$"] = { "g$", ".md Wrap End" },
    ["<CR>"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "ZK Follow Link"},
})
