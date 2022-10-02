require("defaults.options")

-- TODO: move this lol
--
vim.cmd[[
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
]]

require("colorschemes")

vim.cmd[[colorscheme onedark]]

require("plugins")

require("defaults.autocmds")


<<<<<<< HEAD

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
=======
>>>>>>> config-rewrite
