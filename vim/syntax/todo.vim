syn match taskOpen "^\s*\[ \] .*$"
syn match taskPrio "^\s*\[ \] !.*$"
syn match taskDone "^\s*\[x\] .*$"

hi def link taskDone Comment
hi def link taskPrio Todo
"hi def link taskOpen Todo
