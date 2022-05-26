

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup()


nnoremap("<C-n>", "<cmd>:NvimTreeToggle<CR>", "Tree Toggle")
nnoremap("<leader>r", "<cmd>:NvimTreeRefresh<CR>", "Tree Refresh")
nnoremap("<leaader>n", "<cmd>:NvimTreeFindfile<CR>", "Tree Find File")
