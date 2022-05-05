local pequire = require("utils").pequire
local wk = pequire("which-key")

local path = require 'nvim-lsp-installer.path'
local install_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

-- paru -S angularls gopls tsserver flow bashls dockerls julials pylsp pyright jedi_language_server jdtls sumneko_lua vimls html jsonls solargraph cssls yamlls clangd ccls sqls denols graphql dartls dotls kotlin_lanuage_server nimls intelephense vuels phpactor omnisharp r_language_server rust_analyzer terraformls svelte texlab conjure_lsp elixirls sourcekit fsautocomplete vls hls
--local library = {}

--local sumneko_dir = install_dir .. '/sumneko-lua/extension/server'

pequire("navigator").setup({
    border = "solid", -- border style, can be one of 'none', 'single', 'double',
    -- 'shadow', or a list of chars which defines the border
    --on_attach = function(client, bufnr)
    --  -- your hook
    --end,
    -- put a on_attach of your own here, e.g
    -- function(client, bufnr)
    --   -- the on_attach will be called at end of navigator on_attach
    -- end,
    -- The attach code will apply to all LSP clients

    default_mapping = true, -- set to false if you will remap every key
    --keymaps = {{key = "gK", func = "declaration()"}}, -- a list of key maps
    -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
    -- please check mapping.lua for all keymaps
    treesitter_analysis = true, -- treesitter variable context
    transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

    --lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
    ---- setup here. if it is nil, navigator will not init signature help
    --signature_help_cfg = {
    --    handler_opts = {
    --        border = "solid",
    --    }
    --},

    icons = {
        code_action_icon = " ", -- "  ",
        -- code lens
        code_lens_action_icon = " ",
        -- Diagnostics
        diagnostic_head = "ﴫ ",
        diagnostic_err = " ",
        diagnostic_warn = " ",
        diagnostic_info = [[ ]],
        diagnostic_hint = [[ ]],

        diagnostic_head_severity_1 = "🈲",
        diagnostic_head_severity_2 = "☣️",
        diagnostic_head_severity_3 = "👎",
        diagnostic_head_description = "👹",
        diagnostic_virtual_text = "🦊",
        diagnostic_file = "🚑",
        -- Values
        value_changed = "📝",
        value_definition = "🐶🍡", -- it is easier to see than 🦕
        -- Treesitter
        match_kinds = {
            var = " ", -- "👹", -- Vampaire
            method = "ƒ ", --  "🍔", -- mac
            ["function"] = " ", -- "🤣", -- Fun
            parameter = "  ", -- Pi
            associated = "🤝",
            namespace = "🚀",
            type = " ",
            field = "🏈",
        },
        treesitter_defult = "🌲",
    },
    lsp_installer = false, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
    lsp = {
        code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true},
        code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        format_on_save = true, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
        disable_format_cap = { "sqls", "sumneko_lua", "gopls" }, -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
        disable_lsp = { "pylsd", "sqlls" }, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
        -- only want to enable one lsp server
        -- to disable all default config and use your own lsp setup set
        -- disable_lsp = 'all'
        -- Default {}
        diagnostic_scrollbar_sign = false, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
        -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
        diagnostic_virtual_text = false, -- show virtual for diagnostic message
        diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
        disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want toignore it
        --tsserver = {
        --  filetypes = {'typescript'} -- disable javascript etc,
        --  -- set to {} to disable the lspclient for all filetypes
        --},
        --gopls = {   -- gopls setting
        --  on_attach = function(client, bufnr)  -- on_attach for gopls
        --    -- your special on attach here
        --    -- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
        --    print("i am a hook, I will disable document format")
        --    client.resolved_capabilities.document_formatting = false
        --  end, settings = { gopls = {gofumpt = false} -- disable gofumpt etc,
        --  }
        --},
        --sumneko_lua = {
        --    sumneko_binary = sumneko_dir .. '/bin/lua-language-server',
        --    sumneko_root_path = sumneko_dir,
        --    --settings = luadev.settings,
        --    --cmd = { sumneko_dir .. '/bin/lua-language-server' }
        --    --flags = {allow_incremental_sync = true, debounce_text_changes = 500},
        --    --settings = {
        --    --  Lua = {
        --    --    runtime = {
        --    --      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        --    --      version = "LuaJIT",
        --    --      -- Setup your lua path
        --    --      path = vim.split(package.path, ";")
        --    --    },
        --    --    diagnostics = {
        --    --      enable = true,
        --    --      -- Get the language server to recognize the `vim` global
        --    --      globals = {"vim", "describe", "it", "before_each", "after_each", "teardown", "pending"}
        --    --    },
        --    --    completion = {callSnippet = "Both"},
        --    --    workspace = {
        --    --      -- Make the server aware of Neovim runtime files
        --    --      library = library,
        --    --      maxPreload = 2000,
        --    --      preloadFileSize = 40000
        --    --    },
        --    --    telemetry = {enable = false}
        --    --  }
        --    --},
        --},
        servers = {""}, -- by default empty, and it should load all LSP clients avalible based on filetype
        -- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
        -- can put them in the `servers` list and navigator will auto load them.
        -- you could still specify the custom config  like this
        -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
    },
})


--wk.register({
--    ["gr"] = {"LSP Async Rfrn, Defn, Cont"},
--    ["<leader"] = {"LSP Async Rfrn, Defn, Cont"},
--}, {})
