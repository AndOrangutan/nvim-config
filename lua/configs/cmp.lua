vim.cmd[[set completeopt=menu,menuone,noselect]]

local wk = require("which-key")
local cmp = require("cmp")
local luasnip = require("luasnip")


local kind_icons = {
    Text            = " ",
    Method          = " ",
    Function        = "x",
    Constructor     = " ",
    Field           = " ",
    Variable        = " ",
    Class           = " ",
    Interface       = " ",
    Module          = " ",
    Property        = " ",
    Unit            = " ",
    Value           = " ",
    Enum            = " ",
    Keyword         = " ",
    Snippet         = " ",
    Color           = " ",
    File            = " ",
    Reference       = " ",
    Folder          = " ",
    EnumMember      = " ",
    Constant        = " ",
    Struct          = " ",
    Event           = " ",
    Operator        = " ",
    TypeParameter   = " ",
}

local menu_names = {
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
    pandoc_references       = "Pandoc",
    npm                     = "NPM",
}


-- {{{ Setup
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function (args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    --view  = {
    --    entries = { name = 'custom', selection_order = 'nearest_cursor' },
    --},
    window = {
        documentation = {
            border = "solid",
            --border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        },
       completion = {
            border = "solid",
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<TAB>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<S-TAB>'] = cmp.mapping(function (fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-l>'] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        --['<CR>'] = cmp.mapping.confirm({ select = true })
        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
    }),
    sorting = {
        coparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.sort_text,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu"},

        --with_text = true,
        format = function (entry, vim_item)
            vim_item.menu = menu_names[entry.source.name]
            vim_item.kind = kind_icons[vim_item.kind]
            return vim_item
        end,
    },
    experimental = {
        ghost_text = true,
    },
    sources =cmp.config.sources({
        -- Default Sources
        { name = "luasnip" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "npm", keyword_length = 4 },
        { name = "treesitter" },
        { name = "git" },
        {name = "latex_symbols"},
        { name = "tmux", option = { all_panes = true } },
        --{ name = "rg" },
        { name = "calc" },
        { name = "dictionary", keyword_length = 4 },
    }, {
        { name = "buffer" },
    }),
    cmp.setup.filetype('cmp_git', {
        sources = cmp.config.sources({
            { name = 'cmp_git' },
        }, {
            { name = 'buffer' },
        })
    }),
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
        }, {
            { name = 'buffer' },
        }),
    }),
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path', option = { trailing_slash = true } },
        }, {
            { name = 'cmdline', group_index = 0 },
        }),
    }),
})
--}}}


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

wk.register({
    ['<TAB>'] = { "Luasnip Expand/Jump Next" },
    ['<S-TAB>'] = { "Luasnip Jump Previous" },
    ['<C-l>'] = { "Luasnip Cycle [l]ist of Opts" },
    ['<C-b>'] = { "CMP Scroll [b]ack Up"},
    ['<C-f>'] = { "CMP Scroll [f]orward"},
    ['<C-y>'] = { "CMP Confirm(lsp) Selected"},
    ['<C-Space>'] = { "CMP Complete"},
    ['C-e'] = { "CMP Abort"},
    ['<CR>'] = { "CMP Confirm" },
})
