local builtins = require("null-ls").builtins

require("null-ls").setup({
    sources = {
        builtins.formatting.stylua,
        builtins.formatting.clang_format,   -- C, C++
        builtins.formatting.cmake_format,          -- makefiles
        builtins.formatting.prettier,       -- Javascript, javascriptreact, typsescript, typscript react, vue, css, scss, less, html, json, yaml, markdown, graphql
        builtins.formatting.stylua,         -- Lua
        builtins.diagnostics.eslint,
        builtins.completion.spell,
    },
})

nnoremap("<leader>F", "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format current file")
vnoremap("<leader>F", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Format current file")
