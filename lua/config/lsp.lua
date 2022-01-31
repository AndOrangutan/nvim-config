local nvim_lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vioptioifunc')

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

    nnoremap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "LSP Add Wrkspc Dir")
    nnoremap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "LSP Rm Wrkspc Dir")
    nnoremap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "LSP List Wrkspc Dir")
    --nnoremap("<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Jdtls Organize Imports"
    --nnoremap("crv", "<Cmd>lua require('jdtls').extract_variable()<CR>"
    --vnoremap("crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>"
    --nnoremap("crc", "<Cmd>lua require('jdtls').extract_constant()<CR>"
    --vnoremap("crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>"
    --vnoremap("crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>"
    --
    --
    ---- If using nvim-dap
    ---- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
    --nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
    --nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>   -- See `:help vim.lsp.*` for documentation on any of the below functions

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        } } end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = {
        border = "rounded",
        source = 'always'},
})



-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "grammarly" then
        opts.filetype = { "markdown", "norg"}
    end


    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "clangd",
  --"csharpls",
  "cmake",
  "cssls",
  "diagnosticls",
  "dockerls",
  "efm",
  "gopls",
  "grammarly",
  "html",
  "jsonls",
  "jdtls",
  "tsserver",
  "kotlin_language_server",
  "texlab",
  "sumneko_lua",
  "remark_ls",
  "intelephense",
  "pyright",
  "solargraph",
  "rust_analyzer",
  "sqlls",
  "tsserver",
  "vimls",
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

for _, name in pairs(servers) do
----cmp
--    require('lspconfig')[name].setup {
--        capabilities = capabilities
--    }
--lspinstall
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = "   ",
    -- code action title icon
    code_action_icon = " ",
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
}



--buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
