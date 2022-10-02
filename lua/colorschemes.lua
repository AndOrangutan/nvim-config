
vim.cmd[[colorscheme onedark]]

-- Global bindings
--{{{ Symbol Outline
vim.api.nvim_set_hl(0, "FocusedSymbol", { link = "Search" })
--}}}
--{{{ treesitter-context
vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
vim.api.nvim_set_hl(0, "SniprunVirtualTextOk", { link = "Comment" })
vim.api.nvim_set_hl(0, "SniprunVirtualTextOk", { link = "Error" })
--}}}

-- Colorschemes
--{{{ onedark

require("onedark").setup {
    code_style = {
        comments = "italic",
        keywords = "italic,bold",
        functions = "bold",
        strings = "none",
        variables = "none",
    },
    diagnsotics = {
        darker = true,
        undercurl = true,
        background = true,
    }
}

--}}}
