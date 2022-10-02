require("lsp_signature").setup({
    bind = true,
    handler_opts = {
        border = "solid",
    },
    hint_prefix = " ",  -- Panda for parameter
    floating_window_above_cur_line = true,
})
