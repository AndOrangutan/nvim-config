
vim.notify = require("notify")

require("notify").setup({
    background_colour = "NormalFloat",
    fps = 30,
    icons = {
        DEBUG   = " ",
        ERROR   = " ",
        INFO    = " ",
        TRACE   = " ",
        WARN    = " "
    },
    level = "info",
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 5000,
    on_open = function(win)
        vim.api.nvim_win_set_config(win, { border = "shadow" })
    end,
})
