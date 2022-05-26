
require("defaults.options")
require("utils")

local pequire = require("utils").pequire


require("plugins")



require("config.which-key")
require("config.legendary")
require("config.mapx")

require("config.treesitter")

-- Core Util
require("config.notify")
require("config.nonicons")

-- Picker
require("config.telescope")
require("config.dressing")


-- LSP
require("config.lspconfig")
require("config.lspsignature")
require("config.null-ls")


--require("defaults.options")
require("defaults.keybindings")
require("defaults.commands")
require("defaults.abbreviations")
require("defaults.autocmds")



require("colorscheme")

require("config.lualine")
require("config.bufferline")
require("config.trouble")
require("config.scrollbar")

require("config.kommentary")
require("config.autopairs")
--require("config.tabout")

require("config.cmp")
require("config.luasnip")
require("config.tree")
require("config.pretty-fold")
require("config.colorizer")
require("config.toggleterm")
require("config.indent-blankline")
require("config.diffview")
require("config.stabilize")

----require("config.markdown")
require("config.gitsigns")
require("config.nabla")
require("config.alpha")
require("config.truezen")
require("config.neorg")
--require("config.focus")
require("config.hlslens")
require("config.hop")
require("config.dap")
--require("config.mdeval")
require("config.mkdnpreview")
require("config.clipboardimg")
require("config.bullets")

require("config.codi")
require('config.due')
