
nnoremap("Q", "<cmd>write|bdelete!<cr>", "Close Current Buffer")

MAPX.nname("<M->", "Alt")
nnoremap("<M-h>", "<C-w>h", "Navigate to Left Buffer")
nnoremap("<M-j>", "<C-w>j", "Navigate to Bellow Buffer")
nnoremap("<M-k>", "<C-w>k", "Navigate to Above Buffer")
nnoremap("<M-l>", "<C-w>l", "Navigate to Right Buffer")

nnoremap("td", ":call TabSpaceDouble()<cr>", "Double Tab Spacing")
nnoremap("th", ":call TabSpaceHalve()<cr>", "Halve Tab Spacing")

nnoremap("gx", ":call HandleURL()<cr>", "Open Link")

nnoremap("j", "gj", "Intuitive Wrap Jump")
nnoremap("k", "gk", "Intuitive Wrap Kick")
