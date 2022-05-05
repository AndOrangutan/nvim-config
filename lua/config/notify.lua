local pequire = require("utils").pequire
local wk = pequire("which-key")

pequire("notify").setup({
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 3200,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
    background_colour = "NormalFloat",

    -- Minimum width for notification windows
    minimum_width = 50,

    -- Icons for the different levels
    icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = "ﴫ ",
        TRACE = "✎",
    },

    on_open = function (win)
        vim.api.nvim_win_set_config(win, { border = "solid" })
    end,
})

pequire("telescope").load_extension("notify")



-- Allow other plugins to use notifications
vim.notify = require("notify")

wk.register({
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>fn"] = { "<cmd>Telescope notify<cr>", "Telescope Notify"},
}, {})


