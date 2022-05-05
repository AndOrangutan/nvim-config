local pequire = require("utils").pequire
local wk = pequire("which-key")

wk.register({
    ["<CR>"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "ZK Follow Link"},
}, {})

nnoremap("P", "<cmd>PasteImg<cr>", "Paste Image")

vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.spell = true

nnoremap("j", "gj", "Intuitive Wrap Jump")
nnoremap("k", "gk", "Intuitive Wrap Kick")
nnoremap("^", "g^", "Intuitive Beggining of line")
nnoremap("0", "g0", "Intuitive Beggining of line")
nnoremap("$", "g$", "Intuitive Beggining of line")


nnoremap("<leader>s", "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle")

vim.cmd[[
set breakindent breakindentopt=sbr,list:-1 linebreak
" this should be set up per filetype probably
let &formatlistpat = '^line\s\+\d\+:\s*'
]]
