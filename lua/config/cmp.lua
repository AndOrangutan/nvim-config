local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
    buffer          = "[Buff]",
    calc            = "[Calc]",
    nvim_lsp        = "[LSP ]",
    path            = "[Path]",
    treesitter      = "[Tree]",
    luasnip         = "[Snip]",
    spell           = "[Spll]",
    nuspell         = "[Nusp]",
    nvim_lua        = "[NAPI]",
    latex_symbols   = "[Ltex]",
    neorg           = "[Norg]",
    cmp_tabnine     = "[Tab9]",
    fuzzy_path      = "[FPth]",
    cmp_git         = "[Git ]",
    dictionary      = "[Dict]",
}

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'neorg'},
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'cmp-git' },
        { name = 'path' },
        { name = 'treesitter' },
        { name = 'calc' },
        { name = 'buffer' }
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        fields = {"abbr", "kind", "menu"},
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
            vim_item.menu = (source_mapping)[entry.source.name]
            return vim_item
        end
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
vim.cmd[[ 
autocmd FileType markdown,pandoc,tex,norg lua require('cmp').setup.buffer { sources = { { name = 'neorg'}, { name = 'luasnip' }, { name = 'treesitter' }, { name = 'nvim_lsp' }, { name = 'dictionary', keyword_length = 2 }, { name = 'path' }, { name = 'latex_symbols' } } } 
]]
-- Inside lsp.lua
---- Setup lspconfig. 
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--}

require("cmp_dictionary").setup({
    dic = {
        ["*"] = { "/usr/share/dict/words/american_english.dic" },
        ["lua"] = "path/to/lua.dic",
        ["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
        filename = {
            ["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
        },
        filepath = {
            ["%.tmux.*%.conf"] = "path/to/tmux.dic"
        },
    },
    -- The following are default values, so you don't need to write them if you don't want to change them
    exact = 2,
    first_case_insensitive = false,
    async = false, 
    capacity = 5,
    debug = false, 
})

require("cmp_git").setup()
