
local lsp_installer = require('nvim-lsp-installer')
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


    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
