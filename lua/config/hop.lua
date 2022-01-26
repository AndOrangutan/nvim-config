require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
MAPX.nname('<leader><leader>','Hop')
nnoremap('<leader><leader>w', ":HopWord<cr>", "Hop Word")
nnoremap('<leader><leader>l', ":HopLine<cr>", "Hop Line")
nnoremap('<leader><leader>c', ":HopChar1<cr>", "Hop Char")
nnoremap('<leader><leader>p', ":HopPattern<cr>", "Hop Pattern")
