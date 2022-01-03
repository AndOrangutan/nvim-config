local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

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
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' }, -- For luasnip users.
        --{ name = 'cmp-git'}
        { name = 'treesitter' },
        { name = 'calc' },
        { name = 'latex_symbols' },
        { name = '' },
        { name = '' },
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

-- Inside lsp.lua
---- Setup lspconfig. 
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--}

MAPX.imap("<Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", "Snippet Jump", "expr")
MAPX.inoremap("<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", "Snippet UnJump")
MAPX.snoremap("<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", "Snippet Jump")
MAPX.snoremap("<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", "Snippet UnJump")
MAPX.imap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", "Snippet ???")
MAPX.smap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", "Snippet ????")

