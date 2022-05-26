
local set = vim.opt
local let = vim.g
local indent_size = 4
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
let.mapleader = " "

vim.cmd[[filetype indent on]]
set.cursorline = false

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
set.tabstop         = indent_size
set.softtabstop     = indent_size
set.shiftwidth      = indent_size
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
vim.cmd[[
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
]]
set.undodir         = "/tmp/.nvim-undodir"
--vim.cmd[[set undodir=$HOME/.nvim/undodir]]
set.undolevels      = 69000
set.history         = 100
set.background      = "dark"
set.updatetime      = 300


vim.cmd[[
:set briopt+=list:-1
]]

vim.g.code_action_menu_window_border = "solid"
