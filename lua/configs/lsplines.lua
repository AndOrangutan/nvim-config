local wk = require("which-key")
require("lsp_lines").setup()

wk.register({
    ["<leader>l"] = { function() require('lsp_lines').toggle() vim.notify('LSPLines Toggled') end, "LSPLines Toggle" },

})
