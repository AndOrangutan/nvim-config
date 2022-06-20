
local wk = require("which-key")

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

require("nvim-autopairs").setup({
    disable_filetype = { "fzf" },
    enable_check_bracket_line = true,
    check_ts = true,
    fast_wrap = {},
})

wk.register({
    ["<M-e>"] = { "Autopairs Fastwrap" },
})
