vim.cmp[[set completeopt=menu,menuone,noselect]]

local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function (args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            border = "solid",   -- TODO: Double check
            --border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        },
       completion = {
            border = "solid",
            --border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        },
    },

})
