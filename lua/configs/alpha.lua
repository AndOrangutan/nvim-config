
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())

local function pick_color()
    local colors = {"String", "Identifier", "Keyword", "Constant", "Statement", "Type"}
    return colors[math.random(#colors)]
end


-- Set header
local header = {
    "                                                   ",
    " ███    ██ ███████  ██████  ██    ██ ██ ███    ███ ",
    " ████   ██ ██      ██    ██ ██    ██ ██ ████  ████ ",
    " ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ ",
    " ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ ",
    " ██   ████ ███████  ██████    ████   ██ ██      ██ ",
    "                                                   ",
}

local footer = {
    "                                   ",
    "          ▀████▀▄▄              ▄█ ",
    "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
    "    ▄        █          ▀▀▀▀▄  ▄▀  ",
    "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
    "  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
    "  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
    "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
    "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
    "   █   █  █      ▄▄           ▄▀   ",
    "                                   ",

}
_G.my_open = function(selected, opts)
    -- 'selected[]' array contains the selected items
    require'fzf-lua'.actions.file_edit(selected, opts)
    vim.cmd('ZkCd')
    vim.cmd("TZMinimalist")
end



-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "   > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "   > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", "   > Recent"   , ":Telescope oldfiles<CR>"),
    --dashboard.button( "n", "   > Notebooks", ":cd $HOME/Dropbox/Notebook | :e index.md <CR> | :TZMinimalist <CR>"),
    --dashboard.button( "n", "   > Notebooks", [[:lua require("fzf-lua").files({ cwd = "~/Dropbox/Notebooks"})<cr> | :ZkCd<cr> | :TZMinimalist <CR>]]),
    --dashboard.button( "n", "   > Notebooks", [[:lua require'fzf-lua'.files({ cwd = "~/Dropbox/Notebooks", cmd = "fd -e md -g 'index.md'"})<cr>]]),
    dashboard.button( "n", "   > Notebooks", [[:lua require'fzf-lua'.files({ cwd = "~/Dropbox/Notebooks", cmd = "fd -e md -g 'index.md'", actions = { ['default'] = _G.my_open }})<cr>]]),
    dashboard.button( "s", "   > Settings" , ":cd $HOME/.config/nvim | FzfLua files<CR>"),
    dashboard.button( "q", "   > Quit NVIM", ":qa<CR>"),
}


-- Subheader
dashboard.section.header.val = header
dashboard.section.footer.val = footer
dashboard.section.header.opts.hl = pick_color()
dashboard.section.footer.opts.hl = pick_color()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
