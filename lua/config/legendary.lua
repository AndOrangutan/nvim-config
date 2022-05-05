local pequire = require("utils").pequire

local wk = require("which-key")
--local legendary = pequire("legendary")

require("legendary").setup({
    -- Customize the prompt that appears on your vim.ui.select() handler
    select_prompt = 'Legendary',
    -- Initial keymaps to bind
    -- Automatically add which-key tables to legendary
    -- see "which-key.nvim Integration" below for more details
    auto_register_which_key = true
})

wk.register({
    ["<leader>fl"] = { "<cmd>lua require('legendary').find()<cr>", "Telescope Legendary"},
}, {})

