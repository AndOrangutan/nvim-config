vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

require("indent_blankline").setup{
    space_char_blankline = " ",
    show_current_context = true,
    filetype_exclude = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help", "h:",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "TelescopePreview", "undotree",
        "flutterToolsOutline", "wilder", "norg", "neorg", "alpha", "fzf", "markdown", "Trouble", "" -- for all buffers without a file type
    }
}
