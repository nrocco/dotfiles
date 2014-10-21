function! RunFoodcritic()
  let l:filename=@%
  let l:foodcritic_output=system('foodcritic  -t "~FC001" .')  " | grep '.l:filename)
  let l:foodcritic_list=split(l:foodcritic_output, "\n")

  if len(l:foodcritic_list) > 0
    cexpr l:foodcritic_list
    copen
    exec "nnoremap <silent> <buffer> q :ccl<CR>"
  else
    cclose
    echomsg "All is OK"
  endif
endfunction

set errorformat+=\ %m:\ %f:%l

command! Foodcritic call RunFoodcritic()
