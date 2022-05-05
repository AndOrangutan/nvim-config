vim.cmd [[set runtimepath=$VIMRUNTIME]]
vim.cmd [[set packpath=/tmp/nvim/site]]
local package_root = '/tmp/nvim/site/pack'
local install_path = package_root .. '/packer/start/packer.nvim'
local function load_plugins()
  require('packer').startup {
    {
      'wbthomason/packer.nvim',
      -- ADD PLUGINS THAT ARE _NECESSARY_ FOR REPRODUCING THE ISSUE
    --"ful1e5/onedark.nvim",
    "nvim-lualine/lualine.nvim",
     
    },
    config = {
      package_root = package_root,
      compile_path = install_path .. '/plugin/packer_compiled.lua',
      display = { non_interactive = true },
    },
  }
end
_G.load_config = function()
  -- ADD INIT.LUA SETTINGS THAT ARE _NECESSARY_ FOR REPRODUCING THE ISSUE
  -- I JUST ADDED THIS SIGNCOLUMN LINE
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
 
    local set = vim.o
    set.listchars       = "eol:¬"

    set.fillchars       = "fold:━"
    --let.do_filetype_lua = 1

    -- Saner defaults
    --set.termguicolors   = true
    --set.timeoutlen      = 500
    --set.clipboard       = "unnamedplus"
    --set.mouse           = "a"
    --set.errorbells      = false
    --set.encoding        = "utf-8"
    --set.completeopt     = "menu,menuone,noselect"
    ---- Visual
    --set.list            = true
    --set.number          = true
    --set.relativenumber  = true
    --set.wrap            = false
    --set.showmode        = false
    --set.conceallevel    = 2
    --set.foldmethod      = "marker"
    ---- Placement
    --set.scrolloff       = 16
    --set.sidescrolloff   = 16
    --set.pumheight       = 16
    --set.splitbelow      = true
    --set.splitright      = true
    ---- Formatting
    --set.tabstop         = 4
    --set.softtabstop     = 4
    --set.shiftwidth      = 4
    --set.shiftround      = true
    --set.expandtab       = true
    --set.smarttab        = true
    --set.smartindent     = true
    --set.autoindent      = true
    --set.signcolumn      = "yes:1"
    ---- Search
    --set.ignorecase      = true
    --set.incsearch       = true
    --set.smartcase       = true
    ---- Boring stuff
    --set.hidden          = true
    --set.backup          = false
    --set.swapfile        = false
    --set.undofile        = true

end



if vim.fn.isdirectory(install_path) == 0 then
  vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', install_path }
end
load_plugins()
require('packer').sync()
vim.cmd [[autocmd User PackerComplete ++once echo "Ready!" | lua load_config()]]
