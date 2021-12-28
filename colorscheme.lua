-- Example config in Lua
require("onedark").setup({
    comment_style = "italic",
    keyword_style = "italic",
    function_style = "bold",
    msg_area_style = "NONE",
    variable_style = "NONE",
    dark_float = true,
    dark_sidebar = true,
    hide_end_of_buffer = false,
    hide_inactive_statusline = true,
    highlight_linenumber = false,
    lualine_bold = true,
    transparent = false,
    transparent_sidebar = false,

    sidebars = {"qf", "vista_kind", "terminal", "packer"},

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    colors = {hint = "orange", error = "#ff0000"},

    -- Overwrite the highlight groups
    overrides = function(c)
        return {
            htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
            DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
            -- this will remove the highlight groups
            TSField = {},
        }
    end
})
