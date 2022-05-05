vim.cmd [[set runtimepath=$VIMRUNTIME]]
vim.cmd [[set packpath=/tmp/nvim/site]]
local package_root = '/tmp/nvim/site/pack'
local install_path = package_root .. '/packer/start/packer.nvim'
local function load_plugins()
  require('packer').startup {
    {
      'wbthomason/packer.nvim',
      {
        'nvim-telescope/telescope.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
      },
      -- ADD PLUGINS THAT ARE _NECESSARY_ FOR REPRODUCING THE ISSUE
    "ful1e5/onedark.nvim",
    },
    config = {
      package_root = package_root,
      compile_path = install_path .. '/plugin/packer_compiled.lua',
      display = { non_interactive = true },
    },
  }
end
_G.load_config = function()
  require('telescope').setup()
  require('telescope').load_extension('fzf')
  -- ADD INIT.LUA SETTINGS THAT ARE _NECESSARY_ FOR REPRODUCING THE ISSUE
  -- I JUST ADDED THIS SIGNCOLUMN LINE

 
    require("onedark").setup({
        comment_style = "italic",
        keyword_style = "italic",
        function_style = "bold",
        msg_area_style = "italic",
        variable_style = "NONE",
        dark_float = true,
        dark_sidebar = true,
        hide_end_of_buffer = false,
        hide_inactive_statusline = true,
        highlight_linenumber = false,
        lualine_bold = true,
        transparent = false,
        transparent_sidebar = false,

        sidebars = {"qf", "vista_kind", "terminal", "packer"},

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        --colors = {hint = "orange", error = "#ff0000"},
        -- Overwrite the highlight groups
        overrides = function(c)
            return {
                htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
                Folded = { fg = c.fg_dark, bg = c.bg },
                DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
                -- this will remove the highlight groups
                TSField = {},
            }
        end
    })
    local bg = "#21252b"
    local fg = "#abb2bf"
    local promptbg = "#2c313a"
    local prompttitle = "#e06c75"
    local previewtitle = "#98c379"
    vim.defer_fn(function()
        vim.api.nvim_set_hl(0, "TelescopeBorder", {fg = bg, bg = bg})
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg = promptbg, bg = promptbg})
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", {fg = fg, bg = promptbg})
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {fg = prompttitle, bg = promptbg})
        vim.api.nvim_set_hl(0, "TelescopeNormal", {bg = bg})
        vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {fg = bg, bg = previewtitle})
        vim.api.nvim_set_hl(0, "TelescopePromptTitle", {fg = bg, bg = prompttitle})
        vim.api.nvim_set_hl(0, "TelescopeResultTitle", {fg = bg, bg = bg})
        vim.api.nvim_set_hl(0, "TelescopeSelection", {bg = promptbg})
    end, 101)
    local set = vim.o
    set.listchars       = "eol:¬"

    set.fillchars       = "fold:━"
    --let.do_filetype_lua = 1
    
    -- Saner defaults
    set.termguicolors   = true
    set.timeoutlen      = 500
    set.clipboard       = "unnamedplus"
    set.mouse           = "a"
    set.errorbells      = false
    set.encoding        = "utf-8"
    set.completeopt     = "menu,menuone,noselect"
    -- Visual
    set.list            = true
    set.number          = true
    set.relativenumber  = true
    set.wrap            = false
    set.showmode        = false
    set.conceallevel    = 2
    set.foldmethod      = "marker"
    -- Placement
    set.scrolloff       = 16
    set.sidescrolloff   = 16
    set.pumheight       = 16
    set.splitbelow      = true
    set.splitright      = true
    -- Formatting
    set.tabstop         = 4
    set.softtabstop     = 4
    set.shiftwidth      = 4
    set.shiftround      = true
    set.expandtab       = true
    set.smarttab        = true
    set.smartindent     = true
    set.autoindent      = true
    set.signcolumn      = "yes:1"
    -- Search
    set.ignorecase      = true
    set.incsearch       = true
    set.smartcase       = true
    -- Boring stuff
    set.hidden          = true
    set.backup          = false
    set.swapfile        = false
    set.undofile        = true



  vim.opt.signcolumn = "yes:1"
end
if vim.fn.isdirectory(install_path) == 0 then
  print("Installing Telescope and dependencies.")
  vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', install_path }
end
load_plugins()
require('packer').sync()
vim.cmd [[autocmd User PackerComplete ++once echo "Ready!" | lua load_config()]]
