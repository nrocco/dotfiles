if exists("current_compiler")
  finish
endif

let current_compiler = "fuubar"

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=fuubar
CompilerSet errorformat=%f\|\|%l\|\|%m

let &cpo = s:cpo_save
unlet s:cpo_save
