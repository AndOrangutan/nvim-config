
local M = {}
local wk = require("which-key")


-- Add additional capabilities supported by nvim-cmp
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

--{{{ Completion Icons
M.icons = {
    Text        = " ",
    Method      = " ",
    Function    = " ",
    Constructor = " ",
    Field       = "ﰠ ",
    Variable    = " ",
    Class       = "ﴯ ",
    Interface   = " ",
    Module      = " ",
    Property    = "ﰠ ",
    Unit        = "塞",
    Value       = " ",
    Enum        = " ",
    Keyword     = " ",
    Snippet     = " ",
    Color       = " ",
    File        = " ",
    Reference   = " ",
    Folder      = " ",
    EnumMember  = " ",
    Constant    = " ",
    Struct      = "פּ ",
    Event       = " ",
    Operator    = " ",
}

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end
--}}}

--{{{ Customize diagnostics
vim.diagnostic.config({
    virtual_text = false,
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
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
--}}}

--
--


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

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    wk.register({
        ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP Goto Declaration" },
        ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Goto Def" },
        ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover (2x Goto)" },
        ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP List Impl For Symb" },
        ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP Show Sign For Symb" },
        ["<space>wa"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "LSP Add Wksp Folder" },
        ["<space>wr"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "LSP Rem Wksp Folder" },
        ["<space>wl"] = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
            "LSP Show Wksp Folders",
        },
        ["<space>D"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "LSP Goto Symb Type Def" },
        ["<space>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP Rename" },
        ["<space>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP Code Action" },
        --["<space>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP Code Action" },
        ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP List Symb Refr" },
        ["<space>f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Format Buffer" },
    }, { buffer = bufnr })

end


require('lspconfig').emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "javascript", "typescriptreact", "javascriptreact" },
})
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    "angularls",
    "arduino_language_server",
    "asm_lsp",
    "awk_ls",
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "denols",
    "dockerls",
    --"emmet_ls",
    "gdscript",
    "gopls",
    "graphql",
    "hls",
    "html",
    "intelephense",
    "jdtls",
    "jsonls",
    "kotlin_language_server",
    "ltex",
    "omnisharp",
    "phpactor",
    "pylsp",
    "pyright",
    "rust_analyzer",
    "sqls",
    "sumneko_lua",
    "texlab",
    "tsserver",
    "vuels",
    "yamlls",
    "zk"
}

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
end
