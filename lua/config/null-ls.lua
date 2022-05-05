local builtins = require("null-ls").builtins

require("null-ls").setup({
    sources = {
        builtins.formatting.stylua,
        builtins.formatting.prettier,       -- Javascript, javascriptreact, typsescript, typscript react, vue, css, scss, less, html, json, yaml, markdown, graphql
        builtins.formatting.stylua,         -- Lua
        builtins.diagnostics.eslint,
        builtins.completion.spell,
    },
})
