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
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
--}}}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use { "wbthomason/packer.nvim" }            -- Have packer manage itself
    use { "nvim-lua/popup.nvim" }               -- An implementation of the Popup API from vim in Neovim
    use { "nvim-lua/plenary.nvim" }             -- Useful lua functions used ny lots of plugins


    use { "nvim-treesitter/nvim-treesitter",    -- Nvim Treesitter configurations and abstraction layer
        run = ":TSUpdate",
    }

    --{{{ Theme
    use { "ful1e5/onedark.nvim" }               -- Atom's iconic One Dark theme for Neovim, written in Lua
    --}}}

--{{{ Keybinds
    use { "folke/which-key.nvim" }              -- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
    use { "b0o/mapx.nvim" }                     -- A better way to create key mappings in Neovim.
    --}}}

    --{{{ UI
    use { "yamatsum/nvim-nonicons",             -- Icon set using nonicons for neovim plugins and settings
        requires = { "kyazdani42/nvim-web-devicons" },
    }
    use { "nvim-lualine/lualine.nvim",          -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
        requires = { "kyazdani42/nvim-web-devicons" },
    }
    use { "akinsho/bufferline.nvim",            -- A snazzy bufferline for Neovim
        requires = { "kyazdani42/nvim-web-devicons" },
    }


    --use { "akinsho/bufferline.nvim",
    --    requires = {"kyazdani42/nvim-web-devicons"},
    --}
    --}}}

    --{{{ Telescope
    use { "nvim-telescope/telescope.nvim",      -- Find, Filter, Preview, Pick. All lua, all the time.
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim",   -- FZF sorter for telescope written in c
        run = "make",
    }
    --}}}

--{{{ LSP
use { "neovim/nvim-lspconfig" }                 --  Quickstart configurations for the Nvim LSP client
use { "williamboman/nvim-lsp-installer" }       -- Companion plugin for nvim-lspconfig that allows you to seamlessly manage LSP servers locally with :LspInstall
use { "tami5/lspsaga.nvim" }                    -- Lspsaga is light-weight lsp plugin based on neovim built-in lsp with highly a performant UI
use {"folke/trouble.nvim",                      -- -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
  requires = "kyazdani42/nvim-web-devicons",
}
use { "jose-elias-alvarez/null-ls.nvim" }       -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

--}}}

--{{{ Git
use { "lewis6991/gitsigns.nvim",                --  Git integration for buffers
    requires = { "nvim-lua/plenary.nvim" },
}
--}}}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
