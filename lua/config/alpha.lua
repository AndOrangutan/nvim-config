local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
--local temp_string = #vim.tbl_count(packer_plugins)
--local trim_tot_plugins = string.format("%03s", temp_string)

math.randomseed(os.time())

local function pick_color()
    local colors = {"String", "Identifier", "Keyword", "Constant", "Statement", "Type"}
    return colors[math.random(#colors)]
end


-- Set header
local logo = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
--    "                "..trim_tot_plugins.." Plugins Installed                ",
}


-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "   > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "   > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", " ﭯ  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "o", " ﴬ  > Neorg"   , ":cd $HOME/Dropbox/Neorg | :e index.norg <CR> | :TZMinimalist <CR>"),
    dashboard.button( "n", " ﴬ  > Notebook", ":cd $HOME/Dropbox/Notebook | :e index.md <CR> | :TZMinimalist <CR> | :Mkdnflow <CR>"),
    dashboard.button( "s", "   > Settings" , ":cd $HOME/.config/nvim | Telescope find_files<CR>"),
    dashboard.button( "q", "   > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()
--
dashboard.section.header.val = logo
dashboard.section.header.opts.hl = pick_color()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
