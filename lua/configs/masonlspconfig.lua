local wk = require("which-key")
local lspconfig = require("lspconfig")

--{{{ Override Border
local border = {
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
--}}}

--{{{ Customize diagnostics also influences lsp_lines
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        source = "always",
    },

})
--}}}

--{{{ Customize Sign Column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
--}}}

-- Only show errors and warnings
local orig_set_signs = vim.lsp.diagnostic.set_signs
local set_signs_limited = function(diagnostics, bufnr, client_id, sign_ns, opts)
  opts = opts or {}
  opts.severity_limit = {"Error", "Warn",}
  orig_set_signs(diagnostics, bufnr, client_id, sign_ns, opts)
end
vim.lsp.diagnostic.set_signs = set_signs_limited



require("mason-lspconfig").setup({
    ensure_installed = { 
        "awk_ls",                   -- Awk
        "angularls",                -- Angular
        "arduino_language_server",  -- Aruino
        "asm_lsp",                  -- GAS/NASM and GO Assembly
        "bashls",                   -- Bash
        "clangd",                   -- C, C++
        "omnisharp",                -- C#
        "cmake",                    -- CMake
        "cssls",                    -- CSS
        "clojure_lsp",              -- Clojure
        "diagnosticls",             -- General purpose diagnostics
        "dockerls",                 -- Docker
        "emmet_ls",                 -- Emmet: The essential toolkit for web-developers 
        "fortls",                   -- Fortran
        "gopls",                    -- Go
        "graphql",                  -- GraphQL
        "html",                     -- HTML
        "eslint",                   -- Javascript
        "hls",                      -- Haskell
        "jsonls",                   -- JSON
        "jdtls",                    -- JAVA
        "tsserver",                 -- Javascript, Typescript
        "kotlin_language_server",   -- Kotlin
        --"texlab",                   -- LaTeX
        "sumneko_lua",              -- Lua
        "prosemd_lsp",              -- Markdown
        "rnix",                     -- Nix
        "intelephense",             -- PHP
        "pyright",                  -- Python
        "solargraph",               -- Ruby
        "Rust",                     -- Rust
        "sqls",                     -- SQL
        "Svelte",                   -- Svelte
        "taplo",                    -- TOML
        "tailwindcss",              -- Tailwind CSS
        "vimls",                    -- VimL
        "vuels",                    -- Vue
        "lemminx",                  -- XML
        "yamlls",                   -- YAML
        "zls",                      -- Zig

    }
})



-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
wk.register({
    ["J"] = { "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", "LSP Float Diag" },
    ["[d"] = { "<cmd>lua vim.diagnostic.vim.diagnostic.goto_prev()<CR>", "LSP Goto Prev Diag" },
    ["]d"] = { "<cmd>lua vim.diagnostic.vim.diagnostic.goto_next()<CR>", "LSP Goto Next Diag" },
    ["<space>q"] = { "<cmd>lua vim.diagnostic.vim.diagnostic.setloclist()<CR>", "LSP Add Diag to Loclist" },
}, {})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    --require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    wk.register({
        ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP Goto Declaration" },
        ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Goto Def" },
        --["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover (2x Goto)" }, -- Go to ufo
        ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP List Impl For Symb" },
        -- TODO: Resetup  signature ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP Show Sign For Symb" },
        ["<space>wa"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "LSP Add Wksp Folder" },
        ["<space>wr"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "LSP Rem Wksp Folder" },
        ["<space>wl"] = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
            "LSP Show Wksp Folders",
        },
        ["<space>D"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "LSP Goto Symb Type Def" },
        ["<space>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP Rename" },
        ["<space>ca"] = { "<cmd>CodeActionMenu<CR>", "LSP Code Action" },
        --["<space>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP Code Action" },
        ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP List Symb Refr" },
        ["<space>f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Format Buffer" },
    }, { buffer = bufnr })
end


-- TODO: Double Check this when redoing cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}


require("mason-lspconfig").setup_handlers {
    --default handler for languages
    function (server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    ["sumneko_lua"] = function ()
        lspconfig.sumneko_lua.setup {
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end,
}

