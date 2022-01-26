local colors = require("onedark.colors").setup()

require("scrollbar").setup({
    show = true,
    handle = {
        text = " ",
        color = colors.black0,
        hide_if_all_visible = false, -- Hides handle if all lines are visible
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "dashboard",
        "packer",
        "NvimTree",
        "undotree",
        "alpha",
    },
    excluded_buftypes = {
        "terminal"
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
    },
    handlers = {
        diagnostic = true,
        search = true, -- Requires hlslens to be loaded
    },
})
require("scrollbar.handlers.search").setup()
