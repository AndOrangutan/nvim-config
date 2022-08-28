
local wk = require("which-key")
wk.register({
    ["<leader>p"] = { "<cmd>lua require('nabla').popup({border = 'solid'})<cr>", "Nabla Popup Latex Render"},
})
