require'sniprun'.setup({
  borders = 'solid',              --# display borders around floating windows
  display = {
    "Terminal",
    "VirtualTextOk",
    "VirtualTextErr",
  }
})

vim.cmd[[autocmd TermOpen * setlocal nonu]]
