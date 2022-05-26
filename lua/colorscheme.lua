-- Lua

--{{{ onedark()
local function onedark()
    require("onedark").setup({
        comment_style = "italic",
        keyword_style = "bold",
        function_style = "bold",
        msg_area_style = "NONE",
        variable_style = "NONE",
        dark_float = true,
        dark_sidebar = true,
        hide_end_of_buffer = false,
        hide_inactive_statusline = false,
        highlight_linenumber = false,
        lualine_bold = true,
        transparent = false,
        transparent_sidebar = false,

        sidebars = {"qf", "vista_kind", "terminal", "packer"},

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        --colors = {hint = "orange", error = "#ff0000"},
        -- Overwrite the highlight groups
        overrides = function(c)
            return {
                htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
                Folded = { fg = c.fg_dark, bg = c.bg },
                DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
                -- this will remove the highlight groups
                TSField = {},
                NotifyERRORBody = { bg = c.bg1 },
                NotifyWARNBody = { bg = c.bg1 },
                NotifyINFOBody = { bg = c.bg1 },
                NotifyDEBUGBody = { bg = c.bg1 },
                NotifyTRACEBody = { bg = c.bg1 },
                TelescopeBorder = { fg = c.bg1, bg = c.bg1 },
                TelescopePromptBorder = { fg = c.bg_highlight, bg = c.bg_highlight },
                TelescopePromptNormal = { fg = c.fg0, bg = c.bg_highlight},
                TelescopePromptPrefix = { fg = c.red0, bg = c.green0 },
                TelescopeNormal = { bg = c.bg1},
                TelescopePreviewTitle = { fg = c.bg1, bg = c.green0 },
                TelescopePromptTitle = { fg = c.bg1, bg = c.red0 },
                TelescopeResultTitle = { fg = c.bg1, bg = c.bg1 },
                TelescopeSelection = { bg = c.bg_highlight},
                CursorLine = { bg = nil },
                CursorLineNr = { bg = nil },
                CodiVirtualText = { link = "Comment" },

            }
        end
    })
    local bg = "#21252b"
    local fg = "#abb2bf"
    local promptbg = "#2c313a"
    local prompttitle = "#e06c75"
    local previewtitle = "#98c379"
    vim.defer_fn(function()
        vim.api.nvim_set_hl(0, "TelescopeBorder", {fg = bg, bg = bg})
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg = promptbg, bg = promptbg})
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", {fg = fg, bg = promptbg})
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {fg = prompttitle, bg = promptbg})
        vim.api.nvim_set_hl(0, "TelescopeNormal", {bg = bg})
        vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {fg = bg, bg = previewtitle})
        vim.api.nvim_set_hl(0, "TelescopePromptTitle", {fg = bg, bg = prompttitle})
        vim.api.nvim_set_hl(0, "TelescopeResultTitle", {fg = bg, bg = bg})
        vim.api.nvim_set_hl(0, "TelescopeSelection", {bg = promptbg})
        vim.api.nvim_set_hl(0, "CodiVirtualText", {link = "Comment"})
    end, 101)

end
--none = 'NONE',
--    bg0 = '#282c34'
--    bg1 = '#21252b'
--    bg_highlight = '#2c313a'
--    bg_visual = '#393f4a'
--    black0 = '#20232A',
--    blue0 = '#61afef',
--    blue1 = '#528bff',
--    cyan0 = '#56b6c2',
--    fg0 = '#abb2bf',
--    fg_dark = '#798294',
--    fg_gutter = '#5c6370',
--    fg_light = '#adbac7',
--    green0 = '#98c379',
--    orange0 = '#e59b4e',
--    orange1 = '#d19a66',
--    purple0 = '#c678dd',
--    red0 = '#e06c75',
--    red1 = '#e86671',
--    red2 = '#f65866',
--    yellow0 = '#ebd09c',
--    yellow1 = '#e5c07b',
--    dev_icons = {
--      blue = '#519aba',
--      green0 = '#8dc149',
--      yellow = '#cbcb41',
--      orange = '#e37933',
--      red = '#cc3e44',
--      purple = '#a074c4',
--      pink = '#f55385',
--      gray = '#4d5a5e',




vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "onedark",
    callback = function()
        onedark()
    end,
})
--}}}

-- Example config in Lua

onedark()
