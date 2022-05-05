local pequire = require("utils").pequire
local wk = pequire("which-key")

local nvim_lsp = pequire('lspconfig')
local lsp_installer = pequire('nvim-lsp-installer')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


wk.register({
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "LSP Goto Prev Diagnostic"},
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "LSP Goto Next Diagnostic"},
}, {})


vim.api.nvim_create_autocmd({"CursorHold"}, {
    pattern = "*",
    command = "lua vim.diagnostic.open_float(nil, {focus=false, scope='cursor'})",
    desc = "Hover LSP Diagnostic",
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vioptioifunc')

    -- Mappings.
    nnoremap("gh", "<cmd>Lspsaga lsp_finder<cr>", "LSPSaga Async Finder")
    nnoremap("gd", "<cmd>Lspsaga preview_definition<cr>", "LSPSaga Preview Definition")
    nnoremap('gD', "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP Declaration")
    nnoremap("gs", "<cmd>Lspsaga signature_help<cr>", "LSPSaga Signature Help")
    nnoremap("gr", "<cmd>Lspsaga rename<cr>", "LSPSaga Rename")
    nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP Implementation")

    nnoremap("<leader>ca", "<cmd>Lspsaga code_action<cr>", "LSPSaga Code Action")
    MAPX.vnoremap("<leader>ca", "<cmd>Lspsaga range_code_action<cr>", "LSPSaga Rng Code Action")
    nnoremap("K", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false, scope='cursor'})<cr>", "LSP Diagn Hover")
    nnoremap("<leader>K", "<cmd>Lspsaga hover_doc<cr>", "LSPSaga Hover Doc")
    nnoremap("[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<cr>", "LSPSaga Show Line Diagn")
    nnoremap("]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<cr>", "LSPSaga Show Line Diagn")
    nnoremap("<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", "LSPSaga Smart Scroll Prev")
    nnoremap("<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", "LSPSaga Smart Scroll Next")
    nnoremap("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Formatting")
    --
    ---- If using nvim-dap
    ---- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
    --nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
    --nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>   -- See `:help vim.lsp.*` for documentation on any of the below functions

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
--for _, lsp in ipairs(servers) do
--    nvim_lsp[lsp].setup {
--        on_attach = on_attach,
--        flags = {
--            debounce_text_changes = 150,
--        } } end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    float = {
        border = "solid",
        source = 'always'},
})



local servers = {
    "awk_ls",
    "angularls",
    "asm_lsp",
    "bashls",
    "clangd",
    --"csharpls",
    "cmake",
    "cssls",
    "clojure_lsp",
    "diagnosticls",
    "dockerls",
    "efm",
    "eslint",
    "gopls",
    --"grammarly",
    "html",
    "jsonls",
    "jdtls",
    "tsserver",
    "kotlin_language_server",
    "texlab",
    "sumneko_lua",
    --"zk",
    "intelephense",
    "pyright",
    "solargraph",
    "rust_analyzer",
    "sqlls",
    "taplo",
    "tailwindcss",
    "tsserver",
    "vimls",
}

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md


    opts.capabilities = pequire('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    server:setup(opts)
end)

-- Include the servers you want to have installed by default below




---- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
------ Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end




--buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
