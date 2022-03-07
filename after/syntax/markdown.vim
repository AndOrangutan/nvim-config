
" Checkboxes
syn match inProgress "\[ ] .\+" contains=inProgressMark
syn match inProgressMark "\[ ]" conceal cchar=
syn match itemComplete "\[x] .\+" contains=itemCompleteMark
syn match itemCompleteMark "\[x]" conceal cchar=
