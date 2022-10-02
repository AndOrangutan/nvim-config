local wk = require("which-key")

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, 'MoreMsg' })
    return newVirtText
end


vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = '1'

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
--vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
--vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- ◯
-- ◠ upper half circle
-- ◡ Lower Half circle
wk.register({
    ["zR"] = { "<CMD>lua require('ufo').openAllFolds()<CR>", "UFO|Unfold All" },
    ["zM"] = { "<CMD>lua require('ufo').closeAllFolds()<CR>", "UFO|fold All" },
    ["zr"] = { "<CMD>lua require('ufo').openFoldsExceptKinds()<CR>", "UFO|Unfold All" },
    ["zm"] = { "<CMD>lua require('ufo').closeFoldsWith()<CR>", "UFO|fold All" },
    --Remove K binding from lsp
})



require('ufo').setup({
    fold_virt_text_handler = handler,
    preview = {
        win_config = {
            border = {' ',' ',' ',' ',' ',' ',' ',' '}
        }
    }
})

local bufnr = vim.api.nvim_get_current_buf()
require('ufo').setFoldVirtTextHandler(bufnr, handler)
--