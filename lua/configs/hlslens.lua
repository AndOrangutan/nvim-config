local wk = require("which-key")

require('hlslens').setup({
    calm_down = true,
    nearest_only = true,
    --nearest_float_when = 'always'
})

wk.register({
    ["n"] = { [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], "Go to next match" },
    ["N"] = { [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], "Go to prev match" },
    ["*"] = { [[*<Cmd>lua require('hlslens').start()<CR>]], "Search word under cursor backwards" },
    ["#"] = { [[#<Cmd>lua require('hlslens').start()<CR>]], "Search word under cursor forwards" },
    ["g*"] = { [[g*<Cmd>lua require('hlslens').start()<CR>]], "Search word under cursor backwards" },
    ["g#"] = { [[g#<Cmd>lua require('hlslens').start()<CR>]], "Search word under cursor forwards" },
    ["<leader>l"] = { ":noh<cr>", "Clear search highlight" },
})
