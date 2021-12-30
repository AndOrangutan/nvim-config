
local opt = vim.opt
local let = vim.g
local indent_size = 4

let.mapleader = " "

-- Saner defaults
opt.termguicolors   = true
opt.timeoutlen      = 500
opt.clipboard       = "unnamedplus"
opt.mouse           = "a"
opt.errorbells      = false
opt.encoding        = "utf-8"
-- Visual
opt.number          = true
opt.relativenumber  = true
opt.wrap            = false
opt.showmode        = false
opt.conceallevel    = 2
opt.foldmethod      = "marker"
-- Placement
opt.scrolloff       = 16
opt.sidescrolloff   = 16
opt.pumheight       = 16
opt.splitbelow      = true
opt.splitright      = true
-- Formatting
opt.tabstop         = indent_size 
opt.softtabstop     = indent_size
opt.shiftwidth      = indent_size
opt.shiftround      = true
opt.expandtab       = true
opt.smarttab        = true
opt.smartindent     = true
opt.autoindent      = true
-- Search
opt.ignorecase      = true
opt.incsearch       = true
opt.smartcase       = true
-- Boring stuff
opt.hidden          = true
opt.backup          = false
opt.swapfile        = false
opt.undodir         = "$HOME/.nvim/undodir"
opt.undolevels      = 69000
opt.background      = "dark"
opt.updatetime      = 300

