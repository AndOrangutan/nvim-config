-- Enable foldmarker
-- vim:foldmethod=marker:foldlevel=0:


-------------------------------------------
-- Autoinstall and autoupdate for Packer --
------------------------------------------- {{{

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "solid" })
        end,
    },
})
--}}}

---------------------
-- Install plugins --
---------------------- {{{

return packer.startup(function(use)

    -- {{{ Have packer manage itself
    use { "wbthomason/packer.nvim" } -- A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config 
    -- }}}

    -- {{{ Helpers and Dependencies
    use { "nvim-lua/plenary.nvim" } -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice. 
    use { "kyazdani42/nvim-web-devicons" } -- A Lua fork of vim-devicons.
    use { "antoinemadec/FixCursorHold.nvim" } -- Fix CursorHold Performance.
    -- }}}

    ------------------
    -- Core Plugins --
    ------------------- {{{

    -- {{{ Keymapping 
    use { "mrjones2014/legendary.nvim", -- Define your keymaps, commands, and autocommands as simple Lua tables, and create a legend for them at the same time, integrates with which-key.nvim.
        config = function () require("legendary").setup() end,
    }
    use { "folke/which-key.nvim", -- Neovim plugin that shows a popup with possible keybindings of the command you started typing.
        requires = "mrjones2014/legendary.nvim",
        config = function () require("configs.whichkey") end,
    }
    -- }}}

    -- {{{ Syntax and highlighting
    use { "nvim-treesitter/nvim-treesitter", -- Neovim Treesitter configurations and abstraction layer.
        requires = "MDeiml/tree-sitter-markdown", -- A markdown grammar for tree-sitter 
        run = ":TSUpdate",
        config = function () require("configs.treesitter") end,
    }
    use { "nvim-treesitter/nvim-treesitter-textobjects" } -- TODO: Setup textobjects
    use { "nvim-treesitter/nvim-treesitter-context", -- Shows floating hover with the current function/block context.
        config = function () require("configs.treesittercontext") end,
    }
    use { "kylechui/nvim-surround",
        tag = "*",
        config = function () require("nvim-surround").setup() end,
    }
    use { "windwp/nvim-ts-autotag", -- Use treesitter to auto close and auto rename html tags.
        config = function () require("configs.autotag") end,
    }

    use { "norcalli/nvim-colorizer.lua", -- A high-performance color highlighter for Neovim which has no external dependencies!
        config = function () require("configs/colorizer") end,
    }

    -- }}}

    --{{{ Git
    use { "lewis6991/gitsigns.nvim", -- Git integration: signs, hunk actions, blame, etc.
    config = function () require("configs.gitsigns") end,
    }
    use { "TimUntersberger/neogit", -- A Magit clone for Neovim that may change some things to fit the Vim philosophy.
        requires = "nvim-lua/plenary.nvim",
        config = function () require("configs.neogit") end,
    }
    use { "sindrets/diffview.nvim", -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev. 
        config = function() require("configs.diffview") end,
    }
    use { "akinsho/git-conflict.nvim", -- A plugin to visualise and resolve merge conflicts in neovim.
        tag = "*",
        config = function() require("git-conflict").setup() end,
    }
    --}}}

    --{{{ External Package Manager
    use { "williamboman/mason.nvim", -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters. 
        config = function () require("configs.mason")end,
    }
    --}}}

    -- {{{ LSP 
    use { "williamboman/mason-lspconfig.nvim", -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim 
        requires = "williamboman/mason.nvim",
        config = function () require("configs.masonlspconfig") end,
    }
    use { "neovim/nvim-lspconfig", -- Quickstart configurations for the Neovim LSP client.
        requires = "williamboman/mason-lspconfig",
        --config = function () require("configs.lspconfig") end,
    }

    -- TODO: config properly
    use { "ray-x/lsp_signature.nvim", -- Lsp signature hint when you type.
        config = function () require("configs.lspsignature") end,
    }
    use { "weilbith/nvim-code-action-menu", -- A floating pop-up menu for code actions to show code action information and a diff preview.
        cmd = "CodeActionMenu",
        config = function () vim.g.code_action_menu_window_border = "solid" end,
    }
    use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Show nvim diagnostics using virtual lines
        config = function () require("configs.lsplines") end,
    }
    use { "RRethy/vim-illuminate",
        config = function () require("configs.illuminate") end,
    }
    -- }}}

    -- {{{ Completion and snippets
    use { "hrsh7th/nvim-cmp", -- A completion plugin for Neovim written in Lua. New version of nvim-compe. 
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            { "David-Kunz/cmp-npm", requires = "nvim-lua/plenary.nvim" },
            "kdheepak/cmp-latex-symbols",
            "ray-x/cmp-treesitter",
            { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },
            "andersevenrud/cmp-tmux",
            "lukas-reineke/cmp-rg",
            "hrsh7th/cmp-calc",
            "uga-rosa/cmp-dictionary",
        },
        config = function () require("configs.cmp") end,
    }
    use { "L3MON4D3/LuaSnip", -- A snippet engine for Neovim written in Lua.
        requires = {
            "rafamadriz/friendly-snippets", -- Set of preconfigured snippets for different languages. 
            { "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" },
        },
        config = function () require("configs.luasnip") end,

    }
    -- }}}

    -- {{{ Editing Support
    use { "windwp/nvim-autopairs", -- A minimalist autopairs for Neovim written in Lua.
        config = function () require("configs.autopairs") end,
    }
    -- }}}

    -- {{{ Indentation 
    use { "lukas-reineke/indent-blankline.nvim", -- IndentLine replacement in Lua with more features and treesitter support.
        config = function () require("configs.indentblankline") end,
    }
    use { "nmac427/guess-indent.nvim", -- Automatic indentation style detection for Neovim 
        config = function () require('guess-indent').setup {} end
    }
    -- }}}

    --{{{ Listener/Quickfix
    use { "folke/trouble.nvim", -- A pretty diagnostics list to help you solve all the trouble your code is causing.
        config = function () require("configs.trouble") end,
    }
    use { "folke/todo-comments.nvim", -- Highlight, list and search todo comments in your projects.
        config = function () require("configs.todocomments") end,
    }
    --}}}

    -- {{{ UI
    --use { "stevearc/dressing.nvim", -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
    --    config = function () require("configs.dressing") end,
    --}
    -- }}}

    -- {{{Picker 
    use { "ibhagwan/fzf-lua", -- Improved fzf.vim written in lua 
        config = function () require("configs.fzflua") end,
        requires = "kyazdani42/nvim-web-devicons",
    }
    -- }}}

    -- {{{ Notifications
    use { "rcarriga/nvim-notify", -- A fancy, configurable, notification manager for Neovim.
        config = function () require("configs.notify") end,
    }
    -- }}}

    -- {{{ Statusline 
    use { "nvim-lualine/lualine.nvim", -- A blazing fast and easy to configure Neovim statusline.
        requires = { "kyazdani42/nvim-web-devicons", "SmiteshP/nvim-gps", "arkav/lualine-lsp-progress" },
        config = function () require("configs.lualine") end
    }
    use { "SmiteshP/nvim-gps",
        config = function () require('configs.gps') end,
    }
    use { "SmiteshP/nvim-navic", -- TODO: Setup with lspconfig and rewrite lspconfig setup. https://github.com/SmiteshP/nvim-navic
        config = function () require("configs.navic") end,
    }
    -- }}}

    --{{{ Symbols
    use{ "simrat39/symbols-outline.nvim", -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
        config = function () require("configs.symboloutline") end,
    }
    --}}}

    --{{{ Tabline
    use { "akinsho/bufferline.nvim", -- A snazzy buffer line for Neovim built using Lua.
        config = function () require("configs.bufferline") end,
    }
    --}}}

    --{{{ File Explorer
    use { "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function () require("configs.tree") end,
    }
    --}}}

    -- {{{ scrollbar
    use { "petertriho/nvim-scrollbar", -- Extensible scrollbar that shows diagnostics and search results.
        requires = "kevinhwang91/nvim-hlslens",
        config = function () require("configs.scrollbar") end,
    }
    use { "kevinhwang91/nvim-hlslens", -- Helps you better glance searched information, seamlessly jump matched instances.
        config = function () require("configs.hlslens") end,
    }
    use { "declancm/cinnamon.nvim", --  Smooth scrolling for ANY movement command exploding_head. A Neovim plugin written in Lua! 
        event = "WinScrolled",
        config = function () require("configs.cinnamon") end,
    }
    -- }}}

    --{{{ Symbols
    use { "goolord/alpha-nvim", -- A lua powered greeter like vim-startify / dashboard-nvim.
        config = function () require("configs.alpha") end,
    }
    --}}}

    -- {{{ Window Management
    -- TODO: Reconfig TrueZen
    use { "Pocco81/true-zen.nvim", -- Clean and elegant distraction-free writing for NeoVim.
        config = function () require("configs.truezen") end,
    }
    use { "luukvbaal/stabilize.nvim", -- Stabilized window content on window open/close events.
        config = function () require("stabilize").setup() end,
    }
    use { "aserowy/tmux.nvim", -- Tmux integration for Neovim features pane movement and resizing from within Neovim.
        config = function ()  require("configs.tmux") end,
    }
    -- }}}

    -- {{{ Formatting
    use { "godlygeek/tabular" }
    -- }}}

    -- {{{ FOlds
    use { "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = function () require("configs.ufo") end,
    }
    -- }}}

    -- }}}

    -------------------
    -- Other Plugins --     Less functional, borderline "bloat" if you will
    ------------------- {{{

    -- {{{ Colorschemes
    use { "navarasu/onedark.nvim" }
    use { "NLKNguyen/papercolor-theme" }
    use { "sainnhe/everforest" }
    use { "shaunsingh/nord.nvim" }
    use { "folke/tokyonight.nvim" }
    use { "rebelot/kanagawa.nvim" }
    -- }}}

    -- {{{ Code Evaluation
    use { "michaelb/sniprun",
        run = "bash ./install.sh",
        config = function () require("configs.sniprun")end,
    }
    use { "metakirby5/codi.vim" }
    -- }}}


    -- }}}

    ----------------------
    -- Filetype Plugins --
    ---------------------- {{{

    -- {{{ Markdown
    use { "preservim/vim-markdown", -- Markdown Vim Mode
        setup = function () require("configs.vimmarkdown") end,
    }
    use { "mickael-menu/zk-nvim", -- Neovim extension for zk, a plain text note-taking assistant.
        config = function () require("configs.zk") end,
    }
    use { "dkarter/bullets.vim", -- Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
        ft = { "markdown", "text", "gitcommit", "scratch" },
        setup = function () require("configs.vimmarkdown") end,
    }
    use { "frabjous/knap", -- Neovim plugin for creating live-updating-as-you-type previews of LaTeX, markdown, and other files in the viewer of your choice.
        setup = function () require("configs.knap") end,
    }
    use { "ekickx/clipboard-image.nvim", -- Neovim Lua plugin to paste image from clipboard.
        ft = "markdown",
        config = function () require("configs.pasteimg") end,
    }
    use { "jbyuki/nabla.nvim", -- Take your scientific notes in Neovim.
        ft = "markdown",
        config = function () require("configs.nabla") end,
    }
    use { "lukas-reineke/headlines.nvim", -- This plugin adds horizontal highlights for text filetypes, like markdown, orgmode, and neorg. 
        config = function () require("headlines").setup({ markdown = { fat_headlines = false } }) end,
    }
    use { "AckslD/nvim-FeMaco.lua", -- Catalyze your Fenced Markdown Code-block editing.
        config = function () require("femaco").setup({ border = "solid" }) end,
    }
    use { "dhruvasagar/vim-table-mode",
        ft = "markdown",
        setup = function () require("configs.tablemode") end,
    }
    use { "jbyuki/venn.nvim",
        ft = "markdown",
        setup = function () require("configs.venn") end,
    }
    --use { "edluffy/hologram.nvim",
    --    config = function () require('hologram').setup{ auto_display = true } end,
    --}
    -- }}}

    --}}}

end)


--}}}


