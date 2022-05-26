
vim.cmd[[colorscheme onedark]]

--{{{ onedark
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "onedark",
    callback = function()
        require("onedark").setup({
            comment_style = "italic",
            keyword_style = "bold",
            function_style = "bold",
            msg_area_style = "NONE",
            variable_style = "NONE",
            dark_float = true,
            dark_sidebar = true,
            hide_end_of_buffer = false;
            hide_incative_statusline = true,
            highlight_linenumber = false,
            lualine_bold = true,
            transparent = false,
            transparent_sidebar = false,
        })
    end,
})
--}}}
