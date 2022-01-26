local neorg_callbacks = require("neorg.callbacks")
require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.norg.concealer"] = {
            config = {
                markup_preset = "brave",
                markup = { enable = true},
                --icon_preset = "dimmed",
            }
        }, -- Allows for use of icons
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    my_workspace = "~/Dropbox/Neorg"
                },
                audodetect = true,
                autochdir = true,
            }
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
                neorg_leader = "<Space>o",
            },
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.integrations.telescope"] = {}

    },
}

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode

            -- Keys for managing TODO items and setting their states
            { "gtd", "core.norg.qol.todo_items.todo.task_done" },
            { "gtu", "core.norg.qol.todo_items.todo.task_undone" },
            { "gtp", "core.norg.qol.todo_items.todo.task_pending" },
            { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },
            { "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit" },
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },
        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, { silent = true, noremap = true })

end)
