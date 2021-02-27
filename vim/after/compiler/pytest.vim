if exists("current_compiler")
  finish
endif

let current_compiler = "pytest"

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=pytest\ -vvs\ $*
" CompilerSet errorformat=/app/%f:%l

let &cpo = s:cpo_save
unlet s:cpo_save
