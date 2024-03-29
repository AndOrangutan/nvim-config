local wk = require("which-key")

require("tmux").setup({
    copy_sync = {
        -- enables copy sync and overwrites all register actions to
        -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
        enable = true,

        -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
        -- first buffer or named_buffer_name = true to ignore a named tmux
        -- buffer with name named_buffer_name :)
        ignore_buffers = { empty = false },

        -- TMUX >= 3.2: yanks (and deletes) will get redirected to system
        -- clipboard by tmux
        redirect_to_clipboard = true,

        -- offset controls where register sync starts
        -- e.g. offset 2 lets registers 0 and 1 untouched
        register_offset = 0,

        -- sync clipboard overwrites vim.g.clipboard to handle * and +
        -- registers. If you sync your system clipboard without tmux, disable
        -- this option!
        sync_clipboard = true,

        -- syncs deletes with tmux clipboard as well, it is adviced to
        -- do so. Nvim does not allow syncing registers 0 and 1 without
        -- overwriting the unnamed register. Thus, ddp would not be possible.
        sync_deletes = true,

        -- syncs the unnamed register with the first buffer entry from tmux.
        sync_unnamed = true,
    },
    navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = false,

        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = false,

        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = false,
    },
    resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = false,

        -- sets resize steps for x axis
        resize_step_x = 1,

        -- sets resize steps for y axis
        resize_step_y = 1,
    }
})

wk.register({
    -- Navigation
    ["<M-h>"] = { [[<cmd>lua require("tmux").move_left()<cr>]], [[Tmux [h]ide Left]] },
    ["<M-j>"] = { [[<cmd>lua require("tmux").move_bottom()<cr>]], [[Tmux [j]ump Down]] },
    ["<M-k>"] = { [[<cmd>lua require("tmux").move_top()<cr>]], [[Tmux [k]ick Up]] },
    ["<M-l>"] = { [[<cmd>lua require("tmux").move_right()<cr>]], [[Tmux [l]eap Right]] },
    
    -- Resize
    ["<C-M-h>"] = { [[<cmd>lua require("tmux").resize_left()<cr>]], [[Tmux [s]hift [h]ide Left]] },
    ["<C-M-j>"] = { [[<cmd>lua require("tmux").resize_bottom()<cr>]], [[Tmux [s]hift [j]ump Down]] },
    ["<C-M-k>"] = { [[<cmd>lua require("tmux").resize_top()<cr>]], [[Tmux [s]hift [k]ick Up]] },
    ["<C-M-l>"] = { [[<cmd>lua require("tmux").resize_right()<cr>]], [[Tmux [s]hift [l]eap Right]] },
})
