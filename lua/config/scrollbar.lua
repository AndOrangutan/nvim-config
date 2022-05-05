local colors = require("onedark.colors").setup()

local pequire = require("utils").pequire


pequire("scrollbar").setup({
    show = true,
    handle = {
        text = " ",
        highlight = "CursorColumn",
        hide_if_all_visible = false, -- Hides handle if all lines are visible
    },
    marks = {
        Search = { highlight = "Search" },
        Error = { highlight = "DiagnosticVirtualTextError" },
        Warn = { highlight = "DiagnosticVirtualTextWarn" },
        Info = { highlight = "DiagnosticVirtualTextInfo" },
        Hint = { highlight = "DiagnosticVirtualTextHint" },
        Misc = { highlight = "Normal" },
    },
    excluded_filetypes = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help", "h:",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "TelescopePreview", "undotree",
        "flutterToolsOutline", "wilder", "norg", "neorg", "alpha", ""
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


pequire("scrollbar.handlers.search").setup()
