require("femaco").setup({
    border = "solid",
    prepare_buffer = function(opts)
        vim.cmd('split')
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_create_buf(false, false)
        return vim.api.nvim_win_set_buf(win, buf)
    end,
})
