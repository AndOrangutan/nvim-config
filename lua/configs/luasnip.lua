local wk = require("which-key")

wk.register({
    --["<tab>"] = { [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']], "Luasnip Expand/Jump Next" },
    --["<s-tab>"] = { [[<cmd>lua require'luasnip'.jump(-1)<Cr>]], "Luasnip Jump Prev" },
    ["<c-e>"] = { [[luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']], "Luasnip Change Choice" },
},{ mode = "i" })


wk.register({
    --["<tab>"] = { [[<cmd>lua require('luasnip').jump(1)<Cr>]], "Luasnip Expand/Jump Next" },
    --["<s-tab>"] = { [[<cmd>lua require'luasnip'.jump(-1)<Cr>]], "Luasnip Jump Prev" },
    ["<c-e>"] = { [[luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']], "Luasnip Change Choice" },
},{ mode = "s" })

require("luasnip.loaders.from_vscode").lazy_load()
 
