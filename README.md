# Quboid Vim

~~test~~

$\frac{\pi}{\pi}$

## Requirements

- Ueberzug
- ripgrep
- fd 
- nonicons
-- paru -S angularls gopls tsserver flow bashls dockerls julials pylsp pyright jedi_language_server jdtls sumneko_lua vimls html jsonls solargraph cssls yamlls clangd ccls sqls denols graphql dartls dotls kotlin_lanuage_server nimls intelephense vuels phpactor omnisharp r_language_server rust_analyzer terraformls svelte texlab conjure_lsp elixirls sourcekit fsautocomplete vls hls

## Todo

- [ ] fold mode switcher function with pretty notification
- [ ] Refactor
    - [ ] Build it from the README.md first.
    - [ ] Make code actions purple
    - [ ] Focused focused support for required languages.
        - C/C++, C#, Java, Rust, Lua, Javascript
    - [ ] Add pcalls to make it break stably
    - [ ] Focus on modularity.

### Lsp

-- paru -S angularls gopls tsserver flow bashls dockerls julials pylsp pyright jedi_language_server jdtls sumneko_lua vimls html jsonls solargraph cssls yamlls clangd ccls sqls denols graphql dartls dotls kotlin_lanuage_server nimls intelephense vuels phpactor omnisharp r_language_server rust_analyzer terraformls svelte texlab conjure_lsp elixirls sourcekit fsautocomplete vls hls

```bash
lskjdflsdjflkjparu -S arduino-cli clang cmake-language-server deno godot gopls jdtls kotlin ltex-ls-bin omnisharp-roslyn phpactor python-lsp-server rust-analyzer sqls lua-language-server
cargo install asm-lsp
npm install -g "awk-language-server@>=0.5.2" @angular/language-server vscode-langservers-extracted awk-language-server bash-language-server dockerfile-language-server-nodejs graphql-language-service-cli intelephense vls typescript typescript-language-server vim-language-server
```

### Plugins

