--nnoremap("n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR> | <Cmd>lua require('hlslens').start()<CR>", "Jump Last Pattern", {silent = true})
--nnoremap("N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR> | <Cmd>lua require('hlslens').start()<CR>", "Kick Last Pattern", {silent = true})
--nnoremap("*", "*<Cmd>lua require('hlslens').startup()<CR>", "??? HLSLEN")
--nnoremap("#", "#<Cmd>lua require('hlslens').startup()<CR>", "??? HLSLEN")
--nnoremap("g*", "g*<Cmd>lua require('hlslens').startup()<CR>", "??? HLSLEN")
--nnoremap("g#", "g*<Cmd>lua require('hlslens').startup()<CR>", "??? HLSLEN")
vim.cmd[[
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>
]]
