local pequire = require("utils").pequire
local wk = pequire("which-key")
local lsp_util = vim.lsp.util
local lspconf = require('lspconfig')

--local function code_action_listener()
--    local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
--    local params = lsp_util.make_range_params()
--    params.context = context
--    vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, result)
--        -- do something with result - e.g. check if empty and show some indication such as a sign
--    end)
--end
 
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local function preview_location_callback(_, result)
    if result == nil or vim.tbl_isempty(result) then
        return nil
    end
    vim.lsp.util.preview_location(result[1])
end

function PeekDefinition()
    local params = vim.lsp.util.make_position_params()
    return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
wk.register({
    ["J"] = { "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", "LSP Float Diag" },
    ["[d"] = { "<cmd>lua vim.diagnostic.vim.diagnostic.goto_prev()<CR>", "LSP Goto Prev Diag" },
    ["]d"] = { "<cmd>lua vim.diagnostic.vim.diagnostic.goto_next()<CR>", "LSP Goto Next Diag" },
    ["<space>q"] = { "<cmd>lua vim.diagnostic.vim.diagnostic.setloclist()<CR>", "LSP Add Diag to Loclist" },
}, {})

-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local keyb = vim.api.nvim_buf_set_keymap

    pequire("lsp_signature").on_attach()

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
        ["<space>ca"] = { "<cmd>CodeActionMenu<CR>", "LSP Code Action" },
        --["<space>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP Code Action" },
        ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP List Symb Refr" },
        ["<space>f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Format Buffer" },
    }, { buffer = bufnr })

    --if client.resolved_capabilities.document_highlight then
    --    vim.cmd([[
    --      hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    --      hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    --      hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    --      augroup lsp_document_highlight
    --        autocmd! * <buffer>
    --        autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --        autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --      augroup END
    --    ]])
    --end
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        source = "if_many",
    },
})

local signs = { Error = " ", Warn = " ", Hint = "𥉉", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "solid"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Set which codelens text levels to show
local original_set_virtual_text = vim.lsp.diagnostic.set_virtual_text
local set_virtual_text_custom = function(diagnostics, bufnr, client_id, sign_ns, opts)
    opts = opts or {}
    -- show all messages that are Warning and above (Warning, Error)
    opts.severity_limit = "Warning"
    original_set_virtual_text(diagnostics, bufnr, client_id, sign_ns, opts)
end

vim.lsp.diagnostic.set_virtual_text = set_virtual_text_custom

vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local lvl = ({
        "ERROR",
        "WARN",
        "INFO",
        "DEBUG",
    })[result.type]
    notify({ result.message }, lvl, {
        title = "LSP | " .. client.name,
        timeout = 10000,
        keep = function()
            return lvl == "ERROR" or lvl == "WARN"
        end,
    })
end

capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconf.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "css", "javascript", "typescriptreact", "javascriptreact" },
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
    require("lspconfig")[lsp].setup({
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
end
