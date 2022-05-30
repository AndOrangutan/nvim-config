local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

-- Setup nvim-cmp.
local cmp = require('cmp')


local kind_icons = {
    Text            = " ",
    Method          = " ",
    Function        = " ",
    Constructor     = "ﰕ ",
    Field           = "ﰠ ",
    Variable        = " ",
    Class           = "ﴯ ",
    Interface       = " ",
    Module          = " ",
    Property        = " ",
    Unit            = "塞",
    Value           = " ",
    Enum            = " ",
    Keyword         = "廓",
    Snippet         = " ",
    Color           = " ",
    File            = " ",
    Reference       = " ",
    Folder          = " ",
    EnumMember      = " ",
    Constant        = " ",
    Struct          = "פּ ",
    Event           = " ",
    Operator        = " ",
    TypeParameter   = "",
}


local source_mapping = {
    buffer                  = "Buffer",
    calc                    = "Calculate",
    nvim_lsp                = "LSP",
    path                    = "Path",
    treesitter              = "Treesitter",
    luasnip                 = "Snippets",
    spell                   = "Spell",
    nvim_lua                = "Neovim API",
    latex_symbols           = "Latex",
    cmp_git                 = "Git",
    dictionary              = "Dicitonary",
    tmux                    = "Tmux",
    rg                      = "Ripgrep",
    nvim_lsp_signature_help = "Signature",
    pandoc_references       = "Pandoc",
    npm                     = "NPM",
}

cmp.setup({
    experimental = {
        ghost_text = true,
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.menu = source_mapping[entry.source.name]
            vim_item.kind = kind_icons[vim_item.kind]
            return vim_item
        end,
    },
    view = {
        entries = {name = "custom", selection_order = "near_cursor" },
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.sort_text,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_next_item()
          elseif luasnip and luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "path" },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'treesitter' },
        { name = 'git' },
        { name = 'tmux',
            option = {
                all_panes = true,
            },
        },
        { name = 'rg' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = "latex_symbols" },
        { name = 'calc' },
        { name = 'pandoc_references' },
        { name = "dictionary", keyword_length = 2 },
        { name = 'npm', keyword_length = 4 },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'cmdline_history' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' },
        { name = 'path' },
        --{ name = 'cmdline_history' },
    }, {
        { name = 'cmdline' }
    })
})

cmp.setup.cmdline('?', {
    sources = {
        --{ name = 'cmdline_history' },
    },
})


cmp.setup.cmdline('@', {
    sources = {
        --{ name = 'cmdline_history' },
    },
})

require("cmp_git").setup()
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
