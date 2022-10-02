local true_zen = require("true-zen")
local wk = require("which-key")

true_zen.setup({
    modes = { -- configurations per mode
        minimalist = {
            ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
            options = { -- options to be disabled when entering Minimalist mode
                number = false,
                relativenumber = false,
                showtabline = 2,
                signcolumn = "no",
                statusline = "",
                cmdheight = 0,
                laststatus = 3,
                showcmd = false,
                showmode = false,
                ruler = false,
                numberwidth = 1
            },
            callbacks = { -- run functions when opening/closing Minimalist mode
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        },
        narrow = {
            --- change the style of the fold lines. Set it to:
            --- `informative`: to get nice pre-baked folds
            --- `invisible`: hide them
            --- function() end: pass a custom func with your fold lines. See :h foldtext
            folds_style = "informative",
            run_ataraxis = true, -- display narrowed text in a Ataraxis session
            callbacks = { -- run functions when opening/closing Narrow mode
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        },
        focus = {
            callbacks = { -- run functions when opening/closing Focus mode
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        }
    },
    integrations = {
        tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
        --kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
        --    enabled = false,
        --    font = "+3"
        --},
        twilight = false, -- enable twilight (ataraxis)
        lualine = false -- hide nvim-lualine (ataraxis)
    },
})


wk.register({
    ["<F12>"] = { "<cmd>TZMinimalist<cr>", "TrueZen Toggle"}
})
