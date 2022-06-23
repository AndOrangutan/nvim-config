--local wk = require("which-key")

require("zk").setup({
    -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
    -- it's recommended to use "telescope" or "fzf"
    picker = "fzf",

    lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
        },
    },
})

-- Moved to 
--wk.register({
--    ["<leader>zn"] = {"<Cmd>ZkNew { dir = vim.fn.input('Subdirectory: '), title = vim.fn.input('Title: '),  }<CR>", "[z]k [n]ew"},
--})
