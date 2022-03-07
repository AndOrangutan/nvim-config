# Quboid Vim


## Requirements

- Ueberzug
- ripgrep
- fd 
- nonicons

## Todo

- [ ] Refactor
    - [ ] Build it from the README.md first.
    - [ ] Focused focused support for required languages.
        - C/C++, C#, Java, Rust, Lua, Javascript
    - [ ] Add pcalls to make it break stably
    - [ ] Focus on modularity.

### Plugins

TODO:
- Completion
    - [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
- LSP
    - [jose-elias-alvarez/nvim-lsp-ts-utils](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils)
    - [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) -  LSP signature hint as you type.
    - [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite language.
    - [ldelossa/litee.nvim](https://github.com/ldelossa/litee.nvim) -  Neovim's missing IDE features.
    - [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) -  Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls 

| Val | Level                   |
|-----|-------------------------|
| (1) | Plugin Manager          |
| (2) | Helper Dependencies     |
| (3) | Core Components         |
| (4) | Core Plugins            |
| (5) | Other Plugins           |

- Plugin Manager (1)
    - [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config.

- Helpers (2)
    - [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim) - [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete.
    - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    - [yamatsum/nvim-nonicons](https://github.com/yamatsum/nvim-nonicons) -  Icon set using nonicons for neovim plugins and settings.
        - [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) -  lua `fork` of vim-web-devicons for neovim.
    - [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim) -  Fix CursorHold Performance.

- Core
    - Keybinding (3)
        - [folke/which-key.nvim](https://github.com/folke/which-key.nvim) - Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
        - [mrjones2014/legendary.nvim](https://github.com/mrjones2014/legendary.nvim) - A legend for your keymaps, commands, and autocmds, with which-key.nvim integration (requires Neovim nightly).
    - Highlighting (3)
        - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -  Nvim Treesitter configurations and abstraction layer.
            - [MDeiml/tree-sitter-markdown](https://github.com/MDeiml/tree-sitter-markdown) -  A markdown grammar for tree-sitter.
    - Picker (3)
        - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Find, Filter, Preview, Pick. All lua, all the time.
            - [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) -  FZF sorter for telescope written in c.
            - [nvim-telescope/telescope-media-files.nvim](https://github.com/nvim-telescope/telescope-media-files.nvim) - Telescope extension to preview media files using Ueberzug.
            - [rudism/telescope-dict.nvim]()
            - [https://code.sitosis.com/rudism/telescope-dict.nvim](https://code.sitosis.com/rudism/telescope-dict.nvim) - A Telescope extension to open a list of synonyms with definitions for a word.
    - LSP (3)
        - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) -  Quickstart configurations for the Nvim LSP client.
        - [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) -  Neovim plugin that allows you to seamlessly manage LSP servers with :LspInstall. With full Windows support!
        - [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) -  Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
        - [tami5/lspsaga.nvim](https://github.com/tami5/lspsaga.nvim)- The neovim LSP UI.
        - [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
        - [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim) - Standalone UI for nvim-lsp progress.
    - Editing
        - [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs for neovim written by lua.
        - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to autoclose and auto rename html tag.
        - [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim) - Tabout plugin for neovim.
        - [numToStr/Comment.nvim](https://github.com/numtostr/comment.nvim) - Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more.
    - Window Management (3)
        - [beauwilliams/focus.nvim](https://github.com/beauwilliams/focus.nvim) - Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua. A full suite of window management enhancements. Vim splits on steroids!
        - [luukvbaal/stabilize.nvim](https://github.com/luukvbaal/stabilize.nvim) - Neovim plugin to stabilize window open/close events.
    - Terminal (3)
        - [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - A neovim lua plugin to help easily manage multiple terminal windows.
    - Git (3)
        - [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers
        - [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) - Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    - Movement (3)
        - [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim) - Neovim motions on speed!

- General UI (4)
    - [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) -  Indent guides for Neovim 
    - [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) - A fancy, configurable, notification manager for NeoVim.
    - [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) - Smooth scrolling neovim plugin written in lua.
    - [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) - Hlsearch Lens for neovim.
    - [petertriho/nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) -  Extensible Neovim Scrollbar.
    - [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) -  A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    - [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) -  A snazzy bufferline for Neovim.
    - [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) -  A file explorer tree for neovim written in lua.
    - [anuvyklack/pretty-fold.nvim](https://github.com/anuvyklack/pretty-fold.nvim) - Foldtext customization and folded region preview.
    - [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) -  The fastest Neovim colorizer.
    - [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) -  a lua powered greeter like vim-startify / dashboard-nvim.
    - [Pocco81/TrueZen.nvim](https://github.com/Pocco81/TrueZen.nvim) - Clean and elegant distraction-free writing for NeoVim.

- Completion (4)
    - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) -  A completion plugin for neovim coded in Lua.
        - add others
    - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet ENgine for Neovim written in lua.
    - [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) -  Set of preconfigured snippets for different languages.
    -

- Colorschemes (5)
    - [ful1e5/onedark.nvim](https://github.com/ful1e5/onedark.nvim) -  Atom's iconic One Dark theme for Neovim, written in Lua.
