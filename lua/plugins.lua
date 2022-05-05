local fn = vim.fn

local pequire = require("utils").pequire

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
-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    --                              • "none": No border (default).
    --                              • "single": A single line box.
    --                              • "double": A double line box.
    --                              • "rounded": Like "single", but with rounded
    --                                corners ("╭" etc.).
    --                              • "solid": Adds padding by a single whitespace
    --                                cell.
    --                              • "shadow": A drop shadow effect by blending
    --                                with the background.
  
    -- {{{ Todo
    -- Double Check Telescope
    -- Double Check null-ls
    -- https://github.com/metakirby5/codi.vim/blob/master/assets/codi.gif
    -- Github Description
    -- DAP
    -- phaaazon/hop.nvim Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
    -- Surround of some sort
    --

    --}}}
    --{{{ Plugin Management
    use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
    --}}}

    --{{{ Helpers/Dependencies
    use({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim
    use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used ny lots of plugins
    --}}}

    --{{{ Plugins

    --{{{ Keybind
    use({ "folke/which-key.nvim" })
    use({ "mrjones2014/legendary.nvim" })
    use({ "b0o/mapx.nvim" }) -- TODO: Remove
    --}}}

    --{{{ Treesitter
    use({
        "nvim-treesitter/nvim-treesitter", -- Nvim Treesitter configurations and abstraction layer
        run = ":TSUpdate",
    })
    use({ "MDeiml/tree-sitter-markdown" })
    --}}}

    --{{{ Core UI
    use({"kyazdani42/nvim-web-devicons"})
    use({
        "yamatsum/nvim-nonicons", -- Icon set using nonicons for neovim plugins and settings
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({ "rcarriga/nvim-notify" }) -- A fancy, configurable, notification manager for Neovim
    --}}}

    --{{{Picker
    use({
        "nvim-telescope/telescope.nvim", -- Find, Filter, Preview, Pick. All lua, all the time.
        requires = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
            "nvim-telescope/telescope-media-files.nvim",
        },
    })
    --use { "rudism/telescope-dict.nvim" }              :  -- A Telescope extension to open a list of synonyms with definitions for a word.
    use({ "stevearc/dressing.nvim" }) --  Neovim plugin to improve the default vim.ui interfaces.
    --}}}

    --}}}

    --{{{ LSP
    use({ "neovim/nvim-lspconfig", requires = {
        "ray-x/lsp_signature.nvim",
    } })
    use({ "ray-x/lsp_signature.nvim" })
    use({
        "folke/lua-dev.nvim",
        config = function()
            require("lua-dev").setup()
        end,
    })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    })
    use({
        "weilbith/nvim-code-action-menu",
        branch = "feature/add-configuration-to-alternate-window-border",
        cmd = "CodeActionMenu",
        config = function ()
            vim.g.code_action_menu_window_border = "double"
        end,
    })
    --use { "mfussenegger/nvim-jdtls" }

    --}}}

    --{{{ Themes
    use({ "ful1e5/onedark.nvim" }) -- Atom's iconic One Dark theme for Neovim, written in Lua
    --}}}

    --{{{ UI
    use({ "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({ "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
    use { "petertriho/nvim-scrollbar",
        requires = { "kevinhwang91/nvim-hlslens" },
    }

    use({ "karb94/neoscroll.nvim" }) -- Smooth scrolling neovim plugin written in lua
    use({ "kevinhwang91/nvim-hlslens" }) -- Hlsearch Lens for Neovim
    use({ "luukvbaal/stabilize.nvim" }) -- Neovim plugin to stabilize buffer content on window open/close events
    use({
        "kyazdani42/nvim-tree.lua", -- A file explorer tree for neovim written in lua
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    use({ "anuvyklack/pretty-fold.nvim" }) -- Foldtext customization and folded region preview in Neovim.
    use({ "norcalli/nvim-colorizer.lua" }) -- The fastest Neovim colorizer.

    use({ "akinsho/toggleterm.nvim" }) -- A neovim lua plugin to help easily manage multiple terminal windows
    use({ "lukas-reineke/indent-blankline.nvim" }) -- Indent guides for Neovim
    use({ "goolord/alpha-nvim" }) -- A lua powered greeter like vim-startify

    use({ "Pocco81/TrueZen.nvim" }) -- Clean and elegant distraction-free writing for Neovim

    use({ "simrat39/symbols-outline.nvim" })

    use({ "metakirby5/codi.vim",
        cmd = "Codi",
    })
    --}}}

    --{{{ Git
    use({
        "lewis6991/gitsigns.nvim", --  Git integration for buffers
        requires = { "nvim-lua/plenary.nvim" },
    })

    use({ "sindrets/diffview.nvim" }) -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    --}}}

    --{{{ Completion
    use({
        "hrsh7th/nvim-cmp", -- A completion plugin for neovim coded in Lua.
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "petertriho/cmp-git",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
            "ray-x/cmp-treesitter",
            "lukas-reineke/cmp-under-comparator",
            "hrsh7th/cmp-calc",
            "kdheepak/cmp-latex-symbols",
            "uga-rosa/cmp-dictionary",
        },
    })

    use({ "L3MON4D3/LuaSnip" }) -- Snippet Engine for Neovim written in Lua.
    use({ "rafamadriz/friendly-snippets" }) -- Set of preconfigured snippets for different languages.
    use({ "dsznajder/vscode-es7-javascript-react-snippets",
        run = "yarn install --frozen-lockfile && yarn compile"
    })

    --}}}

    --{{{ Formatting
    use({ "windwp/nvim-autopairs" }) -- autopairs for neovim written by lua
    use({ "windwp/nvim-ts-autotag",
        config = function ()
            require('nvim-ts-autotag').setup()
        end,
    }) -- autopairs for neovim written by lua
    use({ "b3nj5m1n/kommentary" }) -- Neovim commenting plugin, written in lua.
    use({"tpope/vim-sleuth"})
    --}}}

    --{{{ Window Management
    --use({ "beauwilliams/focus.nvim" }) -- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim writtin in Lua. A full suite of window management enhancements. Vim splits on steroids!
    --}}}

    --{{{ Movement
    --use({
    --    "abecodes/tabout.nvim", -- Tabout plugin for neovim
    --    wants = { "nvim-treesitter/nvim-treesitter" },
    --    --after = {"hrsh7th/nvim-cmp"}
    --})
    use({ "phaazon/hop.nvim" }) --  Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
    --}}}

    --{{{ Note Taking
    --Markdown
    --use { "davidgranstrom/nvim-markdown-preview" }  -- Markdown preview for neovim using pandoc and live-server
    --use { "preservim/vim-markdown" }                -- Markdown Vim Mode
    --use { "jghauser/follow-md-links.nvim",
    --    config = function()
    --        require('follow-md-links')
    --    end
    --}
    use({
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup()
        end,
    })
    use({ "KeitaNakamura/tex-conceal.vim",
        config = function ()
            vim.cmd[[let g:tex_conceal="abdgm"]]
        end
    })
    use({ "jbyuki/nabla.nvim" }) -- Take your scientific notes in Neovim
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = "markdown" })
    use({ "ekickx/clipboard-image.nvim" })
    use({ "dkarter/bullets.vim" })
    use ({'edluffy/hologram.nvim'})
    -- Neorg
    use({
        "nvim-neorg/neorg", -- Modernity meets insane extenisbility. The future of organizing your life in Neovim
        requires = {
            "nvim-neorg/neorg-telescope",
            "nvim-lua/plenary.nvim",
        },
        --after = "nvim-treesitter",
    })
    --}}}

    --{{{ DAP
    use({
        "mfussenegger/nvim-dap", -- Debug Adapter Protocol cliet implementation for Neovim
        requires = {
            "rcarriga/nvim-dap-ui",
            --"Pocco81/DAPInstall.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "jbyuki/one-small-step-for-vimkind",
        },
    })
    --}}}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
