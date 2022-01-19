
vim.cmd[[
fun! TabSpaceDouble() range
  %s;^\(\s\+\);\=repeat(' ', len(submatch(0))*2);g
  echo "Doubled Tab Spacing"
endfun

fun! TabSpaceHalve() range
  %s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g
  echo "Halve Tab Spacing"
endfun
]]
