" https://gist.github.com/suewonjp/c9bc75605d4ead232261b1cdc0ef4fb6

if exists("g:did_plugin_toggle_quickfix")
  finish
endif
let g:did_plugin_toggle_quickfix = 1

function! s:ToggleQuickfix()
  let l:nr =  winnr("$")
  if l:nr == 1
      copen
  else
      cclose
  endif
endfunction

command! ToggleQuickfix call s:ToggleQuickfix()

function! s:ToggleLocList()
  let l:nr =  winnr("$")
  if l:nr == 1
      lopen
  else
      lclose
  endif
endfunction

command! ToggleLocList call s:ToggleLocList()
