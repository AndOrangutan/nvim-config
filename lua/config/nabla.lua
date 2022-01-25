
nnoremap("<F5>", ":lua require('nabla').action()<CR>", "Nabla Preview All Equations")
nnoremap("<leader>p", ":lua require('nabla').popup({ border = 'rounded' })<CR>", "Nabla Preview Popup", {silent = true})

vim.cmd[[au CursorHold *.md,*.markdown silent! lua require('nabla').popup({ border = 'rounded' })]]
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
