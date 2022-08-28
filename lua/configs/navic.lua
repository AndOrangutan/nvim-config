local navic = require("nvim-navic")

navic.setup {
    icons = {
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    },
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
}

_G.navic_location = function()
    local navic = require "nvim-navic"
    return navic.is_available() and "%t > "..navic.get_location() or "%t"
end

vim.opt.winbar = "%t%{%v:lua.navic_location()%}"

vim.api.nvim_create_autocmd ("CursorMoved", {
  pattern = '*',
  command = "set winbar=%{%v:lua.navic_location()%}",
})
