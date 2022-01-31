
local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode").load()

local function replace_keycode(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.tab_binding()
    if luasnip.expand_or_jumpable() then
        return replace_keycode("<Plug>luasnip-expand-or-jump")
    else
        return replace_keycode("<Plug>(Tabout)")
    end
end

function _G.s_tab_binding()
    if luasnip.jumpable(-1) then
        return replace_keycode("<Plug>luasnip-jump-prev")
    else
        return replace_keycode("<Plug>(TaboutBack)")
    end
end


MAPX.imap("<Tab>", "v:lua.tab_binding()", "Snippet Jump", "expr")
MAPX.inoremap("<S-Tab>", "v:lua.s_tab_binding", "Snippet UnJump", "expr")
MAPX.snoremap("<Tab>", "v:lua.tab_binding()", "Snippet Jump", "expr")
MAPX.snoremap("<S-Tab>", "v:lua.s_tab_binding", "Snippet UnJump", "expr")
MAPX.imap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", "Snippet ???")
MAPX.smap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", "Snippet ????")
