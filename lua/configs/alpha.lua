
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



-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "   > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "   > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", "   > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "n", "   > Notebook", ":cd $HOME/Dropbox/Notebook | :e index.md <CR> | :TZMinimalist <CR> | :Mkdnflow <CR>"),
    dashboard.button( "s", "   > Settings" , ":cd $HOME/.config/nvim | Telescope find_files<CR>"),
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