TODO:
- https://github.com/editorconfig/editorconfig-vim
- Completion
    - [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
- LSP
    - [jose-elias-alvarez/nvim-lsp-ts-utils](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils)
    - [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) -  LSP signature hint as you type.
    - [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite language.
    - [ldelossa/litee.nvim](https://github.com/ldelossa/litee.nvim) -  Neovim's missing IDE features.
    - [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) -  Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls 
    - https://github.com/b0o/SchemaStore.nvim 
    -

| Val | Level                   |
|-----|-------------------------|
| (0) | Plugin Manager          |
| (1) | Helper/Dependencies     |
| (2) | Core Plugins            |
| (3) | Other Plugins           |

- Plugin Manager (1)
    - [x] [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config.

- Helpers (2)
    - [x] [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim) - [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete.
    - [x] [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    - [ ] [yamatsum/nvim-nonicons](https://github.com/yamatsum/nvim-nonicons) -  Icon set using nonicons for neovim plugins and settings.
      - [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) -  lua `fork` of vim-web-devicons for neovim.
    - [x] [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim) -  Fix CursorHold Performance.
- Core Plugins (3)
    - Keybinding
        - [x] [folke/which-key.nvim](https://github.com/folke/which-key.nvim) - Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
        - [x] [mrjones2014/legendary.nvim](https://github.com/mrjones2014/legendary.nvim) - A legend for your keymaps, commands, and autocmds, with which-key.nvim integration (requires Neovim nightly) 
    - Treesitter
        - [x] [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer.
            - [ ] [MDeiml/tree-sitter-markdown](https://github.com/MDeiml/tree-sitter-markdown) - A markdown grammar for tree-sitter

    - LSP
        - Setup
            - [ ] [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the Nvim LSP client.
                - [ ] [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) - LSP signature hint as you type.
            - [ ] [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) -  Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

    - Completion
        - [ ] [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion plugin for neovim coded in Lua.
            - [ ] [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
            - [ ] [petertriho/cmp-git](https://github.com/petertriho/cmp-git)
            - [ ] [lukas-reineke/cmp-rg](https://github.com/lukas-reineke/cmp-rg)
            - [ ] [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
            - [ ] [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
            - [ ] [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
            - [ ] [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
            - [ ] [lukas-reineke/cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator)
            - [ ] [hrsh7th/cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol)
            - [ ] [ray-x/cmp-treesitter](https://github.com/ray-x/cmp-treesitter)
            - [ ] [andersevenrud/cmp-tmux](https://github.com/andersevenrud/cmp-tmux)
            - [ ] [uga-rosa/cmp-dictionary](https://github.com/uga-rosa/cmp-dictionary)
            - [ ] [David-Kunz/cmp-npm](https://github.com/David-Kunz/cmp-npm)
            - [ ] [kdheepak/cmp-latex-symbols](https://github.com/kdheepak/cmp-latex-symbols)
            - [ ] [hrsh7th/cmp-calc](https://github.com/hrsh7th/cmp-calc)
            - [ ] [tzachar/cmp-fuzzy-buffer](https://github.com/tzachar/cmp-fuzzy-buffer) 
            - [ ] [aspeddro/cmp-pandoc.nvim](https://github.com/aspeddro/cmp-pandoc.nvim) 
            - [ ] [dmitmel/cmp-cmdline-history](https://github.com/aspeddro/dmitmel/cmp-cmdline-history) 
        - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - A snippet engine for Neovim written in Lua.
        - [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Set of preconfigured snippets for different languages.
        - UI
            - [weilbith/nvim-code-action-menu](https://github.com/weilbith/nvim-code-action-menu) -  Pop-up menu for code actions to show meta-information and diff preview.
    - Picker
        - [ ] [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Find, Filter, Preview, Pick. All lua, all the time.
            - [ ] [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
            - [ ] [nvim-telescope/telescope-media-files.nvim](https://github.com/nvim-telescope/telescope-media-files.nvim)
        - [x] [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) - Neovim plugin to improve the default vim.ui interfaces.
    - Features
        - Scrolling
            - [x] [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) - Smooth scrolling neovim plugin written in lua.
    - Core UI Components
        - Icons
            - [x] [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - lua `fork` of vim-web-devicons for neovim.
            - [x] [yamatsum/nvim-nonicons](https://github.com/yamatsum/nvim-nonicons) - Icon set using nonicons for neovim plugins and settings.
        - Notifications
            - [x] [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) - A fancy, configurable, notification manager for Neovim.
        - Status Line
            - [x] [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure neovim sstatusline plugin written in pure lua.
        - Tabline
            - [x] [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - A snazzy bufferline for Neovim.
        - File Explorer
            - [x] [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - A file explorer tree for neovim written in lua.
        - Lister
            - [x] [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
        - Terminal
            - [ ] [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - A neovim lua plugin to help easily manage multiple terminal windows.
        - Dashboard
            - [ ] [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) - A fast and highly customizable greeter like vim-startify/dashboard-nvim for Neovim.
        - Symbols Outline
            - [x] [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
    - Window Management
        - [ ] [luukvbaal/stabilize.nvim](https://github.com/luukvbaal/stabilize.nvim) - Neovim plugin to stabilize window open/close events.
    - DAP
    - Fomatting 
        - Auto Formatting
            - [ ] [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs for neovim written by lua.
            - [ ] [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to auto close and auto rename html tag.
        - Manual Formatting
            - ADD COMMENT PLUGIN <!-- TODO: add comment plugin-->
            - [ ] [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth) - sleuth.vim: Heuristically set buffer options.
    - Movement 
        - [ ] [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim) - Neovim motions on speed! 
    - Version Control
        - Git
            - [ ] [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git Integration for buffers.
            - [ ] [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) - Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
- Other Plugins (BLOAT) (4)
    - Colorschemes
        - [ ] [ful1e5/onedark.nvim](https://github.com/ful1e5/onedark.nvim) - Atom's iconic One Dark theme for Neovim, written in Lua.
    - Other UI Components
        - Scrollbar
            - [ ] [petertriho/nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) - Extensible Neovim Scrollbar.
        - Search
            - [ ] [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) -  Hlsearch Lens for Neovim.
        - Folds
            - [ ] [anuvyklack/pretty-fold.nvim](https://github.com/kyazdani42/nvim-tree.lua) - A file tree for neovim written in lua.
        - Color Highlighter
            - [ ] [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter for Neovim which has no external dependencies!
        - Indent Guides
            - [ ] [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides for Neovim.
        - Zen/Focus Mode
            - [ ] [Pocco81/TrueZen.nvim](https://github.com/Pocco81/TrueZen.nvim) - Clean and elegant distraction-free writing for Neovim.
        - Context
            - [ ] [romgrk/nvim-treesitter-context](https://github.com/romgrk/nvim-treesitter-context) - Lightweight alternative to context.vim implemented with nvim-treesitter.

    - Development
        - General
            - [ ] [michaelb/sniprun)](https://github.com/michaelb/sniprun) - A neovim plugin to run lines/blocs of code (independently of the rest of the file), supporting multiples languages.
            - [ ] [metakirby5/codi.vim](https://github.com/metakirby5/codi.vim) - The interactive scratchpad for hackers.
        - Lua
            - [ ] [folke/lua-dev.nvim](https://github.com/folke/lua-dev.nvim) - Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    - Note Taking
        - General
            - [ ] [jbyuki/nabla.nvim](https://github.com/jbyuki/nabla.nvim) - Take your scientific notes in Neovim.
        - Markdown
            - [mickael-menu/zk-nvim](https://github.com/mickael-menu/zk-nvim) - Neovim extension for zk.
            - [ ] [dkarter/bullets.vim](https://github.com/dkarter/bullets.vim) - Bullets.vim is a vim/nvim plugin for automated bullet lists.
            - [ ] [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - markdown preview plugin for (neo)vim.
            - [ ] [ekickx/clipboard-image.nvim](https://github.com/ekickx/clipboard-image.nvim) - Neovim Lua plugin to paste image from clipboard
            - [ ] [lukas-reineke/headlines.nvim](https://github.com/lukas-reineke/headlines.nvim) -  This plugin adds 3 kind of horizontal highlights for text filetypes, like `markdown`, `vimwiki` and `orgmode` 
