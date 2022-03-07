local fn  = vim.fn

--{{{ Auto install and auto update on write for Packer
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "solid" }
        end,
    },
}
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

-- Github Description
-- DAP 
-- phaaazon/hop.nvim Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
--

--}}}

    --{{{ Plugin Management
    use { "wbthomason/packer.nvim" }            -- Have packer manage itself
    --}}}

    --{{{ Helpers 
    use { "nvim-lua/popup.nvim" }               -- An implementation of the Popup API from vim in Neovim
    use { "nvim-lua/plenary.nvim" }             -- Useful lua functions used ny lots of plugins
    --}}}

    --{{{ Treesitter
    use { "nvim-treesitter/nvim-treesitter",    -- Nvim Treesitter configurations and abstraction layer
        run = ":TSUpdate",
        commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
    }
    use { "MDeiml/tree-sitter-markdown"}
    --}}}

    --{{{ Theme
    use { "ful1e5/onedark.nvim" }               -- Atom's iconic One Dark theme for Neovim, written in Lua
    --}}}

    --{{{ Keybinds 
    use { "folke/which-key.nvim" }              -- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
    use { "b0o/mapx.nvim" }                     -- A better way to create key mappings in Neovim.
    --}}}

    --{{{ UI
    use { "rcarriga/nvim-notify"}               -- A fancy, configurable, notification manager for Neovim
    use { "yamatsum/nvim-nonicons",             -- Icon set using nonicons for neovim plugins and settings
        requires = { "kyazdani42/nvim-web-devicons" },
    }
    use { "karb94/neoscroll.nvim" }             -- Smooth scrolling neovim plugin written in lua
    use { "kevinhwang91/nvim-hlslens" }         -- Hlsearch Lens for Neovim
    use { "petertriho/nvim-scrollbar" }         -- Extensible Neovim Scrollbar
    use { "luukvbaal/stabilize.nvim" }          -- Neovim plugin to stabilize buffer content on window open/close events
    use { "nvim-lualine/lualine.nvim",          -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
        requires = { "kyazdani42/nvim-web-devicons" },
    }
    use { "akinsho/bufferline.nvim",            -- A snazzy bufferline for Neovim
        requires = { "kyazdani42/nvim-web-devicons" },
    }
    use { "kyazdani42/nvim-tree.lua",           -- A file explorer tree for neovim written in lua
        requires = { "kyazdani42/nvim-web-devicons" },
    }

    use { "anuvyklack/pretty-fold.nvim" }       -- Foldtext customization and folded region preview in Neovim.
    use { "norcalli/nvim-colorizer.lua" }       -- The fastest Neovim colorizer.

    use { "akinsho/toggleterm.nvim" }           -- A neovim lua plugin to help easily manage multiple terminal windows
    use { "lukas-reineke/indent-blankline.nvim" }   -- Indent guides for Neovim
    use { "goolord/alpha-nvim" }                -- A lua powered greeter like vim-startify

    use { "Pocco81/TrueZen.nvim" }              -- Clean and elegant distraction-free writing for Neovim
    --}}}

    --{{{ Telescope
    use { "nvim-telescope/telescope.nvim",      -- Find, Filter, Preview, Pick. All lua, all the time.
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim",   -- FZF sorter for telescope written in c
        run = "make",
    }
    use { "nvim-telescope/telescope-media-files.nvim" } -- Telescope extension to preview media files using Ueberzug
    use { "rudism/telescope-dict.nvim" }                -- A Telescope extension to open a list of synonyms with definitions for a word.
    --}}}

    --{{{ LSP
    use { "neovim/nvim-lspconfig" }                 --  Quickstart configurations for the Nvim LSP client
    use { "williamboman/nvim-lsp-installer" }       -- Companion plugin for nvim-lspconfig that allows you to seamlessly manage LSP servers locally with :LspInstall
    use { "tami5/lspsaga.nvim" }                    -- Lspsaga is light-weight lsp plugin based on neovim built-in lsp with highly a performant UI
    use {"folke/trouble.nvim",                      -- -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
      requires = "kyazdani42/nvim-web-devicons",
    }
    use { "jose-elias-alvarez/null-ls.nvim" }       -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    use { "j-hui/fidget.nvim" }                     -- Standalone UI for nvim-lsp progress
    use { "mfussenegger/nvim-jdtls" }               -- Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls

    --}}}

    --{{{ Git
    use { "lewis6991/gitsigns.nvim",                --  Git integration for buffers
        requires = { "nvim-lua/plenary.nvim" },
    }

    use { "sindrets/diffview.nvim" }                -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev. 
    --}}}

    --{{{ Completion
    use { "hrsh7th/nvim-cmp",                       -- A completion plugin for neovim coded in Lua.
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
    }

    use { "L3MON4D3/LuaSnip" }                      -- Snippet Engine for Neovim written in Lua.
    use { "rafamadriz/friendly-snippets" }          -- Set of preconfigured snippets for different languages. 

    --}}}

    --{{{ Formatting
    use { "windwp/nvim-autopairs" }                 -- autopairs for neovim written by lua
    use { "b3nj5m1n/kommentary" }                   -- Neovim commenting plugin, written in lua.
    --}}}

    --{{{ Window Management
    use { "beauwilliams/focus.nvim" }               -- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim writtin in Lua. A full suite of window management enhancements. Vim splits on steroids!
    --}}}

--{{{ Movement 
    use { "abecodes/tabout.nvim",           -- Tabout plugin for neovim
        wants = {"nvim-treesitter/nvim-treesitter"},
        --after = {"hrsh7th/nvim-cmp"}
    }
    use { "phaazon/hop.nvim"}           --  Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
--}}}

    --{{{ Note Taking 
    --Markdown
    --use { "davidgranstrom/nvim-markdown-preview" }  -- Markdown preview for neovim using pandoc and live-server
    use { "preservim/vim-markdown" }                -- Markdown Vim Mode
    use { "jakewvincent/mkdnflow.nvim" }        -- Tools for markdown notebook nvavigation and management
    use { "jbyuki/nabla.nvim" }                 -- Take your scientific notes in Neovim
    use { "jubnzv/mdeval.nvim" }                -- A neovim plugin that evaluates code blocks inside documents
    use {'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        ft = 'markdown',
    }
    use { "ekickx/clipboard-image.nvim"}

    -- Neorg
    use { "nvim-neorg/neorg",                   -- Modernity meets insane extenisbility. The future of organizing your life in Neovim
        requires = {
            "nvim-neorg/neorg-telescope",
            "nvim-lua/plenary.nvim"
        },
        --after = "nvim-treesitter",
    }
    use { "KeitaNakamura/tex-conceal.vim" }     -- A vim plugin extends th econceal feature for LateX
    --}}}

    --{{{ DAP 
    use { "mfussenegger/nvim-dap",              -- Debug Adapter Protocol cliet implementation for Neovim
        requires = { 
            "rcarriga/nvim-dap-ui",
            --"Pocco81/DAPInstall.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "jbyuki/one-small-step-for-vimkind",
        },
    }
--}}}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

