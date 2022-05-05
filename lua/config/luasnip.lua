local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end

--MAPX.imap("<Tab>", "v:lua.tab_binding()", "Snippet Jump", "expr")
--MAPX.inoremap("<S-Tab>", "v:lua.s_tab_binding", "Snippet UnJump", "expr")
MAPX.imap("<Tab>", "v:lua.tab()", "Snippet Jump", "expr")
MAPX.inoremap("<S-Tab>", "v:lua.s_tab()", "Snippet UnJump", "expr")
MAPX.snoremap("<Tab>", "v:lua.tab()", "Snippet Jump", "expr")
MAPX.snoremap("<S-Tab>", "v:lua.s_tab()", "Snippet UnJump", "expr")
MAPX.imap("<C-E>", "<Plug>luasnip-next-choice", "Snippet ???")
MAPX.smap("<C-E>", "<Plug>luasnip-next-choice", "Snippet ????")
