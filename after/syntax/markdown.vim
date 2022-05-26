
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal
syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends

" Checkboxes
"syn match todoCheckbox "\[ ] .\+" contains=inProgressMark
"syn match todoCheckbox "\[ ]" conceal cchar= 
"syn match todoCheckbox "\[x] .\+" contains=itemCompleteMark
"syn match todoCheckbox "\[x]" conceal cchar= 

hi def link todoCheckbox Todo

highlight Conceal guibg=NONE guifg=NONE
"highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

setlocal cole=2

" Todo
syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[\s\]'hs=e-4 conceal cchar= 
" Done
syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[X\]'hs=e-4 conceal cchar= 
" Uncomplete
syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[-\]'hs=e-4 conceal cchar= 
" Started
syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[\.\]'hs=e-4 conceal cchar=⊡ 
" Ongoing
syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[o\]'hs=e-4 conceal cchar= 
