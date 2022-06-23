local fn = vim.fn
--local pequire = require("utils").

--{{{ Auto install and auto update on write for Packer
-- Automatically install packer
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

--{{{ functions
local functions
function pequire(name)
    local ok, _ = pcall(require, name)
    if not ok then
        vim.notify("Failed to load `"..name.."`!", "error")
    end
end
--}}}


-- Install your plugins here
return packer.startup(function(use)
    --                              • "solid": Adds padding by a single whitespace

    --{{{ Plugin Management

    use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
    --}}}

    --{{{ Helpers/Dependencies

    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-lua/plenary.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "antoinemadec/FixCursorHold.nvim" })

    use({ "stevearc/dressing.nvim",
        config = function()
            pequire("configs.dressing")
        end
    })

    --}}} End of Helpers/Dependencies

    --{{{ Core Plugins

    --{{{ Keybinding
    use({ "mrjones2014/legendary.nvim", -- TODO: Double Check config
        config = function()
            require("legendary").setup()
        end,
    })
    use({ "folke/which-key.nvim",
        requires = "mrjones2014/legendary.nvim",
        config = function()
            pequire("configs.whichkey")
        end
    })
    --}}}
--    
    --{{{ Treesitter and other highlighting
    use({ "nvim-treesitter/nvim-treesitter",
        requires = { "MDeiml/tree-sitter-markdown" },
        config = pequire("configs.treesitter"),
        run = ":TSUpdate",
    })
    use({ "nvim-treesitter/nvim-treesitter-context",
        config = function ()
            pequire("configs.treesittercontext")
        end
    })
    --}}}

    --{{{ LSP
    use({ "neovim/nvim-lspconfig",
      --config
        config = function()
            pequire("configs.lspconfig")
        end,
    })
    use({ "ray-x/lsp_signature.nvim",
        config = function ()
            pequire("configs.lspsignature")
        end
    })
    use({ "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
        config = function ()
            vim.g.code_action_menu_window_border = 'solid'
        end
    })
    use({ "folke/lua-dev.nvim" })
    --}}}

    -- {{{ Compleiton and Snippets
    use({ "hrsh7th/nvim-cmp",
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },
            "lukas-reineke/cmp-rg",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "ray-x/cmp-treesitter",
            "andersevenrud/cmp-tmux",
            "uga-rosa/cmp-dictionary",
            { "David-Kunz/cmp-npm", requires = "nvim-lua/plenary.nvim" },
            "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-calc",
            "aspeddro/cmp-pandoc.nvim",
            "dmitmel/cmp-cmdline-history",
            "lukas-reineke/cmp-under-comparator",
        },
        config = function()
            pequire("configs.cmp")
        end,
    })
    use({ "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets",
            { "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" },
        },
        config = function ()
            pequire("configs.luasnip")
        end,
    })
    -- }}}

    --{{{ Editing
    use({ "windwp/nvim-autopairs",
        config = function()
            pequire("configs.autopairs")
        end
    })
    use({ "lukas-reineke/indent-blankline.nvim",
        config = function ()
            pequire("configs.indentblankline")
        end
    })
    use({ "folke/todo-comments.nvim",
        config = function ()
            pequire("configs.todocomments")
        end
    })
    --}}}

    --{{{ Picker
    use({ "ibhagwan/fzf-lua",
        config = function()
            pequire("configs.fzflua")
        end,
        requires = {"kyazdani42/nvim-web-devicons"},
    })
    --}}}

    --{{{ Notifications
    use({ "rcarriga/nvim-notify",
        config = function()
            require("configs.notify")
        end,
    })
    --}}}

    --{{{ Statusline
    use({ "SmiteshP/nvim-gps",
        config = function()
            pequire('configs.gps')
        end,
    })

    use({ "arkav/lualine-lsp-progress",
    })

    use({ "nvim-lualine/lualine.nvim",
        --requires = { { "kyazdani42/nvim-web-devicons", opt = true }, "arkav/lualine-lsp-progress" },
        requires = { { "kyazdani42/nvim-web-devicons", opt = true }, "SmiteshP/nvim-gps" },
        config = function()
            require("configs.lualine")
        end,
    })
    --}}}

    --{{{ Search
    use({ "kevinhwang91/nvim-hlslens",
        config = function ()
            require("configs.hlslens")
        end
    })

    --}}}

    --{{{ Scrolling
    --use({ "declancm/cinnamon.nvim",
    --    config = function()
    --        pequire("configs.cinnamon")
    --    end,
    --    event = "WinScrolled",
    --})
    use({ "petertriho/nvim-scrollbar",
        requires = "kevinhwang91/nvim-hlslens",
        config = function()
            pequire("configs.scrollbar")
        end,

    })
    --}}}

    --{{{ Window Management
    use({ "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end
    })

    use({ "aserowy/tmux.nvim",
        config = function ()
            pequire("configs.tmux")
        end

    })
    --}}}

    --{{{ Formatting
    use({ "tpope/vim-sleuth" })
    
    --}}}

    --{{{ Tabline
    use({ "akinsho/bufferline.nvim",
        config = function()
            require("configs.bufferline")
        end,
    })
    --}}}

    --{{{ File Explorer
    use({ "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        --cmd = {"NvimTreeClose", "NvimTreeOpen", "NvimTreeToggle"},
        tag = "nightly",
        config = function()
            require("configs.tree")
        end,
    })
    --}}}

    --{{{ Listener
    use({ "folke/trouble.nvim",
        --cmd = {"TroubleToggle"},
        config = function()
            require("configs.trouble")
        end,
    })
    --}}}

    --{{{ Dashboard
    use({ "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("configs.alpha")
        end
    })
    --}}}

    --{{{ Symbol Outline
    use({ "simrat39/symbols-outline.nvim",
        config = function()
            pequire("configs.symboloutline")
        end
    })
    --}}}

    --{{{ Git
    use({ "lewis6991/gitsigns.nvim",
        config = function ()
            pequire('configs.gitsigns')
        end
    })
    use({ "TimUntersberger/neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function ()
            pequire("configs.neogit")
        end
    })
    use({ "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function ()
            pequire("configs.diffview")
        end,
    })
    --}}}

    --{{{ ZenMode
    use({ "Pocco81/TrueZen.nvim",
        config = function ()
            pequire("configs.truezen")
        end
    })
    --}}}

    --}}} End of Core Plugins

    --{{{ Other Plugins

    --{{{ Highlighting
    use({ "norcalli/nvim-colorizer.lua",
        config = function ()
            pequire("configs/colorizer")
        end,
    })
    --}}}

    --{{{ Colorschemes
    use({ "ful1e5/onedark.nvim" })
    use({ "NLKNguyen/papercolor-theme" })
    use({ "sainnhe/everforest" })
    use({ "shaunsingh/nord.nvim" })
    use({ "folke/tokyonight.nvim" })
    use({ "rebelot/kanagawa.nvim"})
    --}}}

    --{{{ Folds
    use({ "anuvyklack/pretty-fold.nvim",
    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
        config = function ()
            pequire("configs.prettyfold")
        end
    })
    --}}}

    --{{{ Note Taking
    -- General
    -- Markdown
    use({ "preservim/vim-markdown",
        setup = function ()
            pequire("configs.vimmarkdown")
        end
    })
    use({ "mickael-menu/zk-nvim",
        --ft = "markdown",
        config = function ()
            pequire("configs.zk")
        end,
    })
    use({ "dkarter/bullets.vim",
        ft = { "markdown", "text", "gitcommit", "scratch" },
        setup = function ()
            pequire("configs.bullets")
        end,
    })
    use({ "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        --ft = { "markdown" },
        setup = function ()
            pequire("configs.markdownpreview")
        end,
    })
    use({ "ekickx/clipboard-image.nvim",
        ft = "markdown",
        config = function ()
            pequire("configs.clipboardimage")
        end,
    })
    use({ "jbyuki/nabla.nvim",
        ft = "markdown",
        config = function ()
            pequire("configs.nabla")
        end,
    })
    use({ "lukas-reineke/headlines.nvim",
        config = function ()
            require("headlines").setup({})
        end
    })
    --}}}

    --}}}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
