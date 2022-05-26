
local fn = vim.fn

local pequire = require("utils").pequire

vim.notify("Hello There Sexy")

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


    --{{{ Plugin Management

    use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
    --}}}

    --{{{ Helpers/Dependencies
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-lua/plenary.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "yamatsum/nvim-nonicons",
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    --}}}

    --{{{ Core Plugins

    --{{{ Keybinding 
    use({ "folke/whichkey.nvim",
        config = function()
            require("which-key").setup()
        end,
        event = "BufWinEnter"
    })
    use({ "mrjones2014/lengendary", -- TODO: Double Check config
        config = function()
            require("legendary").setup()
        end,
        event = "BufWinEnter"
    })
    --}}}
    
    --{{{ Treesitter and other highlighting
    use({ "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    --}}}

    --{{{ Picker
    use({ "ibhagwan/fzf-lua",
        requires = {"kyazdani42/nvim-web-devicons"},
    })

    --}}}

    --}}} End of Core Plugins

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
