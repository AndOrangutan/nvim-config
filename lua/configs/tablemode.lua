vim.cmd[[
    let g:table_mode_corner='|'
]]



local wk = require("which-key")
vim.g.vim_table_mode_enabled = false

wk.register({
    ["<leader><bar><bar>"] = { function ()
        if vim.g.vim_table_mode_enabled == false then
            vim.g.vim_table_mode_enabled = true
            vim.cmd[[TableModeEnable]]
        elseif vim.g.vim_table_mode_enabled == true then
            vim.g.vim_table_mode_enabled = false
            vim.cmd[[TableModeDisable]]
        end

    end,
    "Table Mode Toggle" }
})
