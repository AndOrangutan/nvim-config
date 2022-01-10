require("notify").setup({
    -- Animation style (see below for details)
    stages = "slide",

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 5000,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
    background_colour = "#282C34",

    -- Minimum width for notification windows
    minimum_width = 50,

    -- Icons for the different levels
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
})

require("telescope").load_extension("notify")

-- Allow other plugins to use notifications
vim.notify = require("notify")

nnoremap("<leader>fn", "<cmd>Telescope notify<cr>", "Telescope Notify")

