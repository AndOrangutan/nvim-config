local pequire = require("utils").pequire


vim.cmd[[
fun! TabSpaceDouble() range
  %s;^\(\s\+\);\=repeat(' ', len(submatch(0))*2);g
  echo "Doubled Tab Spacing"
endfun

fun! TabSpaceHalve() range
  %s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g
  echo "Halve Tab Spacing"
endfun

fun! HandleURL()
    let s:url = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    echo s:url
    if s:url != ""
        silent exec "!xdg-open '"..s:url."'"
    else
        echo "No URL found in line."
    endif
endfun
]]

