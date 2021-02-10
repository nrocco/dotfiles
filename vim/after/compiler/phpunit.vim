if exists("current_compiler")
  finish
endif

let current_compiler = "phpunit"

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=phpunit\ $*
CompilerSet errorformat=/app/%f:%l

let &cpo = s:cpo_save
unlet s:cpo_save
