
vim.cmd[[colorscheme onedark]]

-- Global bindings
--{{{ Symbol Outline
vim.api.nvim_set_hl(0, "FocusedSymbol", { link = "Search" })
--}}}
--{{{ treesitter-context
vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
--}}}

-- Colorschemes
--{{{ onedark
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "onedark",
    callback = function()
        require("onedark").setup({
            comment_style = "italic",
            keyword_style = "italic,bold",
            function_style = "bold",
            msg_area_style = "NONE",
            variable_style = "NONE",
            dark_float = true,
            dark_sidebar = true,
            highlight_linenumber = false,
            hide_end_of_buffer = true,
            hide_inactive_statusline = true,
            lualine_bold = true,
            transparent = false,
            transparent_sidebar = false,
            sidebars = {"qf", "vista_kind", "terminal", "packer", "symbol"}
        })
    end,
})
--}}}
